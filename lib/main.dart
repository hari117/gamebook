import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/homepage.dart';

void main() async{
  await connectFirebase();
  runApp(MyApp());
}


connectFirebase()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
