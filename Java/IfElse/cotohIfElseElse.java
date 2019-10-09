
/**
 * cotohIfElseElse
 */
import java.util.Scanner;

public class cotohIfElseElse {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        String warna = "", Merah = "Berhenti", Kuning = "Hati-hati", Hijau = "Jalan!";

        while (warna.equals("warna")) {
            System.out.print("Input warna = ");
            warna = input.next();
        }
    }
}