#include <stdio.h>
#include <string.h>

char senha[9] = "85649721";

int valida_senha (){
	char minha_senha[9];
	scanf ("%s", minha_senha);

	int valido = 1;
	for (int i = 0; i < 9; ++i){
		if (minha_senha[i] != senha[i])
			valido = 0;
	}
	
	return valido;
}

int main (){
	int valido = valida_senha();
	
	if (valido) printf ("Logado\n");
	else printf ("Falha de login\n");

	return 0;
}
