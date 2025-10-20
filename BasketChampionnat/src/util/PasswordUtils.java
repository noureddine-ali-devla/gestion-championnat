package util;

public class PasswordUtils {
    public static boolean verifier(String input, String stored) {
        return input.equals(stored);
    }
}
