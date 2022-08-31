import 'package:get/get_state_manager/get_state_manager.dart';

class DateController extends GetxController {
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime get getDate => date;
  set setDate(DateTime value) => date = value;
}
