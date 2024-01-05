import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageService extends GetxService {
  static LocalStorageService get to => Get.find<LocalStorageService>();
  GetStorage _storage = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
    _storage.initStorage;
  }

 

  String? get userToken => _storage.read(LocalStorageKey.userToken.name);
  set userToken(String? s) => _storage.write(LocalStorageKey.userToken.name, s);

  Future<void> init() async {
    await _storage.initStorage;
  }

  String? readData(LocalStorageKey key) {
    return _storage.read(key.name);
  }

  void writeDate(LocalStorageKey key, data) {
    _storage.write(key.name, data);
  }
}

enum LocalStorageKey { userToken, isFirst, isDarkMode, reportV2, favroite }
