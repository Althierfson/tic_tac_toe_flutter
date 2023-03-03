import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';
import 'package:tic_tac_toe/shapes/shape_circulo.dart';
import 'package:tic_tac_toe/shapes/shape_x.dart';
import 'package:tic_tac_toe/widgets/campo_widget.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});
  final GamePageController controller = Get.put(GamePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(() => controller.estadoDoJogo.value == EstadoDoJogo.play
              ? CustomPaint(
                  size: const Size.square(50),
                  painter: controller.vez.value ? ShapeX() : ShapeCirculo(),
                )
              : const SizedBox()),
          const SizedBox(
            height: 10,
          ),
          Obx(() => controller.estadoDoJogo.value == EstadoDoJogo.play
              ? const Text("É sua vez")
              : const SizedBox()),
          const SizedBox(
            height: 10,
          ),
          Obx(() {
            if (controller.estadoDoJogo.value == EstadoDoJogo.play) {
              return buildTabulerio(context);
            } else if (controller.estadoDoJogo.value == EstadoDoJogo.vitoria) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      "Parabéns",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomPaint(
                      size: const Size.square(50),
                      painter: controller.vez.value ? ShapeX() : ShapeCirculo(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Você destruiu seu oponente!",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Não esqueça de entregar o lencinho para quando ele começar a chorar!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.reiniciarJogo();
                          },
                          child: const Text("Novo jogo")),
                    )
                  ],
                ),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      "Não há mais jogadas",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "O jogo terminou empatado",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                          size: const Size.square(50),
                          painter: ShapeX(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomPaint(
                          size: const Size.square(50),
                          painter: ShapeCirculo(),
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
                            controller.reiniciarJogo();
                          },
                          child: const Text("Novo jogo")),
                    )
                  ],
                ),
              );
            }
          })
        ]),
      ),
    );
  }

  Widget buildTabulerio(BuildContext context) {
    double size = (MediaQuery.of(context).size.width / 3) - 10;
    return Column(
        children: List.generate(controller.tabuleiro.length, (linhaIndex) {
      var linha = controller.tabuleiro[linhaIndex];
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 10 / 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              linha.length,
              (colunaIndex) => SizedBox(
                  width: size,
                  height: size,
                  child: CampoWidget(
                    valor: linha[colunaIndex],
                    onTap: () {
                      controller.fazerJogada(linhaIndex, colunaIndex);
                    },
                  ))),
        ),
      );
    }));
  }
}
