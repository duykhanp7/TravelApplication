import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  final _storage = const FlutterSecureStorage();

  void saveData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getData(String key) async {
    return await _storage.read(key: key);
  }
}
