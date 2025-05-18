// 
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> writeSecureData(String key, String value) async {
    await storage.write(
      key: key,
      value: value,
    );
    debugPrint('Data saved to secure storage: $value');
  }

  Future<String?> readSecureData(String key) async {
    String? value = await storage.read(key: key);
    if (value == null) {
      debugPrint('No data found in secure storage for key: $key');
    } else {
      debugPrint('Data read from secure storage: $value');
    }
    return value;
  }
  Future<void> deleteSecureData(String key) async {
    await storage.delete(key: key);
    debugPrint('Data deleted from secure storage for key: $key');
  }
}
