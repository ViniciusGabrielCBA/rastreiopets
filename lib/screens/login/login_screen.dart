import 'package:flutter/material.dart';
import 'package:rastreiopets/models/user/user_local.dart';
import 'package:rastreiopets/models/user/user_manager.dart';
import 'package:rastreiopets/screens/home/main_home_screen.dart';
import 'package:rastreiopets/screens/login/signup_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserLocal userLocal = UserLocal();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Image(
              width: 250,
              height: 250,
              image: AssetImage('assets/images/login.jpg'),
            ),
            const Text(
              'App Rastreio de Pets',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Card(
                elevation: 10,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 20),
                              child: TextFormField(
                                onSaved: (value) => userLocal.email = value,
                                initialValue: userLocal.email,
                                decoration: const InputDecoration(hintText: 'Email...'),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Por favor, insira o email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextFormField(
                                onSaved: (value) => userLocal.password = value,
                                initialValue: userLocal.password,
                                obscureText: true,
                                decoration: const InputDecoration(hintText: 'Senha...'),
                                validator: (value) {
                                  if (value == null) {
                                    return ('Por favor, insira a senha');
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                UserManager _userManager = UserManager();
                                _userManager.signIn(userLocal, onSucess: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const MainHomeScreen(),
                                    ),
                                  );
                                }, onFail: (e) {
                                  Text('$e');
                                });
                              }
                            },
                            child: const Text('Entrar'),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text('Registrar-se'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
