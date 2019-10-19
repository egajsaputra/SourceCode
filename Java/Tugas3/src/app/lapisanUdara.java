package app;

import java.util.Scanner;

/**
 * lapisanUdara
 */
public class lapisanUdara {

    public static void main(String[] args) {
        // Declare
        double ketinggian;

        // Input Scanner
        Scanner scan = new Scanner(System.in);

        // Start
        System.out.println("");
        System.out.println("====== Mencari Jenis Lapisan Udara ======");

        // Input
        System.out.println("");
        System.out.print("Input Ketinggian = ");
        ketinggian = scan.nextDouble();
        System.out.println("");
        System.out.println("====================\n");

        // Output
        if (0 <= ketinggian && ketinggian < 10) {
            System.out.println("Pada ketinggian " + ketinggian
                    + " Km dari permukaan bumi, termasuk jenis lapisan udara Troposfer\n");
        } else if (10 <= ketinggian && ketinggian < 40) {
            System.out.println("Pada ketinggian " + ketinggian
                    + " Km dari permukaan bumi, termasuk jenis lapisan udara Statosfer\n");
        } else if (40 <= ketinggian && ketinggian < 70) {
            System.out.println("Pada ketinggian " + ketinggian
                    + " Km dari permukaan bumi, termasuk jenis lapisan udara Mesosfer\n");
        } else if (70 <= ketinggian && ketinggian < 400) {
            System.out.println("Pada ketinggian " + ketinggian
                    + " Km dari permukaan bumi, termasuk jenis lapisan udara Termosfer\n");
        } else if (ketinggian >= 400) {
            System.out.println("Pada ketinggian " + ketinggian
                    + " Km dari permukaan bumi, termasuk jenis lapisan udara Eksosfer\n");
        } else {
            System.out.println("Ini termasuk jenis lapisan udara Brontothanosaurusmegalopusobeliutikumekosfer\n");
        }
    }
}