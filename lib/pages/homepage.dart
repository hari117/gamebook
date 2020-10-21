import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamebook/model/user.model.dart';
import 'package:gamebook/pages/activityfeed.page.dart';
import 'package:gamebook/pages/createaccoutpage.dart';
import 'package:gamebook/pages/profile.page.dart';
import 'package:gamebook/pages/search.page.dart';
import 'package:gamebook/pages/timeline.page.dart';
import 'package:gamebook/pages/upload.page.dart';
import 'package:google_sign_in/google_sign_in.dart';

CollectionReference reference =
FirebaseFirestore.instance.collection("users");

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isAuth = false;
 User currentUser;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
    googleSignIn.onCurrentUserChanged.listen((accout) {
      signHangle(accout);
    });
    googleSignIn.signInSilently().then((accout) {
      signHangle(accout);
    });
  }

  signHangle(GoogleSignInAccount account) {
    if (account != null) {
      createUserInFirebase();
      print("use sign in successfully $account");
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("isAuth is value is $isAuth");
    return isAuth ? homepage() : autenticationPage();
  }

  Widget autenticationPage() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.blueGrey, Colors.orange])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter Share"),
            InkWell(
              onTap: () {
                print("button pressed");
                logInGoogle();
              },
              child: Container(
                width: 200,
                height: 40,
                alignment: Alignment.center,
                color: Colors.yellowAccent,
                child: Icon(
                  Icons.login_rounded,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget homepage() {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        //  physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          //  TimeLinePage(),
          RaisedButton(
            onPressed: logOutGoogle,
            child: Text("logout"),
          ),
          ActivityFeedPage(),
          UpLoadPage(),
          SearchPage(),
          ProfilePage(),
        ],
        onPageChanged: onPageViewChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black26,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.whatshot,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active,
              ),
              label: "Feedpage"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera,
              ),
              label: "Upload"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle_sharp,
              ),
              label: "Profile"),
        ],
        onTap: onPageViewChanged,
      ),
    );
  }

  onPageViewChanged(int pageNumber) {
    pageController.animateToPage(pageNumber,
        duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
    setState(() {
      pageIndex = pageNumber;
    });
  }

  createUserInFirebase() async {
    GoogleSignInAccount googleSignInAccount = googleSignIn.currentUser;
    DocumentSnapshot doc =
        await reference.document(googleSignInAccount.id).get();
    //check if already user exists
    if (!doc.exists) {
      final userName = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateAccoutPage()));
      reference.doc(googleSignInAccount.id).setData({
        "id": googleSignInAccount.id,
        "userName": userName,
        "photoUrl": googleSignInAccount.photoUrl,
        "eMail": googleSignInAccount.email,
        "displayName": googleSignInAccount.displayName,
        "bio": "",
        "timeStamg": DateTime.now(),
      });
    }

      print("******************Document already exists*********************");
      doc = await reference.document(googleSignInAccount.id).get();
      currentUser= User.fromDocument(doc);
      print("*************user model class ${currentUser.displayName}*********");


  }

  logInGoogle() {
    googleSignIn.signIn();
  }

  logOutGoogle() {
    googleSignIn.signOut();
  }
}
