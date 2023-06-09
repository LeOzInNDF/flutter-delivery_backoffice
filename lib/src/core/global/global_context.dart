import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GlobalContext {
  late final GlobalKey<NavigatorState> _navigatorkey;

  static GlobalContext? _instance;

  GlobalContext._();

  static GlobalContext get instance {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorkey = key;

  void loginExpire() {
    Modular.get<Storage>().clean();
    ScaffoldMessenger.of(_navigatorkey.currentContext!).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.only(top: 72),
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Login Expirado',
          message: 'Login Expirado, faça login novamente',
          contentType: ContentType.failure,
        ),
      ),
    );
    Modular.to.navigate('/login');
  }
}
