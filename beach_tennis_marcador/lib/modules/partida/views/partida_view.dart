import 'package:beach_tennis_marcador/modules/partida/controllers/partida_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartidaView extends GetView<PartidaController> {
  const PartidaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placar'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // PAINEL DO PLACAR (ÁREA SUPERIOR)
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    //Linha de cabeçalho das colunas do placar
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(flex: 2, child: SizedBox()),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Sets',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Pontos',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Games',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),

                    //Placar Dupla 1 (Envelopado em Obx para atualizar em tempo real)
                    Obx(() {
                      //Se o índice for menor que o tamanho da lista, pega a string, senão é 0
                      String pontoTexto =
                          controller.pontosD1.value <
                              controller.placarTenis.length
                          ? controller.placarTenis[controller.pontosD1.value]
                          : '0';
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              controller.nomeDupla1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${controller.setsD1.value}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                pontoTexto,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${controller.gamesD1.value}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 16),

                    // PLACAR DUPLA 2
                    Obx(() {
                      String pontoTexto =
                          controller.pontosD2.value <
                              controller.placarTenis.length
                          ? controller.placarTenis[controller.pontosD2.value]
                          : '0';

                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              controller.nomeDupla2,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${controller.setsD2.value}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                pontoTexto,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${controller.gamesD2.value}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            const Spacer(),

            // BOTÕES DE CONTROLE (ÁREA INFERIOR)
            // Controles da Dupla 1
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.pontuarDupla1(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      controller.nomeDupla1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    // Função opcional para diminuir ponto se errar
                    if (controller.pontosD1.value > 0)
                      controller.pontosD1.value--;
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.pontuarDupla2(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      controller.nomeDupla2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    if (controller.pontosD2.value > 0)
                      controller.pontosD2.value--;
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
