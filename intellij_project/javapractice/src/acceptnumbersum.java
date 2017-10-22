import java.util.Scanner;

/**
 * Created by Uno on 2/12/2017.
 */
public class acceptnumbersum {
    public static void main(String args[]){
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter the number");
        int n = scan.nextInt();
        int sum = 0;
        for (int i = 1; i<=n; i++ ){
            sum+=i;
        }
        System.out.println(sum);
    }
}
