import 'package:get/instance_manager.dart';
import 'package:nsutx/Controllers/theme_controller.dart';

class InitialBindings with Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //
  }
}
