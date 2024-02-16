import 'package:shared_preferences/shared_preferences.dart';

bool rememberMe = false;

@override
void initState() {
  // TODO: implement initState

  checkRememberMe();
}

Future<void> checkRememberMe() async {
  final prefs = await SharedPreferences.getInstance();
  final rememberMeValue = prefs.getBool('rememberMe') ?? false;

  setState(() {
    rememberMe = rememberMeValue;
  });

  if (rememberMe) {
    // Kullanıcı daha önce "Beni Hatırla" seçeneğini işaretlediyse,
    // burada oturum açma işlemini gerçekleştirebilirsiniz.
    // Örneğin: login(usernameController.text, passwordController.text);
  }
}

void setState(Null Function() param0) {}

Future<void> saveRememberMe({bool value = false}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('rememberMe', value);
}
