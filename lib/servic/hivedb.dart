import 'package:hive/hive.dart';
import 'package:local_data_uyga2/servic/accunt.dart';

class HiveDB {
  var box = Hive.box('ravshanb');

  void storeUser(Accaunt accaunt) async {
    box.put('accaunt', accaunt.tojson());
  }

  Accaunt loadUser() {
    var user = Accaunt.fromJson(box.get('accaunt'));
    return user;
  }

  void removeUser() async {
    box.delete('user');
  }
}
