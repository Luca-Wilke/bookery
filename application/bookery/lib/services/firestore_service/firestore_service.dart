import 'package:bookery/models/user.dart';
import 'package:bookery/services/services_library.dart';
import 'package:bookery/utils/util_library.dart';

class FirestoreService {

  static final CollectionReference _usersCollectionReference = Firestore.instance.collection("users");

  static Future<bool> createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.uid).setData(
        user.toJson(),
      );

      logger.i("Successfully created user document.");

      return true;
    } catch (e) {
      throw new FirestoreError(
        message: "Failed to create user document. \n" + e.message
      );
    }
  }

  static Future<bool> deleteUser(String uid) async {
    try {
      await Firestore.instance.runTransaction((transaction) async {
        await transaction.delete(_usersCollectionReference.document("uid"));
      });

      logger.i("Successfully deleted user document.");

      return true;
    } catch (e) {
      throw new FirestoreError(
        message: "Failed to delete user document. User id: {$uid} \n" + e.message
      );
    }
  }

  static Future<User> getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();

      //there is no user document for given user id
      if (!userData.exists) {
        throw new FirestoreError(
          message: "This document does not exist. uid: {$uid}. Failed to read user document."
        );
      }

      print("Successfully read user document: \n");
      print(userData.data);

      return User.fromData(userData.data);
    } catch (e) {
      throw new FirestoreError(
        message: "Failed to get user document of uid {$uid}. \n" + e.message
      );
    }
  }
 
}