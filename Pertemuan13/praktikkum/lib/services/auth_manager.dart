import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  // Gunakan konstanta key yang benar
  static const String loginStatusKey = 'isLoggedIn';
  static const String loginTimeKey   = 'loginTime';
  static const String usernameKey    = 'username';
  static const String tokenKey       = 'token';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    final bool isLoggedIn = prefs.getBool(loginStatusKey) ?? false;
    final String? loginTimeString = prefs.getString(loginTimeKey);

    if (isLoggedIn && loginTimeString != null) {
      try {
        final DateTime loginTime = DateTime.parse(loginTimeString);
        final Duration diff = DateTime.now().difference(loginTime);

        // Durasi maksimum login
        const Duration maxDuration = Duration(hours: 4);

        if (diff > maxDuration) {
          await logout();
          return false;
        }
        return true;
      } catch (e) {
        debugPrint('Invalid login time format: $e');
        await logout();
        return false;
      }
    }
    return false;
  }

  // SIMPAN USERNAME DAN TOKEN
  static Future<void> login(String username, String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(loginStatusKey, true);
    await prefs.setString(loginTimeKey, DateTime.now().toIso8601String());
    await prefs.setString(usernameKey, username);
    await prefs.setString(tokenKey, token);

    debugPrint('TOKEN SAVED: $token');
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(loginStatusKey);
    await prefs.remove(loginTimeKey);
    await prefs.remove(usernameKey);
    await prefs.remove(tokenKey);
  }

  // Optional helper
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }
}
