import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefs {
  Future<bool> checkIfLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("logged")) {
      return true;
    } else {
      return false;
    }
  }

  Future saveUserDataToDevice(String username, String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("logged", "true");
    sharedPreferences.setString("username", username);
    sharedPreferences.setString("email", email);
  }

  Future delUserDataFromDevice() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("logged");
    sharedPreferences.remove("username");
    sharedPreferences.remove("email");
  }

  Future<UserData> getUserDataFromdevice() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String username = sharedPreferences.getString("username") ?? "";
    String email = sharedPreferences.getString("email") ?? "";
    UserData user = UserData(username: username, chatid: email);
    return user;
  }
}

class UserData {
  String username;
  String chatid;
  UserData({
    required this.username,
    required this.chatid,
  });
}
