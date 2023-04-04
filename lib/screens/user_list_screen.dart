import 'package:flutter/material.dart';
import 'package:statemanagement/model/user.dart';
import 'package:statemanagement/widget/user_list.dart';

class UserListScreen extends StatefulWidget {
  final List<User> users;
  final Function(User) onDelete;

  const UserListScreen(this.users, this.onDelete, {super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  deleteUser(User user) {
    setState(() {
      widget.onDelete(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: UserList(widget.users, deleteUser),
      ),
    );
  }
}
