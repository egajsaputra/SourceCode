import java.util.Scanner;

public class konstanta {
    public static void main(String[] args) {
        final double phi = 3.14;
        double jariJari, luas;

        Scanner scan = new Scanner(System.in);

        System.out.println("Menghitung Lingkaran\n");

        System.out.print("Masukan Jari Jari = ");
        jariJari = scan.nextDouble();

        System.out.println(" ");
        System.out.println("Luas Lingkaran = " + luas);
        luas = phi * jariJari * jariJari;
    }
}