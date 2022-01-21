import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxService {
  ThemeData _currentThemeData = ThemeData();
  String _themeName = "";
  final _getStorage = GetStorage();
  final _storageKey = "theme";

  ThemeData get currentTheme => _currentThemeData;
  Future<ThemeService> init() async {
    loadThemeData();
    return this;
  }

  loadThemeData() {
    _themeName = _getStorage.read(_storageKey) ?? "redTheme0";
    setTheme(_themeName);
  }

  setTheme(themeName) {
    _themeName = themeName;

    switch (_themeName) {
      case 'redTheme':
        _currentThemeData = redTheme;
        break;

      case 'purpleTheme':
        _currentThemeData = purpleTheme;
        break;
      default:
        _currentThemeData = purpleTheme;
        break;
    }
    _getStorage.write(_storageKey, _themeName);
    Get.changeTheme(_currentThemeData);
  }
}
