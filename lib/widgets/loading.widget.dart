import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10.0),
    child: CircularProgressIndicator(
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation(Colors.teal),
    ),
  );
}
linearProgress() {
  return Container(
    alignment: Alignment.topCenter,
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation(Colors.teal),
    ),
  );
}