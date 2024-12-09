#include <stdio.h>

int main(){
    int arr[10];
    float avg;
    int total = 0;
    for(int i = 0; i < 10; i++){
        scanf("%d", &arr[i]);
        total += arr[i];
    }
    avg = (float)total / 10;
    printf("Average is: %f\n", avg);
    return 0;
}