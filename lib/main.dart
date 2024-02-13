import 'package:flutter/material.dart';
import 'package:projeto/provider/provider.dart';
import 'package:projeto/user/user_list.dart';
import 'package:projeto/user/user_form.dart';
import 'package:projeto/user/user_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD',
        home: UserForm(),
        routes: {
          "/create": (_) => UserForm(),
          "/list": (_) => UserList(),
          "/view": (_) => UserView(),
        },
      ),
    );
  }
}