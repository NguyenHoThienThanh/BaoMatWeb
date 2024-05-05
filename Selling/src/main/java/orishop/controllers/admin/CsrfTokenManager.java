package orishop.controllers.admin;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

public class CsrfTokenManager {
    private static final Map<String, String> csrfTokenMap = new HashMap<>();

    public static String generateCsrfToken() {
        byte[] tokenBytes = new byte[32]; // Độ dài của token CSRF
        new SecureRandom().nextBytes(tokenBytes);
        String token = Base64.getUrlEncoder().withoutPadding().encodeToString(tokenBytes);
        return token;
    }

    public static void saveCsrfTokenForSession(String sessionId, String csrfToken) {
        csrfTokenMap.put(sessionId, csrfToken);
    }

    public static String getCsrfTokenForSession(String sessionId) {
        return csrfTokenMap.get(sessionId);
    }
}
