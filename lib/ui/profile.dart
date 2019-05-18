import 'package:flutter/material.dart';
import 'package:flutterapp/network/login.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RaisedButton(
          onPressed: _loginWithGoogle,
          textColor: Colors.white,
          color: Theme.of(context).accentColor,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            child: Text("Login"),
            padding: const EdgeInsets.all(10.0),
          )),
    ));
  }

//  GoogleSignInAccount _currentUser;
//
//  @override
//  void initState() {
//    super.initState();
//    Login login = Login();
//    login.googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
//      setState(() {
//        _currentUser = account;
//      });
//    });
//    login.googleSignIn.signInSilently();
//  }
  _loginWithGoogle() {}
}
