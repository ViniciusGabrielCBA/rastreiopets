import 'package:rastreiopets/helpers/validators.dart';
import 'package:rastreiopets/models/user/user_local.dart';
import 'package:rastreiopets/models/user/user_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  UserLocal userLocal = UserLocal();

  SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Criar Conta de Usúario'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 10,
          color: Colors.grey[200],
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Campo obrigatorio.';
                    } else if (name.trim().split('').length <= 1) {
                      return 'Preencha seu nome Completo';
                    }
                    return null;
                  },
                  onSaved: (name) => userLocal.name = name,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Campo obrigatório.';
                    } else if (!emailValidator(email)) {
                      return 'E-mail invalido!!!';
                    }
                    return null;
                  },
                  onSaved: (email) => userLocal.email = email,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  obscureText: true,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Campo obrigatório.';
                    } else if (password.length < 6) {
                      return ' Senha deve ter ao menos 6 caracteres.';
                    }
                    return null;
                  },
                  onSaved: (password) => userLocal.password = password,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a senha.'),
                  obscureText: true,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Campo obrigatorio.';
                    } else if (password.length < 6) {
                      return ' Senha deve ter ao menos 6 caracteres.';
                    }
                    return null;
                  },
                  onSaved: (password) => userLocal.confirmPassword = password,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Telefone: '),
                  keyboardType: TextInputType.phone,
                  validator: (telefone) {
                    if (telefone!.isEmpty) {
                      return 'Campo obrigatório.';
                    } else if (telefone.length <= 11 && telefone.length > 13) {
                      return 'Telefone inválido. Verifique o padrão do número (DDD) + 9 9999 9999';
                    }
                    return null;
                  },
                  onSaved: (telefone) => userLocal.telefone = telefone,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Rua'),
                  keyboardType: TextInputType.streetAddress,
                  validator: (rua) {
                    if (rua!.isEmpty) {
                      return 'Campo obrigatório.';
                    }
                    return null;
                  },
                  onSaved: (rua) => userLocal.rua = rua,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Número'),
                  keyboardType: TextInputType.number,
                  validator: (numero) {
                    if (numero!.isEmpty) {
                      return 'Campo obrigatório.';
                    }
                    return null;
                  },
                  onSaved: (numero) => userLocal.numeroCasa = numero,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Complemento'),
                  keyboardType: TextInputType.streetAddress,
                  validator: (complemento) {
                    if (complemento!.isEmpty) {
                      return 'Campo obrigatório.';
                    }
                    return null;
                  },
                  onSaved: (complemento) => userLocal.complemento = complemento,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Bairro'),
                  keyboardType: TextInputType.streetAddress,
                  validator: (bairro) {
                    if (bairro!.isEmpty) {
                      return 'Campo obrigatório.';
                    }
                    return null;
                  },
                  onSaved: (bairro) => userLocal.bairro = bairro,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Cidade'),
                  keyboardType: TextInputType.streetAddress,
                  validator: (cidade) {
                    if (cidade!.isEmpty) {
                      return 'Campo obrigatório.';
                    }
                    return null;
                  },
                  onSaved: (cidade) => userLocal.cidade = cidade,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Estado'),
                  keyboardType: TextInputType.streetAddress,
                  validator: (estado) {
                    if (estado!.isEmpty) {
                      return 'Campo obrigatório.';
                    }
                    return null;
                  },
                  onSaved: (estado) => userLocal.estado = estado,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (userLocal.password != userLocal.confirmPassword) {
                        const ScaffoldMessenger(
                          child: SnackBar(
                            content: Text(
                              'Senhas não coincidem.',
                              style: TextStyle(fontSize: 11),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      UserManager userManager = UserManager();
                      userManager.signUp(
                        userLocal,
                        onSucess: () {
                          Navigator.of(context).pop();
                        },
                        onFail: (e) {
                          ScaffoldMessenger(
                            child: SnackBar(
                              content: Text(
                                'Falha ao registrar usuário: $e',
                                style: const TextStyle(fontSize: 11),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
