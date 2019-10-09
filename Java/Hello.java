import java.util.Scanner;

public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello World");

        int panjang, lebar;
        double luas;

        Scanner scan = new Scanner(System.in);

        System.out.println("Panjang = ");
        panjang = scan.nextInt();
        System.out.println("Lebar = ");
        lebar = scan.nextInt();

        luas = (panjang*lebar);
        System.out.println("Luas Persegi Panjang = "+luas);
    }
}