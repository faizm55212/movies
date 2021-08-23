import 'package:encrypt/encrypt.dart' as ENCRYPT;

class EncryptService {
  final iv = ENCRYPT.IV.fromLength(16);

  final encrypter = ENCRYPT.Encrypter(
    ENCRYPT.AES(
      ENCRYPT.Key.fromUtf8('WlFsdCYyJPPmKAVeA9ir+A=='),
    ),
  );

  String encrypt(String password) {
    final key = ENCRYPT.Key.fromUtf8('WlFsdCYyJPPmKAVeA9ir+A==');
    final iv = ENCRYPT.IV.fromLength(16);

    final encrypter = ENCRYPT.Encrypter(ENCRYPT.AES(key));

    final encrypted = encrypter.encrypt(password, iv: iv);
    return encrypted.base64;
  }

  String decrypted(String decryptedPassword) {
    final decrypted = encrypter
        .decrypt(ENCRYPT.Encrypted.fromBase64(decryptedPassword), iv: iv);
    return decrypted;
  }
}
