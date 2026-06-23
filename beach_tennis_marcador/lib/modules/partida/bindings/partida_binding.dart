import 'package:beach_tennis_marcador/modules/partida/controllers/partida_controller.dart';
import 'package:get/get.dart';

class PartidaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartidaController>(() => PartidaController());
  }
}
