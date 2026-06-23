import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class ConfigController extends GetxController {
  //Ganchos que capturam o texto dos inputs na View

  final jogador1Controller = TextEditingController();
  final jogador2Controller = TextEditingController();
  final jogador3Controller = TextEditingController();
  final jogador4Controller = TextEditingController();

  final setsController = TextEditingController();
  final gamesController = TextEditingController();

  void iniciarPartida() {
    //1. Validação dos nomes limpando os espaços em branco

    final j1 = jogador1Controller.text.trim();
    final j2 = jogador2Controller.text.trim();
    final j3 = jogador3Controller.text.trim();
    final j4 = jogador4Controller.text.trim();

    if (j1.isEmpty || j2.isEmpty || j3.isEmpty || j4.isEmpty) {
      _mostraErro(
        'Erro no cadastro',
        'Por favor, preencha o nome de todos os jogadores.',
      );

      return;
    }

    //2. Validação das regras do jogo
    final qtdSets = int.tryParse(setsController.text);
    final qtdGames = int.tryParse(gamesController.text);

    if (qtdSets == null || qtdSets <= 0) {
      _mostraErro(
        'Configuração Inválida',
        'A quantidade de games deve ser um número maior que zero.',
      );
      return;
    }

    if (qtdGames == null || qtdGames <= 0) {
      _mostraErro(
        'Configuração Inválida',
        "A quantidade de games deve ser um número maior que zero.",
      );
      return;
    }

    print(
      'Dados íntegros! Dupla 1: $j1 e $j2 | Dupla 2: $j3 e $j4 | Sets: $qtdSets | Games: $qtdGames',
    );

    //Dados para enviar para a próxima tela
    final dadosPartida = {
      'dupla1':
          '${jogador1Controller.text.trim()} e ${jogador2Controller.text.trim()}',
      'dupla2':
          '${jogador3Controller.text.trim()} e ${jogador4Controller.text.trim()}',
      'sets': qtdSets,
      'games': qtdGames,
    };

    //Navega para a tela do placar usando a rota nomeada injetando os argumentos
    Get.toNamed('/partida', arguments: dadosPartida);
  }

  void _mostraErro(String titulo, String mensagem) {
    Get.snackbar(
      titulo,
      mensagem,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void onClose() {
    jogador1Controller.dispose();
    jogador2Controller.dispose();
    jogador3Controller.dispose();
    jogador4Controller.dispose();
    setsController.dispose();
    gamesController.dispose();
    super.onClose();
  }

  void limparCampos() {
    jogador1Controller.clear();
    jogador2Controller.clear();
    jogador3Controller.clear();
    jogador4Controller.clear();
    setsController.clear();
    gamesController.clear();
  }
}
