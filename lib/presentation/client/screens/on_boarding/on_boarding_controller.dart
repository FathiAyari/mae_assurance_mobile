import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/auth/sign_in.dart';

class OnBoardingController extends GetxController {
  RememberClient(Map user) {
    var storage = GetStorage();
    token(2);
    storage.write("user", {
      'uid': user['uid'],
      'userName': user['userName'],
      'Email': user['Email'],
      'Gsm': user['Gsm'],
      'Role': user['Role'],
      'Url': user['Url'],
    });
  }

  check() {
    var storage = GetStorage();
    storage.write("seen", 1);
  }

  token(int index) {
    var storage = GetStorage();
    storage.write("auth", 1);
    storage.write("type_auth", index);
  }

  logout() async {
    var storage = GetStorage();
    storage.write("auth", 0);
    storage.remove("user");
    Get.to(SignIn());
  }
}
