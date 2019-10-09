package app;

import java.util.Scanner;

public class Circle {
        void cir() {
                Scanner scan = new Scanner(System.in);
                double d, e;

                System.out.println(" ");
                System.out.println("Masukan Jari - Jari = ");
                d = scan.nextInt();
                e = 22 / 7 * d * d;

                System.out.println("========================");
                System.out.println("Luas Lingkaran = " + e);
        }
}