import 'package:get/get.dart';

class DropController extends GetxController {
  final selected = "Student".obs;
  void setSelected(String value) {
    selected.value = value;
  }

  final List<String> listType = [
    'Student',
    'Doctor',
    'Teacher',
    'Engineer',
    'Clerk',
    'Business Man'
  ];
}
