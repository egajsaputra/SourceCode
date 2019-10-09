package app;

import java.util.Scanner;

public class selisihJam {
    public void sj() {
        Scanner scan = new Scanner(System.in);

        // Start
        System.out.println(" ");
        System.out.println("Menghitung Selisih Jam");
        System.out.println(" ");
        System.out.println("=======================");

        // Input
        System.out.println(" ");
        System.out.print("Input Jam x = ");
        int xj = scan.nextInt();

        System.out.print("Input Menit x = ");
        int xm = scan.nextInt();

        System.out.println(" ");
        System.out.print("Input Jam y = ");
        int yj = scan.nextInt();

        System.out.print("Input Menit y = ");
        int ym = scan.nextInt();

        // Process
        int selisih = (yj - xj) * 60 + (ym - xm);
        int xyj = selisih / 60;
        int xym = selisih % 60;

        // Output
        System.out.println(" ");
        System.out.println("Selisih Jam Adalah = " + selisih + " Menit");
        System.out.println(+selisih + " Menit sama dengan " + xyj + " Jam " + xym + " Menit");
    }

    public static void main(String[] args) throws Exception {
        String repeat = "y";
        while (repeat.equals("y")) {
            System.out.println(" ");
            Scanner input = new Scanner(System.in);

            // Start Menu
            System.out.println("###### TUGAS ######");
            System.out.println(" ");

            // Menu
            System.out.println("====== MENU ======");
            System.out.println(" ");
            System.out.println("1. Menghitung Selisih Jam");
            System.out.println("2. Exit");
            System.out.println(" ");

            // Choice Menu
            System.out.println("===================================");
            System.out.println(" ");
            System.out.print("Masa Depan Bangsa Ada dipilihanmu = ");
            int choice = input.nextInt();
            System.out.println(" ");
            System.out.println("====================================");

            switch (choice) {
            case 1:
                selisihJam s = new selisihJam();
                s.sj();
                break;

            case 2:
                System.out.println(" ");
                System.out.println("Take Your Coffee and Have a Good Day :)");
                System.exit(2);
                break;

            default:
                System.out.println(" ");
                System.out.println("Iqra'! Input Only 1 & 2!");
                break;
            }
            System.out.println(" ");
            System.out.println("================================");

            System.out.println(" ");
            System.out.println("Kita Lanjut? [Y/T]");
            repeat = input.next();
        }
    }
}