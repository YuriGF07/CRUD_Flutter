import 'package:flutter/material.dart';
import 'package:projeto/container/container_all.dart';
import 'package:projeto/form/field_form.dart';
import 'package:projeto/provider/provider.dart';

class UserView extends StatelessWidget {
  UserView ({super.key});

  String title = "Visualizar Usuário";

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();



  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: [
          Container(
            child: TextButton(
              style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              primary: const Color.fromARGB(255, 0, 0, 0)
              ),
              child: Text('Lista de Usuários'),
              onPressed: (){
                Navigator.popAndPushNamed(context, "/list");
              },
            ),
          )
        ],
        backgroundColor: Color.fromARGB(255, 95, 169, 230),
      ),
      body: ContainerAll(
        child: Center(
          child: Column(
            children: [
              FieldForm(
              label: 'Name', 
              isPassword: false, 
              controller: controllerName,
              isForm: false,
              isEmail: false
              ), 
              FieldForm(
              label: 'Email', 
              isPassword: false, 
              controller: controllerEmail,
              isForm: false,
              isEmail: false
              ),
              FieldForm(
              label: 'Password', 
              isPassword: false, 
              controller: controllerPassword,
              isForm: false,
              isEmail: false
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/create");
                  }, 
                  child: Text("Editar"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 95, 169, 230),),
                    foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    userProvider.indexUser = null;
                    userProvider.users.removeAt(index!);
                    Navigator.popAndPushNamed(context, "/create");
                  }, 
                  child: Text("Excluir"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 230, 95, 95),),
                    foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}