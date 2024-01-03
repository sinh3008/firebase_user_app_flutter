import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_user_app_flutter/models/app_user.dart';
import 'package:firebase_user_app_flutter/models/rating_model.dart';

import '../db/db_helper.dart';
import '../models/brand.dart';
import '../models/image_model.dart';
import '../models/telescope.dart';
import '../utils/constants.dart';

class TelescopeProvider extends ChangeNotifier {
  List<Brand> brandList = [];
  List<Telescope> telescopeList = [];
  
  getAllBrands() {
    DbHelper.getAllBrands().listen((snapshot) {
      brandList = List.generate(snapshot.docs.length, (index) => Brand.fromJson(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  getAllTelescopes() {
    DbHelper.getAllTelescopes().listen((snapshot) {
      telescopeList = List.generate(snapshot.docs.length, (index) => Telescope.fromJson(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  Telescope findTelescopeById(String id) =>
    telescopeList.firstWhere((element) => element.id == id);

  Future<void> updateTelescopeField(String id, String field, dynamic value) {
    return DbHelper.updateTelescopeField(id, {field : value});
  }

  Future<ImageModel> uploadImage(String imageLocalPath) async {
    final String imageName = 'image_${DateTime.now().millisecondsSinceEpoch}';
    final photoRef = FirebaseStorage.instance
        .ref()
        .child('$imageDirectory$imageName');
    final uploadTask = photoRef.putFile(File(imageLocalPath));
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return ImageModel(
      imageName: imageName,
      downloadUrl: url,
      directoryName: imageDirectory,
    );
  }

  Future<void> addRating(String id, AppUser appUser, num rating) async {
    final ratingModel = RatingModel(appUser: appUser, rating: rating);
    await DbHelper.addRating(id, ratingModel);
    final snapshot = await DbHelper.getAllRatings(id);
    final List<RatingModel> ratingList = List.generate(snapshot.docs.length, (index) => RatingModel.fromJson(snapshot.docs[index].data()));
    num total = 0;
    for(final rating in ratingList) {
      total += rating.rating;
    }
    final avgRating = total / ratingList.length;
    return DbHelper.updateTelescopeField(id, {'avgRating' : avgRating});
  }

  Future<void> deleteImage(String pid, ImageModel image) async {
    final photoRef = FirebaseStorage.instance.ref()
        .child('${image.directoryName}${image.imageName}');
    return photoRef.delete();
  }

}