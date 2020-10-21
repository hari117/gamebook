
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamebook/model/user.model.dart';
import 'package:gamebook/widgets/loading.widget.dart';
import 'package:gamebook/widgets/resultuser.widget.dart';
CollectionReference reference =
FirebaseFirestore.instance.collection("users");
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  Future<QuerySnapshot>  futureNames;
  handleSearch(String searchName) {

    Future<QuerySnapshot> querySnapshot=  reference.where("displayName",isGreaterThanOrEqualTo:searchName).getDocuments();
    setState(() {
      futureNames=querySnapshot;
    });

  }
  buildSearchResults()
  {
    return FutureBuilder(
      future: futureNames,
      builder: (context,snapshot){
      if(!snapshot.hasData)
        {
          return circularProgress();
        }
      List<Widget> searchResults=[];
      snapshot.data.documents.forEach((docs){
        User user=User.fromDocument(docs);
        SearchResultUser SearchResult=SearchResultUser(user);
        searchResults.add(SearchResult);

      });
     return ListView(
        children: searchResults,
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(),
      body: futureNames==null ?buildNoContent():buildSearchResults(),
    );
  }

  SearchBar() {
    return AppBar(
        backgroundColor: Colors.white,
        title: TextFormField(
          decoration: InputDecoration(
            hintText: "search for a user",
            filled: true,
            prefixIcon: Icon(
              Icons.account_box,
              size: 28,
            ),
            suffix: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => print("clear button perssed"),
            ),
          ),
          onFieldSubmitted: handleSearch,
        ));
  }

  buildNoContent()
  {
    return Container(
      // alignment: Alignment.center,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(width: 300, height: 300, child: FlutterLogo()),
            Text(
              "FindUser",
              style: TextStyle(fontSize: 30),textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

}





