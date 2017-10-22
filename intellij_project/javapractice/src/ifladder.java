import java.util.Scanner;

/**
 * Created by Uno on 2/12/2017.
 */
public class ifladder {
    public static void main (String args[]){
        System.out.println("Enter the number");
        Scanner scan = new Scanner(System.in);
        int n = scan.nextInt();

        if (n == 1){
            System.out.println("Sunday");
        }else if (n == 2){
            System.out.println("Monday");
        }else  if (n == 3){
            System.out.println("Tuesday");
        }else if (n == 4){
            System.out.println("Wednesday");
        }else if (n == 5){
            System.out.println("Thursday");
        }else if (n == 6){
            System.out.println("Friday");
        }else  if (n == 7){
            System.out.println("Saturday");
        }
    }
}
