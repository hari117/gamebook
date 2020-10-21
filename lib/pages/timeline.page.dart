import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamebook/widgets/appbar.widget.dart';
import 'package:gamebook/widgets/loading.widget.dart';

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
 //CollectionReference ref = FirebaseFirestore.instance.collection("users");
//  List<dynamic> temp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  deleteUserDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarWidget(context, "flutterShare", istrue: true),
        // body: Container(
        //   child: ListView.builder(
        //       itemCount: temp.length,
        //       itemBuilder: (context, index) {
        //         return Text(temp[index]);
        //       }),
        // ),
        // body: StreamBuilder<QuerySnapshot>(
        //     stream: ref.snapshots(),
        //     builder: (context, snap) {
        //       if (!snap.hasData) {
        //         return circularProgress();
        //       }
        //       List<Text> listofData =
        //           snap.data.documents.map((docs) => Text(docs['name'])).toList();
        //
        //       print("***************snap.runtimeType*****************");
        //       for (int i = 0; i < listofData.length; i++) {
        //         print(listofData[i]);
        //       }
        //       return Container(
        //         child: ListView(
        //           children: listofData,
        //         )
        //       );
        //     })
  );
  }



  // updateUserDate()
  // {
  // ref.document("123456789").updateData({"name":"amuku dumuku"});
  // }
  // addUserDate()
  // {
  //  // ref.add({"name":"bhartvaj","age":20});
  //   ref.document("123456789").setData({"name":"kumar","age":20});
  // }
  //
  // deleteUserDate()
  // {
  //   ref.document("123456789").delete();
  // }
}
