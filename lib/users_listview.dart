import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }

}

class UsersListView extends StatefulWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  _UsersListViewState createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {


  Future<List<User>> _fetchUsers() async {

    const userAPIURL = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(userAPIURL));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Unable to establish a connection with the API. Please check your network (or, the API might be down)');
    }
  }

  ListView _userListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].name, data[index].username, data[index].email, Icons.work);
        });
  }

  ListTile _tile(String name, String username, String email,  IconData icon) => ListTile(
    title: Text(name,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(username),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<User>? data = snapshot.data;
          return _userListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );;
  }
}

