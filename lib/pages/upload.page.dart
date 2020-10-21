import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamebook/model/user.model.dart';
import 'package:image_picker/image_picker.dart';

class UpLoadPage extends StatefulWidget {
  User currentUser;

  UpLoadPage({this.currentUser});

  @override
  _UpLoadPageState createState() => _UpLoadPageState();
}

class _UpLoadPageState extends State<UpLoadPage> {
  File file;

  handleTakePhoto() async {
    Future.delayed(Duration.zero, () {
      Navigator.pop(context);
    });
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 900);
    setState(() {
      this.file = file;
    });
  }

  getImageFromGalary() async {
    Future.delayed(Duration.zero, () {
      Navigator.pop(context);
    });

    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = file;
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
              ),
              SimpleDialogOption(
                onPressed: () {
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
              onPressed: () => selectImage(context),
            ),
          ),
        ],
      ),
    );
  }

  clearImage() {
    setState(() {
      file == null;
    });
  }

  buildUploadForm() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: clearImage,
        ),
        title: Text("caption post"),
        actions: [
          FlatButton(onPressed: () => print("onpressed"), child: Text("Post"),),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 220,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(file),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    widget.currentUser.photoUrl),
              ),
              title: Container(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "write a caption",
                    border: InputBorder.none,
                  ),
                ),
              )
          ),
          Divider(),
          ListTile(leading: Icon(
            Icons.pin_drop, color: Colors.orange, size: 35,),
            title: Container(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "where was this photo taken?",
                  border: InputBorder.none,
                ),
              ),
            ),),
          Container(
            width: 200,
            height: 100,
            alignment: Alignment.center,
            child: RaisedButton.icon(onPressed: ()=>print("get user location"),
              icon:Icon(Icons.my_location),
              label: Text("use cuurent location"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),),color: Colors.blue,),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return file == null ? buildSpalshScreen() : buildUploadForm();

  }
}
