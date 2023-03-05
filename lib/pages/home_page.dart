import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/pages/game_page.dart';
import 'package:tic_tac_toe/shapes/shape_circulo.dart';
import 'package:tic_tac_toe/shapes/shape_x.dart';
import 'package:tic_tac_toe/widgets/tic_tac_animated.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            Text(
              'call'.tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'game_name'.tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const SizedBox(height: 100),
                    TicTacAnimated(
                      duration: const Duration(milliseconds: 1800),
                      painter: ShapeCirculo(),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Stack(
                  children: [
                    const SizedBox(height: 100),
                    TicTacAnimated(
                      duration: const Duration(milliseconds: 1500),
                      painter: ShapeX(),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => GamePage());
                  },
                  child: Text('bt_home'.tr)),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    var locale = const Locale('en', 'US');
                    Get.updateLocale(locale);
                  },
                  child: const Text("English"),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    var locale = const Locale('pt', 'BR');
                    Get.updateLocale(locale);
                  },
                  child: const Text("Português"),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
