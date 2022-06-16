// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rastreiopets/models/pets/pet.dart';
import 'package:rastreiopets/models/pets/pet_services.dart';
import 'package:rastreiopets/models/user/user_manager.dart';
import 'package:rastreiopets/screens/pets_screen/qr_code.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({Key? key}) : super(key: key);

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  PetServices petScreen = PetServices();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: petScreen.getPets(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  Pet pet = Pet(
                    snapshot.data?.docs[index].get('nomeAnimal'),
                    snapshot.data?.docs[index].get('sexo'),
                    snapshot.data?.docs[index].get('vacina'),
                    snapshot.data?.docs[index].get('raca'),
                    snapshot.data?.docs[index].get('idUser'),
                    id: snapshot.data?.docs[index].id,
                  );
                  return GestureDetector(
                    onTap: () {
                      String dadosDP = 'Nome Dono: ${UserManager.userScreen!.name}';
                      dadosDP += '\nE-mail: ${UserManager.userScreen!.email}';
                      dadosDP += '\nTelefone: ${UserManager.userScreen!.telefone}';
                      dadosDP += '\nBairro: ${UserManager.userScreen!.bairro}';
                      dadosDP += '\nRua: ${UserManager.userScreen!.rua}';
                      dadosDP += '\nNome Do Animal: ${pet.nameAnimal}';
                      dadosDP += '\nSexo Do Animal: ${pet.sexo}';
                      dadosDP += '\nRaça Do Animal: ${pet.raca}';
                      dadosDP += '\nVacinas tomadas: ${pet.vacina}';
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QrCodeScreen(data: dadosDP),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 38.0, left: 38, right: 38),
                      child: Card(
                        color: Colors.lightGreen,
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(38.0),
                          child: Column(
                            children: [
                              Text(
                                '${pet.nameAnimal}',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                'Sexo: ${pet.sexo}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Raça: ${pet.raca}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Vacinas: ${pet.vacina}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: snapshot.data!.size,
              );
            } else if (snapshot.hasData) {
              return const Center(
                child: Text(
                  'Não há pets disponíveis.',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
