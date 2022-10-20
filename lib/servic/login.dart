class Loigin {
  String? email;
  String? password;

  Loigin({this.email, this.password});

  Loigin.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
