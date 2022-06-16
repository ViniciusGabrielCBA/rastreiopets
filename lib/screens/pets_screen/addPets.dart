// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rastreiopets/models/pets/pet.dart';
import 'package:rastreiopets/models/pets/pet_services.dart';
import 'package:rastreiopets/models/user/user_manager.dart';

// ignore: must_be_immutable

class AddPets extends StatefulWidget {
  const AddPets({Key? key}) : super(key: key);

  @override
  State<AddPets> createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {
  TextEditingController nomePetController = TextEditingController();
  String? sexo;
  TextEditingController racaController = TextEditingController();
  TextEditingController vacinaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Pet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nome do Animal:",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          controller: nomePetController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira o nome do pet';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Vacinas: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          controller: vacinaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira as vacinas tomadas.';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Sexo do animal:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: DropdownButtonFormField(
                          value: sexo,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Por favor, insira o sexo do pet';
                            }
                            return null;
                          },
                          items: ['Macho', 'Fêmea']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              sexo = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Raça:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          controller: racaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.orange,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira a raça do pet';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    PetServices petServices = PetServices();
                    Pet pet = Pet(
                      nomePetController.text,
                      sexo,
                      vacinaController.text,
                      racaController.text,
                      UserManager.userScreen?.id,
                    );
                    petServices.addPets(pet);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  "Salvar",
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
