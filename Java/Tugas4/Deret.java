/**
 * Deret
 */
public class Deret {

    public static void main(String[] args) {
        int i = 0;

        for (int a = 1; a <= 17; a++) {
            i = i + 1;

            System.out.println(a + " ");
            a = a + i;
        }
    }
}