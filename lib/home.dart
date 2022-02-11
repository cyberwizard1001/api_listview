import 'package:api_listview/main.dart';
import 'package:api_listview/users_listview.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users', style: darkTheme.DarkTheme.textTheme.bodyText2,),
      elevation: 0,
      backgroundColor: const Color(0xff320097),
      centerTitle: true,),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff320097),
            Color(0xff1d0644)
          ],
        ),
        ),
        child: const UsersListView(),
      )
    );
  }

  
}
