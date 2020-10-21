import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamebook/widgets/appbar.widget.dart';

class CreateAccoutPage extends StatefulWidget {
  @override
  _CreateAccoutPageState createState() => _CreateAccoutPageState();
}

class _CreateAccoutPageState extends State<CreateAccoutPage> {
  String userName;
  final scoofldkey=GlobalKey<ScaffoldState>();
final globalFormKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scoofldkey,
      appBar: appbarWidget(context, "Set Up Your Profile",removebackbutton:true),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text("Create a username"),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Container(
                    child: Form(
                      key: globalFormKey,
                      child: TextFormField(
                        autovalidate: true,
                        validator: (val)
                        {
                          if(val.trim().length<3 || val.isEmpty)
                            {
                              return "username too short";
                            }else if(val.trim().length>12)
                              {
                                return "username too long";
                              }else
                                {
                                  return null;
                                }
                        },
                        onSaved: (value){
                          userName=value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "username",
                          hintText: "munst be altleast 3 charecters",
                        ),
                      )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: sumbit,
                child: Container(
                  height: 50,
                  width: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Submin"),
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }

  sumbit()
  {

    final form=globalFormKey.currentState;
    if(form.validate())
      {
        form.save();
        SnackBar snackBar=SnackBar(content: Text("Welcone $userName"));
        scoofldkey.currentState.showSnackBar(snackBar);
        Timer(Duration(seconds: 2),(){
          globalFormKey.currentState.save();
          Navigator.pop(context,userName);
        });


      }


  }
}
