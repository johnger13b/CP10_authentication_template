import 'package:f_authentication/data/services/firebase_auth.dart';
import 'package:f_authentication/ui/pages/auth/auth_page.dart';
import 'package:f_authentication/ui/pages/content/content_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late final AuthService _service = AuthService.instance;
  final Rx<User?> _user = Rx(null);

  User? get currentUser => _user.value;

  setAuthHandler() {
    ever<User?>(
      _user,
      /* TO DO cuando haya un cambio en _user navega a la pantalla correcta */
      (user) => user == null
          ? Get.off(() => const AuthPage())
          : Get.off(() => const ContentPage()),
    );
    _user.value = _service.currentUser;
  }

  login({required String email, required String password}) async {
    /* TO DO inicia sesion usando el servicio */
    await _service.login(email: email, password: password);
    _user.value = _service.currentUser;
  }

  signUp({required String email, required String password}) async {
    /* TO DO crea una cuenta usando el servicio */
    await _service.signUp(email: email, password: password);
    _user.value = _service.currentUser;
  }

  logout() async {
    /* TO DO cierra sesion usando el servicio */
    await _service.logout();
    _user.value = _service.currentUser; //actualiza variable de usuario a null
  }
}
