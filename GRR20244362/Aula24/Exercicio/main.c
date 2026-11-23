#include <smmintrin.h> // SSE4.1 (inclui SSE2 e SSSE3)
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

constexpr int NUM_EXEC = 10;
constexpr size_t ALINHAMENTO = sizeof(__m128i); // 16 bytes
constexpr size_t TAM_MATRIZ = 1024;
constexpr size_t LARGURA = sizeof(__m128i) / sizeof(uint32_t); // 4 inteiros
//static_assert(TAM_VETOR % LARGURA == 0, "TAM_VETOR deve ser multiplo de 4");

void produtoEscalar(uint32_t* const* A, uint32_t* const* B, uint32_t** C,
                         size_t linhas, size_t colunas) {
    int tam = TAM_MATRIZ;
    for (size_t i = 0; i < tam; ++i) {
        for (size_t j = 0; j < tam; ++j){
            for (size_t k = 0; k < tam; ++k)
                C[i][j] += A[j][k] * B[k][j];
        }
    }
}

uint32_t** alocaMatriz(size_t linhas, size_t colunas) {
    uint32_t** M = malloc(linhas * sizeof(uint32_t*));
    if (!M) return nullptr;

    for (size_t i = 0; i < linhas; ++i) {
        // Arredonda o tamanho da linha para múltiplo de 16 bytes
        size_t bytes = colunas * sizeof(uint32_t);
        bytes = (bytes + ALINHAMENTO - 1) & ~(ALINHAMENTO - 1);

        M[i] = aligned_alloc(ALINHAMENTO, bytes);
        if (!M[i]) {
            while (i--) free(M[i]);
            free(M);
            return nullptr;
        }
    }
    return M;
}

void liberaMatriz(uint32_t** M, size_t linhas) {
    for (size_t i = 0; i < linhas; ++i) free(M[i]);
    free(M);
}

uint32_t somaMatrizesSSE_ptr(uint32_t* const* A, uint32_t* const* B, uint32_t** C,
                         size_t linhas, size_t colunas) {
    size_t colsVet = colunas - (colunas % LARGURA);

    for (size_t i = 0; i < linhas; ++i) {
        const uint32_t* a = A[i];
        const uint32_t* b = B[i];
        uint32_t*       c = C[i];

        size_t j = 0;
        for (; j < colsVet; j += LARGURA) {
            __m128i va = _mm_load_si128((const __m128i*)(a + j));
            __m128i vb = _mm_load_si128((const __m128i*)(b + j));
            _mm_store_si128((__m128i*)(c + j), _mm_add_epi32(va, vb));
        }
    }
}


int main() {
    uint32_t** A = alocaMatriz(TAM_MATRIZ, TAM_MATRIZ);
    uint32_t** B = alocaMatriz(TAM_MATRIZ, TAM_MATRIZ);
    uint32_t** R = alocaMatriz(TAM_MATRIZ, TAM_MATRIZ);
    if (A == nullptr || B == nullptr || R == nullptr) {
        perror("Falha de alocacao");
        exit(1);
    }

    for (size_t i = 0; i < TAM_MATRIZ; ++i) {
        for (size_t j = 0; j < TAM_MATRIZ; ++j){
            A[i][j] = i % 10;
            B[i][j] = i % 5;
        }
    }

    uint32_t resEsc;
    clock_t t0 = clock();
    for (int i = 0; i < NUM_EXEC; ++i)
        produtoEscalar (A, B, R, TAM_MATRIZ, TAM_MATRIZ);
    double tempoSimples = (double)(clock() - t0) / CLOCKS_PER_SEC;

    uint32_t resSSE;
    t0 = clock();
    for (int i = 0; i < NUM_EXEC; ++i)
        somaMatrizesSSE_ptr(A, B, R, TAM_MATRIZ, TAM_MATRIZ);
    double tempoSSE = (double)(clock() - t0) / CLOCKS_PER_SEC;

    printf("Escalar: %u em %lf s\n", resEsc, tempoSimples);
    printf("SSE: %u em %lf s\n", resSSE, tempoSSE);
    printf("Speedup: %.2fx\n", tempoSimples / tempoSSE);

    liberaMatriz(A, TAM_MATRIZ);
    liberaMatriz(B, TAM_MATRIZ);
    liberaMatriz(R, TAM_MATRIZ);
    return 0;
}