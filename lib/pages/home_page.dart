import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tic_tac_toe/pages/game_page.dart';
import 'package:tic_tac_toe/shapes/shape_circulo.dart';
import 'package:tic_tac_toe/shapes/shape_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Vamos jogar",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const Text(
            "Jogo-da-velha",
            style: TextStyle(
                color: Colors.white, fontSize: 44, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                painter: ShapeCirculo(),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              CustomPaint(
                painter: ShapeX(),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(()=> GamePage());
                },
                child: const Text("Novo jogo")),
          ),
        ]),
      ),
    );
  }
}
