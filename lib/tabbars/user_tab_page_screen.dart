// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rastreiopets/models/user/user_home_screen.dart';
import 'package:rastreiopets/screens/pets_screen/pet_screen.dart';

class UserTabPageScreen extends StatefulWidget {
  const UserTabPageScreen({Key? key}) : super(key: key);

  @override
  State<UserTabPageScreen> createState() => _UserTabPageScreenState();
}

class _UserTabPageScreenState extends State<UserTabPageScreen> {
  final List<String> _myList = ['Informações do Usuário', 'QRCode - Meus Pets'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _myList.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rastreio de Pets - App'),
          bottom: TabBar(
            tabs: _myList.map(
              (e) {
                return Tab(
                  text: e.toString(),
                );
              },
            ).toList(),
          ),
        ),
        body: const TabBarView(
          children: [
            UserHomeScreen(),
            PetScreen(),
          ],
        ),
      ),
    );
  }
}
