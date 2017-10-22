import java.util.Objects;
import java.util.Scanner;

/**
 * Created by Uno on 2/12/2017.
 */
public class checkipfoo {
    public static void main(String args []){
        System.out.println("Enter the sting");
        Scanner scan = new Scanner(System.in);
        String m = scan.nextLine();

        if (Objects.equals(m, "Foo")){
            System.out.println("Hello, Welcome");
        }else {
            System.out.println("Dont know you");
        }
    }
}
