import 'package:get/get.dart';

class Linguagens extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // Pagina Home
          'call': "Let's Play",
          'game_name': 'tic-tac-toe',
          'bt_home': 'New Game',

          // Pagina Game
          'turn': "It's your turn",
          'parabens': 'Congratulations',
          'infoVitoria': 'You destroyed your opponent!',
          'msgVitoria':
              "Don't forget to hand over the tissue for when he starts to cry!",
          'infoEmpate': "No more moves",
          'msgEmpate': "The game ended in a draw",
        },
        'pt_BR': {
          // Pagina Home
          'call': "Vamos jogar",
          'game_name': 'Jogo-da-velha',
          'bt_home': 'Novo jogo',

          // Pagina Game
          'turn': 'É sua vez',
          'parabens': 'Parabéns',
          'infoVitoria': "Você destruiu seu oponente!",
          'msgVitoria':
              "Não esqueça de entregar o lencinho para quando ele começar a chorar!",
          'infoEmpate': "Não há mais jogadas",
          'msgEmpate': "O jogo terminou empatado",
        }
      };
}
