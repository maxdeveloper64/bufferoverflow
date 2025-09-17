#include <stdio.h>
#include <string.h>

void vuln_func() {
	char buffer[256];
	gets(buffer);
}

int main(int argc, char *argv[]) {
	printf("Hi There!\n");
	vuln_func();
	return 0;
}
