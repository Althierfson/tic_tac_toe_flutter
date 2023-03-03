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

    if (!checarEstadoDoJogo()) {
      vez.value = !vez.value;
      tabuleiro.refresh();
    }
  }

  bool checarEstadoDoJogo() {
    if (checarVitoria()) {
      estadoDoJogo.value = EstadoDoJogo.vitoria;
      return true;
    }
    ;
    if (checarFimDeJogo()) {
      estadoDoJogo.value = EstadoDoJogo.empate;
      return true;
    }
    ;
    return false;
  }

  bool checarFimDeJogo() {
    int count = 0;

    /// Checar jogadas em linhas
    for (int i = 0; i < tabSize; i++) {
      if (checarJogadasPossiveis(
          tabuleiro[i][0], tabuleiro[i][1], tabuleiro[i][2])) {
        count++;
      }
    }

    /// Checar jogadas em colunas
    for (int i = 0; i < tabSize; i++) {
      if (checarJogadasPossiveis(
          tabuleiro[0][i], tabuleiro[1][i], tabuleiro[2][i])) {
        count++;
      }
    }

    /// Checar jogadas na diagonal esquerda-direita
    if (checarJogadasPossiveis(
        tabuleiro[0][0], tabuleiro[1][1], tabuleiro[2][2])) {
      count++;
    }

    /// Checar jogadas em diagonal direita-esquerda
    if (checarJogadasPossiveis(
        tabuleiro[0][2], tabuleiro[1][1], tabuleiro[2][0])) {
      count++;
    }

    if (count == 8) {
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

  bool checarJogadasPossiveis(int n1, int n2, int n3) {
    int numeroDeZeros = 0;
    int numeroDeUns = 0;
    int numeroDeUnsNegativos = 0;
    List<int> lista = [n1, n2, n3];
    for (var n in lista) {
      if (n == 0) {
        numeroDeZeros++;
      }
      if (n == 1) {
        numeroDeUns++;
      }
      if (n == -1) {
        numeroDeUnsNegativos++;
      }
    }

    if (numeroDeUns == 2 && numeroDeUnsNegativos == 2) {
      return false;
    }

    if (numeroDeZeros > 1) {
      return false;
    }

    return true;
  }
}

class EstadoDoJogo {
  static const int play = 1;
  static const int empate = 2;
  static const int vitoria = 3;
}
