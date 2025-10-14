import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class SecurityUtils {
  static final _secureRandom = Random.secure();

  static String generateSalt([int length = 16]) {
    final bytes = List<int>.generate(length, (_) => _secureRandom.nextInt(256));
    return base64UrlEncode(bytes);
  }

  static String hashPassword(String password, String salt,
      {int iterations = 100000}) {
    List<int> input = utf8.encode(salt + password);
    Digest h = sha256.convert(input);
    for (int i = 0; i < iterations - 1; i++) {
      h = sha256.convert([...h.bytes, ...utf8.encode(password)]);
    }
    return base64UrlEncode(h.bytes);
  }

  static bool verifyPassword(String password, String salt, String expectedHash,
      {int iterations = 100000}) {
    final h = hashPassword(password, salt, iterations: iterations);
    return constantTimeEquality(h, expectedHash);
  }

  static bool constantTimeEquality(String a, String b) {
    final aBytes = utf8.encode(a);
    final bBytes = utf8.encode(b);
    if (aBytes.length != bBytes.length) return false;
    int diff = 0;
    for (int i = 0; i < aBytes.length; i++) diff |= aBytes[i] ^ bBytes[i];
    return diff == 0;
  }
}
