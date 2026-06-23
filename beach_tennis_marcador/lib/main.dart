import 'package:beach_tennis_marcador/core/database/local_database.dart';
import 'package:beach_tennis_marcador/modules/config/bindings/configuracao_bindings.dart';
import 'package:beach_tennis_marcador/modules/config/views/config_view.dart';
import 'package:beach_tennis_marcador/modules/partida/bindings/partida_binding.dart';
import 'package:beach_tennis_marcador/modules/partida/views/partida_view.dart';
import 'package:beach_tennis_marcador/modules/resumo/views/resumo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  //Aqui estamos avisando ao flutter para garantir que os canais nativos estejam prontos antes do async
  WidgetsFlutterBinding.ensureInitialized();

  //Aqui estamos inicializando o banco de dados e colocando ele no GetX
  await Get.putAsync(() => DataBaseService().init());

  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Marcador Beach Tennis',
      debugShowCheckedModeBanner: false,

      //Definindo qual rota nomeada inicia o app
      initialRoute: '/configuracao',

      //Mapa de rotas do aplicativo
      getPages: [
        GetPage(
          name: '/configuracao',
          page: () => const ConfigView(),
          binding: ConfiguracaoBinding(),
        ),
        GetPage(
          name: '/partida',
          page: () => const PartidaView(),
          binding: PartidaBinding(),
        ),
        GetPage(
          name: '/resumo', 
          page: () => const ResumoView(),
        ),
      ],
    );
  }
}
