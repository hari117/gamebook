import 'package:flutter/material.dart';
import 'package:gamebook/widgets/appbar.widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbarWidget(context,"flutterShare"),
      body: Center(child: Text("profilePage")),
    );
  }
}
