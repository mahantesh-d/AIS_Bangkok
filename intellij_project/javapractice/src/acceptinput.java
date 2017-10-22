import java.util.Scanner;

/**
 * Created by Uno on 2/12/2017.
 */
public class acceptinput {
    public static void main (String args[]){
        System.out.println("Enter the string");
        Scanner scan = new Scanner(System.in);
        String m = scan.nextLine();
        System.out.println("Hello " + m);
    }
}
