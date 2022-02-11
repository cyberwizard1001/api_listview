import 'package:api_listview/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users',style: GoogleFonts.poppins(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: const UsersListView(),
    );
  }

  
}
