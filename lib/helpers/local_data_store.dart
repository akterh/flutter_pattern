import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StoredData {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  static dynamic data;

  Future writeData(key, value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future readData(key) async {
    var _data = await secureStorage.read(key: key);
    data = _data;
    print("data from local store class:"+data);
    return data;
  }
}
