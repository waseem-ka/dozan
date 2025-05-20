import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  // دالة لحفظ بيانات المستخدم عند التسجيل
  Future<void> registerUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // حفظ البيانات
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setBool('isLoggedIn', true); // لتخزين حالة التسجيل
  }
}
