class Accaunt {
  String? email;
  String? number;
  String? addres;

  Accaunt({this.email, this.number, this.addres});

  Accaunt.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        number = json['number'],
        addres = json['addres'];

  Map<String, dynamic> tojson() =>
      {'email': email, 'number': number, 'addres': addres};
}
