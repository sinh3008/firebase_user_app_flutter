import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_user_app_flutter/auth/auth_service.dart';
import 'package:firebase_user_app_flutter/db/db_helper.dart';
import 'package:firebase_user_app_flutter/models/app_user.dart';

class UserProvider extends ChangeNotifier {
  AppUser? appUser;
  Future<void> addUser({required User user, String? name, String? phone}) {
    final appUser = AppUser(
      uid: user.uid,
      email: user.email!,
      userName: name,
      phone: phone,
      userCreationTime: Timestamp.fromDate(user.metadata.creationTime!),
    );
    return DbHelper.addUser(appUser);
  }

  getUserInfo() {
    DbHelper.getUserInfo(AuthService.currentUser!.uid).listen((event) {
      if(event.exists) {
        appUser = AppUser.fromJson(event.data()!);
        notifyListeners();
      }
    });
  }

  Future<bool> doesUserExist(String uid) => DbHelper.doesUserExist(uid);

  Future<void> updateUserProfile({required String field, required String value}) {
    return DbHelper.updateUserProfile(AuthService.currentUser!.uid, {field : value});
  }
}
