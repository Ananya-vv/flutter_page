import 'package:flutter/material.dart';
import 'package:flutter_page/home.dart';
import 'package:flutter_page/welcome.dart';

import 'authentication.dart';
class welcome2 extends StatefulWidget {
  const welcome2({Key? key}) : super(key: key);

  @override
  State<welcome2> createState() => _welcome2State();
}

class _welcome2State extends State<welcome2> {
  final TextEditingController email= TextEditingController();
  final TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        CircleAvatar(
        backgroundImage: AssetImage('images/flutter.jpeg'),
        radius: 60,
      ),
      SizedBox(
      height: 30,
      ),
      Text("Welcome back!",style: TextStyle(fontWeight: FontWeight.bold),),
      SizedBox(
      height: 30,
      ),
      TextField(
        controller: email,
      decoration: InputDecoration(
      prefixIcon: Icon(Icons.mail_outlined),
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      ),
      hintText: 'Email',
      ),
      ),
      SizedBox(
      height: 10,
      ),
      TextField(
        controller: password,
      obscureText: true,
      decoration: InputDecoration(
      prefixIcon: Icon(Icons.lock_outline),
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      ),
      hintText: 'Password',
      ),
      ),
      SizedBox(
      height: 10,
      ),
      TextButton(onPressed: (){
        AuthenticationHelper().signIn(email: email.text, password: password.text).then((result){
          if(result==null){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
          }
          else
          {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: Text(result,style: TextStyle(fontSize: 16),
                 )));
          }
        } );
      }, child: Text('Login',style: TextStyle(color: Colors.white),),
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)),),
      SizedBox(
      height: 10,
      ),
      Row(
      children: [
      Text('Now here ?',style: TextStyle(fontWeight: FontWeight.bold),),
      TextButton(onPressed: (){Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>welcome()));}, child: Text('Get Register Now !')),
      ],
      )
  ],
      )),
    );
  }
}
