#include <stdio.h>
#include <dlfcn.h>

int main(){
	int a, b;
	scanf ("%d", &a);
	
	void* handle = dlopen ("libsoma.so", RTLD_LAZY);
	if (!handle){
		printf ("%s\n", dlerror());
		return 1;
	}

	int (*soma)(int, int) = dlsym (handle, "soma");

	printf ("%d + 5 = %d\n", a, (*soma)(a,5));

	scanf ("%d", &b);

	printf ("%d + %d = %d\n", a, b, (*soma)(a,b));

	dlclose (handle);
	return 0;
}
