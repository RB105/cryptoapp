import 'package:cryptoapp/view/crypto_page.dart';
import 'package:cryptoapp/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  List<Widget> _screens=[HomePage(),CryptoPage()];

  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: 
      BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart),label: ""),
      ],
      onTap: (value) {
        setState(() {
          _currentIndex=value;
        });
      },
      )
    );
  }
}