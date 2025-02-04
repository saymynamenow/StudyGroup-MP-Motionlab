import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var profile = "".obs;
  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    profile.value = prefs.getString("username") ?? "";
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("Is_Logged_In");
    Get.offAllNamed('/login');
  }
}
