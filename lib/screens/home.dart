import 'package:flutter/material.dart';
import 'package:statemanagement/screens/user_list_screen.dart';

import '../model/user.dart';
import '../widget/button.dart';
import '../widget/input.dart';
import '../widget/user_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String? _name;
  String? _city;

  List<User> userList = [];

  addUser(User user) {
    setState(() {
      userList.add(user);
    });
  }

  deleteUser(User user) {
    setState(() {
      userList.removeWhere((user) => user.name == user.name);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          "Riverpod",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Form sheet",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 16),
              CheetahInput(
                labelText: 'Name',
                onSaved: (String? value) {
                  _name = value;
                },
              ),
              const SizedBox(height: 16),
              CheetahInput(
                labelText: 'City',
                onSaved: (String? value) {
                  _city = value;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubmitButton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      _formKey.currentState!.save();

                      addUser(User(_name, _city));
                    },
                  ),
                  const SizedBox(width: 8),
                  SubmitButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserListScreen(userList, deleteUser),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              UserList(userList, deleteUser),
            ],
          ),
        ),
      ),
    );
  }
}
