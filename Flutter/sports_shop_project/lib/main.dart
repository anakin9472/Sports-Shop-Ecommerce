import 'package:flutter/material.dart';
import 'package:sports_shop_project/home_page.dart';

//Class User and the user's properties & constructors
class User {
  String email = "", username = "", firstname = "";

  User(String inputEmail, String inputUsername) {
    email = inputEmail;
    username = inputUsername;
  }

  //Constructor using named parameters
  User.fromUser(
      {required String inputEmail,
      required inputUsername,
      required String inputFirstname}) {
    email = inputEmail;
    username = inputUsername;
    firstname = inputFirstname;
  }
}

// Calling function which has one expression
// void main() => runApp(DemoApp());

void main() {
  var user = User('user@gmail.com', 'thach9472');
  var user2 = User.fromUser(
      inputUsername: 'thach9472',
      inputEmail: 'user@gmail.com',
      inputFirstname: 'thach');
  print(user.email);
  print(user2.username);

  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //use a specific widget class for home widget
    return MaterialApp(home: HomePageWidget());
  }
}
