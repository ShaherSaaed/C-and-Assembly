#include <stdio.h>
#include <limits.h>

int main() {
    int arr[10];
    int min = INT_MAX;
    for (int i = 0; i < 10; i++) {
        scanf("%d", &arr[i]);
        if (arr[i] < min) {
            min = arr[i];
        }
    }
    printf("Min element is: %d\n", min);

    return 0;
}