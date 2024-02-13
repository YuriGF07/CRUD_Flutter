<<<<<<< HEAD
import 'package:flutter/material.dart';

class ContainerAll extends StatelessWidget {
  Widget child;
  
  ContainerAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(235, 229, 229, 0.5),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
=======
import 'package:flutter/material.dart';

class ContainerAll extends StatelessWidget {
  Widget child;
  
  ContainerAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(235, 229, 229, 0.5),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
>>>>>>> c6b14415f315888bbd043e95ee4cf3a615859717
}