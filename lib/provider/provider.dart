import 'package:flutter/material.dart';
import 'package:projeto/user/user.dart';

class UserProvider extends InheritedWidget {
  static const _baseUrl = 'https://crud-flutter-37fdc-default-rtdb.firebaseio.com/';
  final Widget child;
  
  List<User> users = [];
  User? userSelected;
  int? indexUser;

  UserProvider({required this.child}) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  bool updateShouldNotify(UserProvider widget) {
    return true;
  }
}