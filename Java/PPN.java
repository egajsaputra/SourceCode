import java.util.Scanner;

public class PPN {

    public static void main(String[] args) {
        double hargaBarang, totalHarga;
        double ppn = 0.1;

        Scanner input = new Scanner(System.in);

        System.out.println("Menghitung Nilai PPN\n");

        System.out.print("Input Harga Barang = ");
        hargaBarang = input.nextDouble();

        totalHarga = hargaBarang * ppn;
        System.out.println("Total Harga Barang dengan PPN 10% = " + totalHarga);

    }
}