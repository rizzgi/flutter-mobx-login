import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
  }

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPass(String value) => password = value;

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isPassValid => password.length >= 6;

  @computed
  VoidCallback? get loginPressed =>
      (isEmailValid && isPassValid && !loading) ? login : null;

  @action
  Future<void> login() async{
    loading = true;

    await Future.delayed(Duration(seconds: 2));


    loading = false;

  }

  @observable
  bool loading = false;


  @action
  void togglePassVisible() => passVisible = !passVisible;

  @observable
  bool passVisible = false;

}
