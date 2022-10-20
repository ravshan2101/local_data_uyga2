import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_data_uyga2/servic/login.dart';
import 'package:local_data_uyga2/servic/two.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('ravshan');
  await Hive.openBox('ravshanb');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'home': (context) => MyHomePage(), 'two': (context) => Two()},
      initialRoute: 'home',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailcontroller = TextEditingController();
  final pwcontroller = TextEditingController();

  void dologin() async {
    String email = emailcontroller.text.toString().trim();
    String pw = pwcontroller.text.toString().trim();

    var user = Loigin(email: email, password: pw);
    var box = Hive.box('ravshan');
    box.put('user', user.toJson());

    var user2 = Loigin.fromJson(box.get('user'));
    print(user2.email);
    print(user2.password);
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
            height: 50,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/1.jpeg'),
            ),
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
              'Sign In',
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
                      controller: emailcontroller,
                      decoration: InputDecoration(hintText: 'Email'),
                    )),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 30),
                  child: Text(
                    "Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: pwcontroller,
                      decoration: InputDecoration(hintText: 'Password'),
                    )),
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  'Forget Password ?',
                  style: TextStyle(color: Colors.grey),
                )),
                SizedBox(
                  height: 20,
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
                      'Sign In',
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
                  height: 120,
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
                        Navigator.of(context).pushNamed('two');
                      },
                      child: Text(
                        '  Sign Up',
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
