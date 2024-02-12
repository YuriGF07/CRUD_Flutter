import 'package:flutter/material.dart';
import 'package:projeto/container/container_all.dart';
import 'package:projeto/provider/provider.dart';
import 'package:projeto/user/user.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    List<User> users = userProvider.users;

    int usersLength = users.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 95, 169, 230),
        title: Text('Lista de Usuários'),
        leading: BackButton(onPressed: (){
          userProvider.indexUser = null;
          Navigator.popAndPushNamed(context, "/create");
        },
        ),
      ),
      body: ContainerAll(
        child: ListView.builder(
          itemCount: usersLength,
          itemBuilder: (BuildContext contextBuilder, indexBuilder) =>
          Container(
            child: ListTile(
              title: Text(users[indexBuilder].name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){
                    userProvider.userSelected = users[indexBuilder];
                    userProvider.indexUser = indexBuilder;
                    Navigator.popAndPushNamed(context, "/create");
                  },
                  icon: Icon(Icons.edit, color: Colors.black,)
                  ),
                  IconButton(onPressed: (){
                    userProvider.userSelected = users[indexBuilder];
                    userProvider.indexUser = indexBuilder;
                    Navigator.popAndPushNamed(context, "/view");
                  },
                  icon: Icon(Icons.visibility, color: Colors.lightBlue)
                  ),
                  IconButton(onPressed: (){
                    userProvider.indexUser = null;
                    userProvider.users.removeAt(indexBuilder);
                    Navigator.popAndPushNamed(context, "/create");
                  },
                  icon: Icon(Icons.delete, color: Colors.red)
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.4))
            ),
          )
        ),
      ),
    );
  }
}