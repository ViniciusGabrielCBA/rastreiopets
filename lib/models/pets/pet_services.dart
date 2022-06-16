import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rastreiopets/models/pets/pet.dart';
import 'package:rastreiopets/models/user/user_manager.dart';

class PetServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('pets');

//método utiliado para gravar dados no firebase
  addPets(Pet pet) {
    _firestore.collection('pets').add(pet.toMap());
  }

//método para deletar pets no firebase
  void deletePet(String id) async {
    await collectionReference.doc(id).delete();
  }

  Stream<QuerySnapshot> getPets() {
    return collectionReference.where('idUser', isEqualTo: UserManager.userScreen?.id).snapshots();
  }
}
