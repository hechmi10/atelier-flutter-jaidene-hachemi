import 'package:myapp2/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<void> saveUser(User user) async {
    await SharedPreferences.getInstance().then((sp) async{
      await sp.setString("current_user_name", user.name);
      await sp.setString("current_user_email", user.email);
      await sp.setString("current_user_password", user.password);
      await sp.setString("current_user_dateOfBirth", user.dateOfBirth);
      print("User added");
    });
  }

  Future<User> getCurrentUser() async {
    User user = User();
    await SharedPreferences.getInstance().then((sp) {
      user.name = sp.getString("current_user_name") ?? "Unknown";
      user.email = sp.getString("current_user_email") ?? "Unknown";
      user.password = sp.getString("current_user_password") ?? "Unknown";
      user.dateOfBirth = sp.getString("current_user_dateOfBirth") ?? "Unknown";
    });
    return user;
  }
}
