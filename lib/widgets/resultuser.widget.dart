import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamebook/model/user.model.dart';

class SearchResultUser extends StatefulWidget {
  User user;

  SearchResultUser(this.user);

  @override
  _SearchResultUserState createState() => _SearchResultUserState();
}

class _SearchResultUserState extends State<SearchResultUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            onTap: () => print("button is pressed"),
            leading: CircleAvatar(
           //   backgroundColor: Colors.green,
              backgroundImage: NetworkImage(widget.user.photoUrl),
            ),
            title: Text(widget.user.displayName),
          ),
          Divider(height: 2,color: Colors.white10,)
        ],
      ),
    );
  }
}
