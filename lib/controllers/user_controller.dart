import 'package:get/get.dart';
import 'package:miniapp/controllers/auth_controller.dart';

import '../models/user.dart';
import '../services/database.dart';

class UserController extends GetxController {

  Rx<UserModel> userModel = UserModel(id: '', firstName: '', name: '', email: '', profilURL: '').obs;

  UserModel get user => userModel.value;

  set user(UserModel value) => userModel.value = value;

  var userFirebase = AuthController.instance.userFirebase.value;

  @override
  void onReady() async {
    if (userFirebase != null) {
      user = await Database().getUser(userFirebase!.uid);
    }
  }
}
