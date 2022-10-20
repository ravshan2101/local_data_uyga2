import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:local_data_uyga2/servic/accunt.dart';
import 'package:local_data_uyga2/servic/hivedb.dart';

class Two extends StatefulWidget {
  const Two({Key? key}) : super(key: key);

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
  final emailcon = TextEditingController();
  final numbercon = TextEditingController();
  final adresscon = TextEditingController();
  dologin() async {
    String email = emailcon.text.toString().trim();
    String number = numbercon.text.toString().trim();
    String adres = adresscon.text.toString().trim();

    var user1 = Accaunt(email: email, number: number, addres: adres);
    HiveDB().storeUser(user1);

    var user2 = HiveDB().loadUser();
    print(user2.addres);
    print(user2.email);
    print(user2.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 130, 106),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
          ),
          Container(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Text(
                'Welcome',
                style: TextStyle(color: Colors.grey),
              )),
          Container(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60, left: 30),
                  child: Text(
                    "Email",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: emailcon,
                      decoration: InputDecoration(hintText: 'Email'),
                    )),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 30),
                  child: Text(
                    "Number",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: numbercon,
                      decoration: InputDecoration(hintText: 'Number'),
                    )),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 30),
                  child: Text(
                    "Addres",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: adresscon,
                      decoration: InputDecoration(hintText: 'Addres'),
                    )),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    color: Color.fromARGB(255, 12, 130, 106),
                    onPressed: () {
                      dologin();
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                      )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'OR',
                            style: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/5.jpeg'))),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/3.png'))),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/4.jpeg'))),
                    )
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'nt have an account?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '  Sign In',
                        style: TextStyle(
                            color: Color.fromARGB(255, 12, 130, 106),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
        ],
      )),
    );
  }
}
