package app;

import java.util.Scanner;

public class Triangle {
        void tri() {
                Scanner scan = new Scanner(System.in);

                System.out.print("Masukan Alas = ");
                double f = scan.nextInt();

                System.out.println("Masukan Tinggi = ");
                double g = scan.nextInt();

                double h = (f * g) / 2;

                System.out.println(" ");
                System.out.println("Luas Segitiga = " + h);
        }
}