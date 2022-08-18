import 'package:get/get.dart';
import 'package:nsutx/Controllers/profile_controller.dart';

class ProfileBindings with Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}
