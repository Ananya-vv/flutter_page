import 'package:flutter/material.dart';
import 'package:flutter_page/authentication.dart';
import 'package:flutter_page/home.dart';
import 'package:flutter_page/welcome2.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  bool? _value=false;
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
            Row(
              children: [
                Text("Welcome!",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height: 10,
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
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                hintText: 'Confirm Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.contact_page_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                hintText: 'Full name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
      CheckboxListTile(
        value: _value,
        onChanged: (bool? value) {
          setState(() {
            _value=value ;
          });
        },
        title: Text("By creating account, I agree to Terms & Conditions and Privacy Policy."),
      ),
            SizedBox(
              height: 10,
            ),
            TextButton(onPressed: (){
              AuthenticationHelper().signUp(email: email.text, password: password.text).then((result){
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
            }, child: Text('Sign Up',style: TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)),),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Already here ?',style: TextStyle(fontWeight: FontWeight.bold),),
                TextButton(onPressed: (){Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) =>welcome2()));}, child: Text('Get Logged in Now !')),
              ],
            )


          ],
        ),
      ),
    );
  }
}
