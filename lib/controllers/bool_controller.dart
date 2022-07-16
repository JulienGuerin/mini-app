import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BoolController extends GetxController {
  RxBool cgvCheckbox = false.obs;
  RxBool isSwitched = true.obs;
  final GetStorage box = GetStorage();

  @override
  onInit() {
    if (box.read('cgvCheckbox') != null) {
      cgvCheckbox.value = box.read("cgvCheckbox");
    }
    if (box.read('isSwitched') != null) {
      isSwitched.value = box.read("isSwitched");
    }
    super.onInit();
  }
}