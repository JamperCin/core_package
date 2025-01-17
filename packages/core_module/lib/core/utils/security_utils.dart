import 'package:encrypt/encrypt.dart' as encrypt;

class SecurityUtils{
  static SecurityUtils? _utils;
  // Key and IV
  final key = encrypt.Key.fromUtf8('prime32EgiftCard!@375TS7890!Key.'); // Must be 32 chars for AES-256
  final iv = encrypt.IV.fromLength(16); // Initialization Vector (16 bytes)
  late encrypt.Encrypter encrypter;

  SecurityUtils._(){
    _init();
  }

  factory SecurityUtils(){
    return _utils ??= SecurityUtils._();
  }

  // Initialize Encrypter
  void _init(){
     encrypter = encrypt.Encrypter(encrypt.AES(key));
  }

  ///Encrypt the plain data
  String encryptData(String plainText){
    if(plainText.isEmpty) {
      return "";
    }
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  ///Decrypt the encrypted data
  String deCryptData(String encryptedText){
    if(encryptedText.isEmpty) {
      return "";
    }
    final decrypted = encrypter.decrypt(encrypt.Encrypted.from64(encryptedText), iv: iv);
    return decrypted;
  }

}