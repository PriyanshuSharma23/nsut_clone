import 'package:get/get.dart';
import 'package:nsutx/models/tasks_storage_model.dart';

class TaskController extends GetxController {
  final map = TaskStorageModel().obs;
}
