#include <stdio.h>


int matrix[2][3] = {{1,2,3}, {4,5,6}};
int line[3] = {1,2,3};

int main(int argc, char *argv[]) {
	int i, j;
	
	printf("main started \n");

	for(i = 0; i < 2; i++) {
		for(j = 0; j < 3; j++) {
			printf("%d:", matrix[i][j]);
		}
		printf("\n");
	}
	printf("%d:\n", *(line + 1));
	printf("=====\n");
	int *ptr = &matrix[0][0];
	for(i = 0; i < 2; i++) {
		for(j = 0; j < 3; j++) {
			//printf("i:%d, j:%d\n", i,j);
			//printf("%d;", **(matrix + ((i*3) + j)));
			printf("%d|", *((ptr + (i*3)) +j));
			//printf("%d-", **(matrix + (1+2)));
		}
		printf("\n");
	}

	for(i = 0; i < 2; i++) {
		for(j = 0; j < 3; j++) {
			printf("i: %d, j: %d", i,j);
			int *pr = *(matrix + (i * 3));
			printf("%d-",*(*(matrix + (i * 3)) + j));
		}
		printf("\n");
	}

	return 0;
}

