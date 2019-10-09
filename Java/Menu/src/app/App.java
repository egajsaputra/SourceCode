package app;

import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        String loop = "Y";
        while (loop.equals("Y"))
            ;

        {
            System.out.println(" ");
            Scanner scan = new Scanner(System.in);

            System.out.println("======== PROJECT FAKE ========");
            System.out.println(" ");

            System.out.println("========== MENU =========");
            System.out.println("1. Luas Persegi Panjang");
            System.out.println("2. Luas Lingkaran");
            System.out.println("3. Luas Segitiga");
            System.out.println("4.Exit");

            System.out.println("===============================");
            System.out.println("Input Your Choice = ");
            int choice = scan.nextInt();
            System.out.println("===============================");

            switch (choice) {
            case 1:
                Rectangle r = new Rectangle();
                r.rec();
                break;

            case 2:
                Circle c = new Circle();
                c.cir();
                break;

            case 3:
                Triangle t = new Triangle();
                t.tri();
                break;

            case 4:
                System.out.println("Take Your Coffee And Have a Good Day");
                System.exit(4);
                System.out.println("Input Only 1 - 4 Moron!");
                break;
            }
            System.out.println("===============================");
            System.out.print("Are You Want Back To Menu [Y/T]");
            loop = scan.next();
        }
    }
}