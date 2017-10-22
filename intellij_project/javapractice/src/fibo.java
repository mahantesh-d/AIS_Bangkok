import java.util.Scanner;

/**
 * Created by Uno on 2/12/2017.
 */
public class fibo {
    public static void main (String args[]){
        int a = 0;
        int b = 1;
        int fibo = 0;

        Scanner scan = new Scanner(System.in);
        System.out.println("Enter the end number of the series");
        int n = scan.nextInt();
        System.out.println(a + "\n" + b);
        for(int i = 1; i<=n-2; i++){
            fibo = fibo + b;
            System.out.println(fibo + "\t");
            fibo = b;
            b = i;

        }
    }

}
