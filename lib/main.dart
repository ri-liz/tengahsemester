import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black87,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget{
  @override
  _LoginState createState()=> _LoginState();
}

class _LoginState extends State<Login>{
  @override
  var _username;
  var _password;
  var _notifText;
  void _updateUsername(value){
    setState(() {
      _username=value;
    });
  }
  void _updatePassword(value){
    setState(() {
      _password=value;
    });
  }

  String _cekPassword() {
    print(_username);
    print(_password);
    if(_username=="123" && _password=="123"){
      return "1";
    }else{
      return "0";
    }
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(0),
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.person, size: 55, color: Colors.white,),
              ),
            ),
            SizedBox(height: 20),

            Text("Login", style: TextStyle(fontSize: 15, color: Colors.white,)),

            SizedBox(height: 20,),

            TextFormField(
              onChanged: (val){
                _updateUsername(val);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                prefixIcon: Icon(Icons.person, size: 45, color: Colors.white,),
                hintText: "Masukan Username",
                labelText: "Username",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 50,),

            TextFormField(
              onChanged: (val){
                _updatePassword(val);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                prefixIcon: Icon(Icons.lock, size: 45, color: Colors.white,),
                hintText: "Masukan Password",
                labelText: "Password",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 50,),

            Card(
              color: Colors.black,
              elevation: 5,
              child: Container(
                height: 50,
                child: InkWell(
                  onTap: (){
                    var cek=_cekPassword();
                    if (cek=="1"){
                      _notifText="Password Benar";
                      print(1);
                    }else if(cek==0){
                      _notifText="Password Salah";
                      print(0);
                    }
                  },
                  splashColor: Colors.white,
                  child: Center(
                    child: Text("Masuk", style: TextStyle(fontSize: 15, color: Colors.white),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
