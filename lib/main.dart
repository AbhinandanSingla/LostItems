import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lostitems/pages/HomePage.dart';
import 'package:lostitems/pages/addPost.dart';
import 'package:lostitems/pages/requestsPage.dart';

import './constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.transparent)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentTabIndex = 0;

  void updateIndex(index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  List<Widget> screens = [HomePage(), AddPost(), RequestsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.blackBackground,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex,
          backgroundColor: colors.mainBackground,
          unselectedItemColor: colors.shadow,
          onTap: updateIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.add, size: 30), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts), label: ""),
          ]),
      body: screens.elementAt(_currentTabIndex),
    );
  }
}

