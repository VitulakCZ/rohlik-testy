import java.io.*;
import java.util.Optional;
enum RohlikyPenize {
    Rohliky,
    Penize
}

class Nastroje {
    public static int getInt(Console cnsl, RohlikyPenize rohlikyPenize) {
        Optional<Integer> moznaCislo;
        do {
            moznaCislo = Nastroje.checkInt(cnsl, rohlikyPenize);
        } while (moznaCislo.isEmpty());
        return moznaCislo.get();
    }
    public static Optional<Integer> checkInt(Console cnsl, RohlikyPenize rohlikyPenize) {
        if (rohlikyPenize == RohlikyPenize.Rohliky)
            System.out.print("Kolik rohlíků? ");
        else
            System.out.print("Kolik zaplatíš? ");
        int cislo;
        try {
            cislo = Integer.parseInt(cnsl.readLine());
        } catch (Exception NumberFormatException) {
            System.out.println("Jsi kokot!");
            return Optional.empty();
        }
        return Optional.of(cislo);
    }
    public static int[] nestaci(Console cnsl, int rohliky) {
        int penize = 0;
outer:
        while (true) {
            System.out.print("To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: ");
            String input = cnsl.readLine().toUpperCase();
            switch (input) {
                case "Z":
                    rohliky = Nastroje.getInt(cnsl, RohlikyPenize.Rohliky);
                    penize = Nastroje.getInt(cnsl, RohlikyPenize.Penize);
                    break outer;
                case "C":
                    penize = Nastroje.getInt(cnsl, RohlikyPenize.Penize);
                case "E":
                    System.exit(0);
                    break outer;
                default:
                    System.out.println("Jsi kokot!");
                    break;
            }
        }
        return new int[] {rohliky, penize};
    }
}

class Main {
    public static void main(String[] args) {
        Console cnsl = System.console();
        int rohliky = Nastroje.getInt(cnsl, RohlikyPenize.Rohliky);
        int penize = Nastroje.getInt(cnsl, RohlikyPenize.Penize);
        while (penize < rohliky * 3) {
            int[] hodnoty = Nastroje.nestaci(cnsl, rohliky);
            rohliky = hodnoty[0];
            penize = hodnoty[1];
        }
    }
}
