import 'dart:ui';

import 'package:app_mmobx_login/screens/list_screen.dart';
import 'package:app_mmobx_login/stores/login_store.dart';
import 'package:app_mmobx_login/widgets/custom_icon_buttom.dart';
import 'package:app_mmobx_login/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_){
                  return CustomTextField(
                    hint: 'E-mail',
                    prefix: const Icon(Icons.account_circle),
                    textInputType: TextInputType.emailAddress,
                    onChanged: loginStore.setEmail,
                    enabled: !loginStore.loading,
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                Observer(
                  builder: (_) {
                    return CustomTextField(
                      hint: 'Senha',
                      prefix: const Icon(Icons.lock),
                      obscure: !loginStore.passVisible,
                      onChanged: loginStore.setPass,
                      enabled: !loginStore.loading,
                      suffix: CustomIconButtom(
                        radius: 32,
                        iconData: !loginStore.passVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTap: loginStore.togglePassVisible,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Observer(builder: (_) {
                  return SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: loginStore.loginPressed,
                      child: loginStore.loading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
