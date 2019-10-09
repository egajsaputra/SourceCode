package app;

import java.util.Scanner;

public class Rectangle {
        void rec() {
                Scanner scan = new Scanner(System.in);

                System.out.println("MENGHITUNG LUAS PERSEGI PANJANG");
                System.out.println("===============================");

                System.out.print("Masukan Panjang = ");
                int a = scan.nextInt();

                System.out.print("Masukan Lebar = ");
                int b = scan.nextInt();

                int c = a * b;

                System.out.println("===============================");
                System.out.println("Luas Persegi Panjang = " + c);
        }
}