import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rastreiopets/models/user/user_local.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class UserManager {
  static UserLocal? userScreen;
  //método para realizar a autenticação no firebase com email e senha
  Future<void> signIn(
    UserLocal userLocal, {
    Function? onSucess,
    Function? onFail,
  }) async {
    try {
      User? user = (await _auth.signInWithEmailAndPassword(email: userLocal.email!, password: userLocal.password!)).user;
      final doc = await _firestore.collection('user').doc(user?.uid).get();

      userScreen = UserLocal(
        name: doc.get('name'),
        email: doc.get('email'),
        bairro: doc.get('bairro'),
        rua: doc.get('rua'),
        telefone: doc.get('telefone'),
      );
      userScreen?.id = user!.uid;
      //função callback
      onSucess!();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      onFail!();
    }
  }

  //método para registrar o usuário no firebase.
  Future<void> signUp(
    UserLocal userLocal, {
    Function? onSucess,
    Function? onFail,
  }) async {
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(email: userLocal.email!, password: userLocal.password!)).user;
      userScreen = userLocal;
      userScreen?.id = user!.uid;
      await _firestore.collection('user').doc(user?.uid).set(userLocal.toMap());
      onSucess!();
    } catch (e) {
      debugPrint.toString();
      onFail!();
    }
  }
}
