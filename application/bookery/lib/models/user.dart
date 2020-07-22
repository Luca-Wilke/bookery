import 'package:meta/meta.dart';

class User {

  final String uid;
  final String name; //the display name other users are seeing

  User({
    @required this.uid,
    @required this.name
  });

  //convert firestore document format to user model
  User.fromData(Map<String, dynamic> data) :
    uid = data["uid"],
    name = data["name"];

  //convert user model to firestore document format
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name
    };
  }

}