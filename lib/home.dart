import 'package:flutter/material.dart';
import 'package:flutter_page/authentication.dart';
import 'package:flutter_page/welcome2.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter'),),
      backgroundColor: Colors.cyan,
      body: Column(
        children: [
          SizedBox(height: 80,),
          Text("Welcome"),
          TextButton(onPressed: (){
            AuthenticationHelper().signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>welcome2())));
          }, child: Text('SignOut')),
        ],
      ),
    );
  }
}
