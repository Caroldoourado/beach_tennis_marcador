import 'package:beach_tennis_marcador/core/database/local_database.dart';
import 'package:beach_tennis_marcador/modules/partida/models/partida_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartidaController extends GetxController {
  //Dados que virão da primeira tela
  String nomeDupla1 = '';
  String nomeDupla2 = '';
  int maxSets = 1;
  int maxGames = 6;

  //Lista para converter os inteiros no placar do tênis
  final List<String> placarTenis = ['0', '15', '30', '40'];

  //Variáveis reativas (.obs) para o placar
  var pontosD1 = 0.obs;
  var pontosD2 = 0.obs;

  var gamesD1 = 0.obs;
  var gamesD2 = 0.obs;

  var setsD1 = 0.obs;
  var setsD2 = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //Recupera os argumentos passados na navegação
    final argumentos = Get.arguments as Map<String, dynamic>?;

    if (argumentos != null) {
      nomeDupla1 = argumentos['dupla1'] ?? 'Dupla 1';
      nomeDupla2 = argumentos['dupla2'] ?? 'Dupla 2';
      maxSets = argumentos['sets'] ?? 1;
      maxGames = argumentos['games'] ?? 6;
    }
  }

  //Métodos que a view vai chamar nos botões para marcar pontuação
  void pontuarDupla1() {
    if (pontosD1.value < 3) {
      pontosD1.value++;
    } else {
      pontosD1.value = 0;
      pontosD2.value = 0;
      gamesD1.value++;

      //Validar se fechou o set
      if (gamesD1.value >= maxGames) {
        gamesD1.value = 0;
        gamesD2.value = 0;
        setsD1.value++;

        _verificarFimDaPartida();
      }
    }
  }

  void pontuarDupla2() {
    if (pontosD2.value < 3) {
      pontosD2.value++;
    } else {
      pontosD1.value = 0;
      pontosD2.value = 0;
      gamesD2.value++;

      //Validar se fechou o set
      if (gamesD2.value >= maxGames) {
        gamesD1.value = 0;
        gamesD2.value = 0;
        setsD2.value++;

        _verificarFimDaPartida();
      }
    }
  }

  void _verificarFimDaPartida() {
    if (setsD1.value >= maxSets) {
      _finalizarJogo(vencedor: nomeDupla1);
    } else if (setsD2.value >= maxSets) {
      _finalizarJogo(vencedor: nomeDupla2);
    }
  }

  void _finalizarJogo({required String vencedor}) {
    Get.defaultDialog(
      title: 'Fim de Jogo!',
      middleText: 'A dupla $vencedor venceu a partida!',
      barrierDismissible: false,
      textConfirm: 'Ok',
      confirmTextColor: Colors.white,
      buttonColor: Colors.green,
      onConfirm: () async {
        // 1. Instanciamos a Model com os dados atuais da partida
        final partidaFinalizada = PartidaModel(
          dupla1: nomeDupla1,
          dupla2: nomeDupla2,
          setsDupla1: setsD1.value,
          setsDupla2: setsD2.value,
          data: DateTime.now().toIso8601String(),
        );

        // 2. Busca o serviço do banco do GetX e manda salvar
        final dbService = Get.find<DataBaseService>();
        await dbService.salvarPartida(partidaFinalizada);

        // Prepara o pacote de dados para a tela de resumo
        final dadosResumo = {
          'vencedor': vencedor,
          'dupla1': nomeDupla1,
          'dupla2': nomeDupla2,
          'sets1': setsD1.value,
          'sets2': setsD2.value,
        };

        // Fecha o dialog e vai pra tela de resumo
        Get.back();
        Get.offNamed('/resumo', arguments: dadosResumo);

      },
    );
  }
}
