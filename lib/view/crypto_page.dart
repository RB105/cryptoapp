import 'package:cryptoapp/view/drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Crypto Page"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_card,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
