import 'package:beach_tennis_marcador/modules/config/controllers/config_controller.dart';
import 'package:get/get.dart';

class ConfiguracaoBinding implements Bindings {
  @override
  void dependencies() {
    // O Get.lazyPut faz com que a controller só seja criada 
    // no exato momento em que a tela for desenhada.
    Get.lazyPut <ConfigController>(() => ConfigController());
  }
}
