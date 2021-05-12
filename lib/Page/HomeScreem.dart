import 'package:flutter/material.dart';

import 'HomePage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreemState createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: HomePage(),
    );
  }

  ///AppBar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 25,
        ),
        onPressed: () {},
        color: Colors.black,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: Colors.black,
        ),
      ],
    );
  }
}
