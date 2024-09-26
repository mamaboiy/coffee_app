import 'package:coffee/management/change.dart';
import 'package:coffee/management/manageState.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Managestate());
    Get.put(Change());
  }

}