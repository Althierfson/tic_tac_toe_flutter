import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';
import 'package:tic_tac_toe/pages/home_page.dart';
import 'package:tic_tac_toe/shapes/shape_circulo.dart';
import 'package:tic_tac_toe/shapes/shape_x.dart';
import 'package:tic_tac_toe/widgets/campo_widget.dart';
import 'package:tic_tac_toe/widgets/tic_tac_animated.dart';

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
              ? Stack(
                  children: [
                    const SizedBox(height: 100),
                    TicTacAnimated(
                      duration: const Duration(milliseconds: 1800),
                      painter: controller.vez.value ? ShapeX() : ShapeCirculo(),
                    )
                  ],
                )
              : const SizedBox()),
          const SizedBox(
            height: 10,
          ),
          Obx(() => controller.estadoDoJogo.value == EstadoDoJogo.play
              ? Text('turn'.tr)
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
                    Text(
                      'parabens'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        TicTacAnimated(
                            duration: const Duration(milliseconds: 1500),
                            painter: controller.vez.value
                                ? ShapeX()
                                : ShapeCirculo()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'infoVitoria'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'msgVitoria'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    buildfinalOpcoes()
                  ],
                ),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'infoEmpate'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'msgEmpate'.tr,
                      style: const TextStyle(
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
                    buildfinalOpcoes()
                  ],
                ),
              );
            }
          })
        ]),
      ),
    );
  }

  Widget buildfinalOpcoes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              controller.reiniciarJogo();
            },
            child: Text('bt_home'.tr)),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Get.offAll(
                () => const HomePage(),
              );
            },
            child: Text('bt_backHome'.tr))
      ],
    );
  }

  Widget buildTabulerio(BuildContext context) {
    double size =
        (MediaQuery.of(context).size.width / controller.tabuleiro.length) - 10;
    return Column(
        children: List.generate(controller.tabuleiro.length, (linhaIndex) {
      var linha = controller.tabuleiro[linhaIndex];
      return Padding(
        padding: EdgeInsets.only(
          bottom: 10 / controller.tabuleiro.length,
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
