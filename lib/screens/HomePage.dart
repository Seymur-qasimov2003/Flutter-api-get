import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiget/services/UsersListServices.dart';

import '../models/UsersModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UsersListServices usersListServices = UsersListServices();
  List<ListUsersModelData> usersList = [];
  late bool isLoading;
  @override
  void initState() {
    usersListServices.getUsersList().then((value) {
      setState(() {
        if (value != null && value.data != null) {
          usersList = value.data!.cast<ListUsersModelData>();
          isLoading = true;
        } else {}
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter API Get'),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(usersList[index].avatar!),
              ),
              title: Text(usersList[index].firstName!),
              subtitle: Text(usersList[index].lastName!),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
