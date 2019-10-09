
/**
 * Kapital
 */
import java.util.Scanner;

public class Kapital {

    public static void main(String[] args) {
        char karakter;
        String str;

        Scanner input = new Scanner(System.in);

        System.out.print("Input char = ");
        str = input.nextLine();
        karakter = str.charAt(0);

        if (karakter >= 'A' && karakter <= 'Z') {
            System.out.print(karakter + " termasuk huruf kapital");
        } else {
            System.out.print(karakter + " bukan hurus kapital");
        }
    }
}