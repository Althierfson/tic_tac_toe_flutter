import 'package:get/get.dart';

class Linguagens extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'call': "Let's Play",
          'game_name': 'tic-tac-toe',
          'bt_home': 'New Game',
          'turn': "It's your turn",
          'parabens': 'Congratulations',
          'infoVitoria': 'You destroyed your opponent!',
          'msgVitoria':
              "Don't forget to hand over the tissue for when he starts to cry!",
          'infoEmpate': "No more moves",
          'msgEmpate': "The game ended in a draw",
          'bt_newGame' : "Start the game",
          'opcoesDeJogo': "Choose the table size",
          'bt_backHome': "Back Home"
        },
        'pt_BR': {
          'call': "Vamos jogar",
          'game_name': 'Jogo-da-velha',
          'bt_home': 'Novo jogo',
          'turn': 'É sua vez',
          'parabens': 'Parabéns',
          'infoVitoria': "Você destruiu seu oponente!",
          'msgVitoria':
              "Não esqueça de entregar o lencinho para quando ele começar a chorar!",
          'infoEmpate': "Não há mais jogadas",
          'msgEmpate': "O jogo terminou empatado",
          'bt_newGame' : "Iniciar jogo",
          'opcoesDeJogo': "Escolha o tamanho do tabuleiro",
          'bt_backHome': "Volta para o Home"
        }
      };
}
