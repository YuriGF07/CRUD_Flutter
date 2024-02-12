import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool? isForm = true;
  bool isEmail = false;

  FieldForm({
    required this.label,
    required this.isPassword,
    required this.controller,
    this.isForm,
    required this.isEmail,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: this.isForm,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 245, 245, 245),
        labelText: label,
      ),
      validator: (value){
        if(value!.length < 5) {
          return 'Digite pelo menos 5 caracteres';
        }
        if(this.isEmail && !value.contains("@")) {
          return 'Digite um email valido';
        }
      }
    );
  }
}