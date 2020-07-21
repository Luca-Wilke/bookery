import 'package:bookery/library.dart';
import 'package:bookery/utils/util_library.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {

  static final _storage = new FlutterSecureStorage();

  //read value by given key
  static Future<dynamic> read(String key) async {
    if (key == null) {
      logger.e("Secure storage read: FAILURE. Key is null.", null, StackTrace.current);
      return MemoryErrorType.keyIsNull;
    }

    String value = await _storage.read(key: key);

    if (value == null) {
      logger.e("Secure storage read: FAILURE. Value is null. Key: {$key}", null, StackTrace.current);
      return MemoryErrorType.valueIsNull;
    }

    logger.i("Read value of key {$key}: {$value}. Secure storage read operation.");
  
    return value;
  }

  //write value to given key
  static Future<dynamic> write(String key, String value) async {
    if (key == null) {
      logger.e("Secure storage write: FAILURE. Key is null. Value: {$value}", null, StackTrace.current);
      return MemoryErrorType.keyIsNull;
    } else if (value == null) {
      logger.e("Secure storage write: FAILURE. Value is null. Key: {$key}", null, StackTrace.current);
      return MemoryErrorType.valueIsNull;
    }

    await _storage.write(key: key, value: value);

    logger.i("Set value of key {$key} to {$value}. Secure storage write operation.");

    return true;
  }

  //delete value at given key
  static Future<dynamic> delete(String key) async {
    if (key == null) {
      logger.e("Secure storage delete: FAILURE. Key is null.", null, StackTrace.current);
      return MemoryErrorType.keyIsNull;
    }

    await _storage.delete(key: key);

    logger.i("Delete value of key {$key}. Secure storage delete operation.");

    return true;
  }

}