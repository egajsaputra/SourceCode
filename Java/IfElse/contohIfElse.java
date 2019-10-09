
/**
 * contohIfElse
 */
import java.util.Scanner;

public class contohIfElse {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        double nilai1, nilai2, terbesar;
        String pesan = "", jumlah = "Bilangan terbesar adalah ";

        System.out.print("Input nilai 1 = ");
        nilai1 = input.nextDouble();
        System.out.print("Input nilai 2 = ");
        nilai2 = input.nextDouble();

        terbesar = nilai1;
        if (terbesar < nilai2)
            terbesar = nilai2;

        if (terbesar % 2 == 0) {
            pesan = " bilangan genap";
        } else {
            pesan = " bilangan ganjil";
        }
        System.out.println(jumlah + terbesar + " dan merupakan " + pesan);
    }
}