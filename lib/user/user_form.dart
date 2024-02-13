<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:projeto/container/container_all.dart';
import 'package:projeto/form/field_form.dart';
import 'package:projeto/provider/provider.dart';
import 'package:projeto/user/user.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  String title = "Criar Usuário";
  String child = "Registrar";

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
      setState(() {
        this.title = "Editar Usuário";
        this.child = "Editar";
      });
    }

    GlobalKey<FormState> _key = GlobalKey();

    void save(){

      final isValidate = _key.currentState?.validate();

      if(isValidate == false){
        return;
      }

      _key.currentState?.save();

      //instancia um novo usuario
      User user = User(
      name: controllerName.text, 
      email: controllerEmail.text, 
      password: controllerPassword.text
      );
      if(index != null){
      userProvider.users[index] = user;
      } else{
      int usersLength = userProvider.users.length;

      //salva um novo usuario
      userProvider.users.insert(0, user);
      }
      Navigator.popAndPushNamed(context, "/list");
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
          child: Form(
            key: _key,
            child: Column(
              children: [
                FieldForm(
                label: 'Name', 
                isPassword: false, 
                controller: controllerName,
                isEmail: false
                ), 
                FieldForm(
                label: 'Email', 
                isPassword: false, 
                controller: controllerEmail,
                isEmail: true
                ),
                FieldForm(
                label: 'Password', 
                isPassword: true, 
                controller: controllerPassword,
                isEmail: false
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {save();}, 
                    child: Text(this.child),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 95, 169, 230),),
                      foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
=======
import 'package:flutter/material.dart';
import 'package:projeto/container/container_all.dart';
import 'package:projeto/form/field_form.dart';
import 'package:projeto/provider/provider.dart';
import 'package:projeto/user/user.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  String title = "Criar Usuário";
  String child = "Registrar";

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
      setState(() {
        this.title = "Editar Usuário";
        this.child = "Editar";
      });
    }

    GlobalKey<FormState> _key = GlobalKey();

    void save(){

      final isValidate = _key.currentState?.validate();

      if(isValidate == false){
        return;
      }

      _key.currentState?.save();

      //instancia um novo usuario
      User user = User(
      name: controllerName.text, 
      email: controllerEmail.text, 
      password: controllerPassword.text
      );
      if(index != null){
      userProvider.users[index] = user;
      } else{
      int usersLength = userProvider.users.length;

      //salva um novo usuario
      userProvider.users.insert(0, user);
      }
      Navigator.popAndPushNamed(context, "/list");
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
          child: Form(
            key: _key,
            child: Column(
              children: [
                FieldForm(
                label: 'Name', 
                isPassword: false, 
                controller: controllerName,
                isEmail: false
                ), 
                FieldForm(
                label: 'Email', 
                isPassword: false, 
                controller: controllerEmail,
                isEmail: true
                ),
                FieldForm(
                label: 'Password', 
                isPassword: true, 
                controller: controllerPassword,
                isEmail: false
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {save();}, 
                    child: Text(this.child),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 95, 169, 230),),
                      foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
>>>>>>> c6b14415f315888bbd043e95ee4cf3a615859717
}