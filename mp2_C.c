#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern int asmaccel(double vec1, double vec2, double time);

int main() 
{
	int n;
	double total_time;
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

	

	for(i = 0; i < n; i++) {
		clock_t begin = clock();
        results[i] = asmaccel(matrix[i][0], matrix[i][1], matrix[i][2]); 
		clock_t end = clock();
		double time_taken = (double)(end - begin) / CLOCKS_PER_SEC;
		total_time += time_taken;
	}
    
	
	


	
	printf("Acceleration Results\n");
	for(i = 0; i < n; i++)
		printf("%d\n", results[i]);
	
	printf("\nTotal execution time of asmaccel(): %.20lfs", total_time);
	
	return 0;
}
