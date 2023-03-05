import 'package:get/get.dart';

const tabSize = 3;

class GamePageController extends GetxController {
  var tabuleiro = <List<int>>[].obs;
  var vez = true.obs;
  var estadoDoJogo = EstadoDoJogo.play.obs;

  @override
  void onInit() {
    super.onInit();
    criarTabuleiro();
  }

  void criarTabuleiro() {
    for (int i = 0; i < tabSize; i++) {
      tabuleiro.add([]);
      for (int j = 0; j < tabSize; j++) {
        tabuleiro[i].add(0);
      }
    }
    tabuleiro.refresh();
  }

  void setTabuleiro() {
    for (int i = 0; i < tabSize; i++) {
      for (int j = 0; j < tabSize; j++) {
        tabuleiro[i][j] = 0;
      }
    }
    tabuleiro.refresh();
  }

  void reiniciarJogo() {
    setTabuleiro();
    estadoDoJogo.value = EstadoDoJogo.play;
    vez.value = true;
  }

  fazerJogada(int coluna, int linha) {
    if (tabuleiro[coluna][linha] != 0) {
      return;
    }

    tabuleiro[coluna][linha] = vez.value ? 1 : -1;

    checarEstadoDoJogo();
  }

  void checarEstadoDoJogo() {
    if (checarVitoria()) {
      estadoDoJogo.value = EstadoDoJogo.vitoria;
      return;
    }

    if (checarEmpate()) {
      estadoDoJogo.value = EstadoDoJogo.empate;
      return;
    }

    vez.value = !vez.value;
    tabuleiro.refresh();
  }

  bool checarEmpate() {
    int count = 0;
    for (int i = 0; i < tabuleiro.length; i++) {
      for (int j = 0; j < tabuleiro[i].length; j++) {
        if (tabuleiro[i][j] == 0) {
          count++;
        }
      }
    }

    if (count <= 0) {
      return true;
    } else {
      return false;
    }
  }

  bool checarVitoria() {
    /// Checar mach em linhas
    for (int i = 0; i < tabSize; i++) {
      if (checkSequencia(tabuleiro[i][0], tabuleiro[i][1], tabuleiro[i][2])) {
        return true;
      }
    }

    /// Checar mach em colunas
    for (int i = 0; i < tabSize; i++) {
      if (checkSequencia(tabuleiro[0][i], tabuleiro[1][i], tabuleiro[2][i])) {
        return true;
      }
    }

    /// Checar mach na diagonal esquerda-direita
    if (checkSequencia(tabuleiro[0][0], tabuleiro[1][1], tabuleiro[2][2])) {
      return true;
    }

    /// Checar mach em diagonal direita-esquerda
    if (checkSequencia(tabuleiro[0][2], tabuleiro[1][1], tabuleiro[2][0])) {
      return true;
    }
    return false;
  }

  bool checkSequencia(int n1, int n2, int n3) {
    if (n1 == 0 || n2 == 0 || n3 == 0) {
      return false;
    }

    int valor = n1;
    if (n2 == valor) {
      if (n3 == valor) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

enum EstadoDoJogo {
  play,
  empate,
  vitoria,
}
