// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rastreiopets/models/pets/pet.dart';
import 'package:rastreiopets/models/pets/pet_services.dart';

class RemovePets extends StatefulWidget {
  const RemovePets({Key? key}) : super(key: key);

  @override
  State<RemovePets> createState() => _RemovePetsState();
}

class _RemovePetsState extends State<RemovePets> {
  PetServices petScreen = PetServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remover Pet"),
      ),
      body: Padding(
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Confirmação'),
                            content: SingleChildScrollView(
                              child: ListBody(children: const [
                                Text('Deseja excluir o pet?'),
                              ]),
                            ),
                            actions: [
                              TextButton(
                                onPressed: (() {
                                  petScreen.deletePet(pet.id ?? '');
                                  Navigator.of(context).pop();
                                }),
                                child: const Text('Confirmar'),
                              ),
                              TextButton(
                                  onPressed: (() {
                                    Navigator.of(context).pop();
                                  }),
                                  child: const Text('Cancelar'))
                            ],
                          );
                        },
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
                  'Não há pets para remover.',
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
