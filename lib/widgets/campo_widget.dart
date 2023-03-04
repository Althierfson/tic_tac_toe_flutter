import 'package:flutter/material.dart';
import 'package:tic_tac_toe/shapes/shape_circulo.dart';
import 'package:tic_tac_toe/shapes/shape_linha.dart';
import 'package:tic_tac_toe/shapes/shape_x.dart';

class CampoWidget extends StatelessWidget {
  final int valor;
  final Function()? onTap;
  const CampoWidget({super.key, required this.valor, this.onTap});

  @override
  Widget build(BuildContext context) {
    CustomPainter? customPainter;
    switch (valor) {
      case 0:
        customPainter = ShapeLinha();
        break;
      case 1:
        customPainter = ShapeX();
        break;
      case -1:
        customPainter = ShapeCirculo();
        break;
      default:
    }
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: CustomPaint(
          painter: customPainter,
        ),
      ),
    );
  }
}
