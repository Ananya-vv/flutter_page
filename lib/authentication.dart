import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get User => _auth.currentUser;
  Future <String?>signUp({required String email,required String password
  })async
  {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }
  }
  Future<String?>signIn ({required String email,required String password
  })async
  {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    }
    on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  Future<void>signOut()async {
    await _auth.signOut();
    print('signout');
  }
}


