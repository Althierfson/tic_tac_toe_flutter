import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tic_tac_toe/pages/home_page.dart';
import 'package:tic_tac_toe/theme.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: themeData,
    home: const HomePage(),
  ));
}
