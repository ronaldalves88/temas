import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/services/theme_services.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => ThemeService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeService().currentTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mudança de Tema"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Clique para mudar o tema',
            ),
            TextButton(
              child: Text("Tema Vermelho"),
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.red),
              onPressed: () {
                ThemeService().setTheme("redTheme");
              },
            ),
            TextButton(
              child: Text("Tema Roxo"),
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.purple),
              onPressed: () {
                ThemeService().setTheme("purpleTheme");
              },
            ),
          ],
        ),
      ),
    );
  }
}
