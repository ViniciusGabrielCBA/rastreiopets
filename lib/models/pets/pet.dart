class Pet {
  String? id;
  String? nameAnimal;
  String? sexo;
  String? raca;
  String? vacina;
  String? idUser;

  Pet(this.nameAnimal, this.sexo, this.vacina, this.raca, this.idUser, {this.id});
// método para converter formato json em objetos.
  Pet.fromMap(Map<String, dynamic> map)
      : nameAnimal = map['nameAnimal'],
        idUser = map['idUser'],
        sexo = map['sexo'],
        vacina = map['vacina'],
        raca = map['raca'];

  // permitir que possamos enviar informações ao FireBase
  Map<String, dynamic> toMap() {
    return {
      'nomeAnimal': nameAnimal,
      'idUser': idUser,
      'sexo': sexo,
      'vacina': vacina,
      'raca': raca,
    };
  }
}
