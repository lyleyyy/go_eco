import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';




class Encryption {
  static var _decrypted_;
  static var _encrypted_;

  static encryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encryptor = Encrypter(AES(key));
    _encrypted_ = encryptor.encrypt(plainText, iv: iv);
    return _encrypted_!.base64;
  }

  static decryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encryptor = Encrypter(AES(key));
    _decrypted_ = encryptor.decrypt(_encrypted_!, iv: iv);
    return _decrypted_;
  }
}