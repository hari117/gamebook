import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpLoadPage extends StatefulWidget {
  @override
  _UpLoadPageState createState() => _UpLoadPageState();
}

class _UpLoadPageState extends State<UpLoadPage> {
  File file;

  handleTakePhoto()
  async {
    Future.delayed(Duration.zero, () {
      Navigator.pop(context);
    });
    Navigator.pop(context);
    File file=await ImagePicker.pickImage(source: ImageSource.camera,maxHeight: 600,maxWidth: 900);
    setState(() {
      this.file=file;
    });
  }

  getImageFromGalary()
  async{
    Future.delayed(Duration.zero, () {
      Navigator.pop(context);
    });

    File file=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.file=file;
    });
  }
  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("create post"),
            children: [
              SimpleDialogOption(
                onPressed: handleTakePhoto,
                child: Text("photo with camera"),


              ),
              SimpleDialogOption(
                child: Text("image from galary"),
                  onPressed: getImageFromGalary,


              ), SimpleDialogOption(
                onPressed: (){
          Navigator.pop(context);
                },
                child: Text("cancel"),


              ),
            ],
          );
        });
  }
  Container buildSpalshScreen() {
    return Container(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Upload Image",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.white10,
              onPressed:()=> selectImage(context),
            ),
          ),
        ],
      ),
    );
  }
  buildUploadForm()
  {
    return Text("file Uploaded");
  }
  @override
  Widget build(BuildContext context) {
   return file==null ? buildSpalshScreen():buildUploadForm();
   //  return buildSpalshScreen();
  }






}
