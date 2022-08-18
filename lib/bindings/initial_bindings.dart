import 'package:get/instance_manager.dart';
import 'package:nsutx/Controllers/profile_controller.dart';
import 'package:nsutx/Controllers/theme_controller.dart';

class InitialBindings with Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.lazyPut(() => ProfileController());
  }
}
