class UserLocal {
  String? id;
  String? name;
  String? email;
  String? rua;
  String? numeroCasa;
  String? bairro;
  String? cidade;
  String? complemento;
  String? estado;
  String? telefone;
  String? password;
  String? confirmPassword;
  String? image;

  UserLocal({
    this.id,
    this.name,
    this.email,
    this.telefone,
    this.rua,
    this.numeroCasa,
    this.bairro,
    this.cidade,
    this.complemento,
    this.estado,
    this.password,
    this.confirmPassword,
  });

// método para converter algum objeto para uma estrutura de dados compatível
// com a estrutura do firebase
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'telefone': telefone,
      'rua': rua,
      'numeroCasa': numeroCasa,
      'bairro': bairro,
      'cidade': cidade,
      'complemento': complemento,
      'estado': estado,
      'password': password,
      'confirmPassword': confirmPassword
    };
  }

  // Método para converter formato Json para objeto.
  factory UserLocal.fromMap(Map<String, dynamic> map) {
    return UserLocal(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        telefone: map['telefone'],
        rua: map['rua'],
        numeroCasa: map['numeroCasa'],
        bairro: map['bairro'],
        cidade: map['cidade'],
        complemento: map['complemento'],
        estado: map['estado'],
        password: map['password'],
        confirmPassword: map['confirmPassword']);
  }
}
