class formatString {

    public static void main(String[] args) {
        int nilaiUnicode = 0x03D5;
        double nilaiPhi = 3.14;
        String ket = "phi";

        System.out.println(String.format("|%s|%f|Unicode:%d|", ket, nilaiPhi, nilaiUnicode));

        System.out.println(String.format("|%10s|%6.2f|Unicode:%4d|", ket, nilaiPhi, nilaiUnicode));

        System.out.println(String.format("|%-10s|%6.2f|Unicode:%4d|", ket, nilaiPhi, nilaiUnicode));
    }
}