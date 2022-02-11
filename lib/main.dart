import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:api_listview/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:api_listview/utils/colors.dart' as colors;

class darkTheme {
  static ThemeData get DarkTheme {
    return ThemeData(
      fontFamily: 'Nunito',
      primaryColor: Colors.white,
      scaffoldBackgroundColor: colors.scaffoldColor,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.nunito(color: Colors.white, fontSize: 16,),
        bodyText2: GoogleFonts.nunito(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        caption: GoogleFonts.nunito(color: Colors.white70, fontSize: 14)
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0, backgroundColor: Colors.transparent, centerTitle: true),

    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}