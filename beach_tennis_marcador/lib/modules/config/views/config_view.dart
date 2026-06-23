import 'package:beach_tennis_marcador/modules/config/controllers/config_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigView extends GetView<ConfigController> {
  const ConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beach Tennis'),
        centerTitle: true,
        // backgroundColor: const Color.fromARGB(255, 233, 110, 9),
        backgroundColor: const Color.fromARGB(255, 9, 99, 233),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Bloco da dupla 1
            _buildCardDupla(
              titulo: 'Dupla 1',
              controllerA: controller.jogador1Controller,
              labelA: 'Jogador 1',

              controllerB: controller.jogador2Controller,
              labelB: 'Jogador 2',
              corTopo: const Color.fromARGB(255, 102, 174, 233)
            ),

            const SizedBox(height: 16),

            //Bloco da dupla 2
            _buildCardDupla(
              titulo: 'Dupla 2',
              controllerA: controller.jogador3Controller,
              labelA: 'Jogador 3',

              controllerB: controller.jogador4Controller,
              labelB: 'Jogador 4',
              corTopo: const Color.fromARGB(255, 10, 197, 243),
            ),

            const SizedBox(height: 16),
            Divider(),
            const SizedBox(height: 10),

            //Bloco de configuração da partida (Sets e Games)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    color: Color.fromARGB(255, 9, 99, 233),
                    child: const Text(
                      'Dados da Partida',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.setsController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Sets',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: controller.gamesController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Games',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Botão Iniciar Partida
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
          bottom: MediaQuery.of(context).padding.bottom + 16.0,
        ),
        child: ElevatedButton(
          onPressed: () => controller.iniciarPartida(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'INICIAR PARTIDA',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildCardDupla({
    required String titulo,
    required TextEditingController controllerA,
    required String labelA,
    required TextEditingController controllerB,
    required String labelB,
    required Color corTopo,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: corTopo,
            child: Text(
              titulo,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,
              color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controllerA,
                  decoration: InputDecoration(
                    labelText: labelA,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controllerB,
                  decoration: InputDecoration(
                    labelText: labelB,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
