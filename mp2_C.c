#include <stdio.h>
#include <stdlib.h>

extern int asmaccel(double vec1, double vec2, double time);

int main() 
{
	int n;
	printf("Enter number of cars: ");
	scanf("%d", &n);
	
	double matrix[n][3];
	int* results = (int*)malloc(n*sizeof(int));
	
	int i, j;
	for(i = 0; i < n; i++){
		for(j = 0; j < 3; j++){
			printf("Enter value for matrix[%d][%d]: ", i, j);
			scanf("%lf", &matrix[i][j]);
		}
	}
	printf("Matrix values\n");
	for(i = 0; i < n; i++){
		for(j = 0; j < 3; j++){
			printf("%.2lf ", matrix[i][j]);
			if (j==2){
				printf("\n");
			}
		}
	}


	// per row asmaccel() is called 
	for(i = 0; i < n; i++) {
        results[i] = asmaccel(matrix[i][0], matrix[i][1], matrix[i][2]); 
    }
    
	
	printf("Acceleration Results\n");
	for(i = 0; i < n; i++)
		printf("%d\n", results[i]);
	
	
	return 0;
}
