package app;

import java.util.Scanner;

/**
 * sisiSegitiga
 */
public class sisiSegitiga {

    public static void main(String[] args) {
        // Declare
        double sisi1, sisi2, sisi3;

        // Input scanner
        Scanner scan = new Scanner(System.in);

        // Start
        System.out.println("");
        System.out.println("====== Mencari Jenis Segitiga ======");

        // Input
        System.out.println("");
        System.out.print("Input Sisi x = ");
        sisi1 = scan.nextDouble();

        System.out.println("");
        System.out.print("Input Sisi y = ");
        sisi2 = scan.nextDouble();

        System.out.println("");
        System.out.print("Input Sisi z = ");
        sisi3 = scan.nextDouble();

        System.out.println("");
        System.out.println("=================\n");

        // Output
        if (sisi1 == sisi2 && sisi2 == sisi3) {
            System.out.println("Sejenis Mamalia Segitiga Sama Sisi\n");
        } else if (sisi1 == sisi2 || sisi2 == sisi3 || sisi1 == sisi3) {
            System.out.println("Sejenis Brontosaurus Segitiga Sama Kaki\n");
        } else {
            System.out.println("Semua Sisi Berbeda, seperti kita yang tak akan pernah sama, terlebih bersama :(\n");
        }
    }
}