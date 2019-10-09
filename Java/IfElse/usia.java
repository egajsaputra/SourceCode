
/**
 * usia
 */
import java.util.Scanner;

public class usia {

    public static void main(String[] args) {
        int usia, balita, anakAnak, remaja, dewasa;
        String msg = "";

        Scanner input = new Scanner(System.in);

        System.out.print("Input Usia = ");
        usia = input.nextInt();

        if (usia <= 5) {
            msg = "balita";
        } else if (usia > 5 && usia < 18) {
            msg = "remaja";
        }

        System.out.println("Dia adalah " + msg);
    }
}