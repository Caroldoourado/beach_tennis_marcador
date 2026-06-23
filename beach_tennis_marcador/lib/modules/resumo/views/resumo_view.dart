import 'package:beach_tennis_marcador/modules/config/controllers/config_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResumoView extends StatelessWidget {
  const ResumoView({super.key});

  @override
  Widget build(BuildContext context) {
    // Recupera os dados da partida finalizada
    final dados = Get.arguments as Map<String, dynamic>;
    final String vencedor = dados['vencedor'];
    final String dupla1 = dados['dupla1'];
    final String dupla2 = dados['dupla2'];
    final int sets1 = dados['sets1'];
    final int sets2 = dados['sets2'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo da Partida'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.emoji_events, size: 100, color: Colors.amber),
            const SizedBox(height: 16),

            const Text(
              'FIM DE JOGO!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              'Vencedores:\n$vencedor',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 40),

            // Card com o Placar Final
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Placar Final dos Sets',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            dupla1,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '$sets1',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            dupla2,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '$sets2',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Get.find<ConfigController>().limparCampos();
                Get.until((route) => Get.currentRoute == '/configuracao');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'VOLTAR PARA O INÍCIO',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
