// WAP to generate a timed formation of a 2d matrix
// delay will be 1 sec
// spiral formation

import java.util.Scanner;
import java.util.concurrent.TimeUnit;

class TimedFormation {
    public static void main(String[] args) throws InterruptedException {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the size of the matrix");
        int n = sc.nextInt();
        int[][] arr = new int[n][n];
        int i = 0, j = 0, k = 1, l = 0, m = n - 1;
        while (k <= n * n) {
            for (j = l; j <= m; j++) {
                arr[i][j] = k++;
                TimeUnit.SECONDS.sleep(1);
                print(arr);
            }
            j--;
            for (i = l + 1; i <= m; i++) {
                arr[i][j] = k++;
                TimeUnit.SECONDS.sleep(1);
                print(arr);
            }
            i--;
            for (j = m - 1; j >= l; j--) {
                arr[i][j] = k++;
                TimeUnit.SECONDS.sleep(1);
                print(arr);
            }
            j++;
            for (i = m - 1; i >= l + 1; i--) {
                arr[i][j] = k++;
                TimeUnit.SECONDS.sleep(1);
                print(arr);
            }
            i++;
            l++;
            m--;
        }
        print(arr);
        sc.close();
    }

    public static void print(int[][] arr) {
        System.out.println("Matrix is : ");
        for (int[] i : arr) {
            for (int j : i) {
                System.out.print(j + "\t");
            }
            System.out.println();
        }
    }
}