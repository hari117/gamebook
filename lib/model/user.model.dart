import 'package:cloud_firestore/cloud_firestore.dart';

class User
{
 final String bio;
  final String displayName;
  final String id;
  final String photoUrl;

 final String userName;

  User({this.bio, this.displayName, this.id, this.photoUrl,
      this.userName});

  factory User.fromDocument(DocumentSnapshot snapshot)
  {
    return User(
       bio:snapshot["bio"],
      displayName:snapshot["displayName"],
      id:snapshot["id"],
      photoUrl:snapshot["photoUrl"],
      userName:snapshot["userName"],);
  }

}
// class User
// {
//    String bio;
//   String displayName;
//   String id;
//  String photoUrl;
//
//   String userName;
//
//
//
//   static User MatchData(DocumentSnapshot snapshot)
//   {
//     User _user=User();
//     _user.bio=snapshot["bio"];
//     _user.displayName=snapshot["displayName"];
//         _user.id=snapshot["id"];
//         _user.photoUrl=snapshot["photoUrl"];
//         _user.userName=snapshot["userName"];
//         return _user;
//   }
//
//
//
//}