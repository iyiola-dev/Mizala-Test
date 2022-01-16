import 'package:flutter/material.dart';
import 'package:mizala_test/api/photos_api.dart';
import 'package:mizala_test/models/photo_model.dart';

class PhotosViewModel extends ChangeNotifier {
  bool? loading = false;
  List<Photo>? photos = [];
  String error = "";
  Api _api = Api();
  PhotosViewModel() {
    getAllPhotos();
  }
  void getAllPhotos() async {
    loading = true;
    notifyListeners();
    try {
      //  photos!.where((photo) => photo.currentUserCollections!.contains(element)).toList();
      photos = await _api.getAllPhotos();
      notifyListeners();
    } catch (e) {
      error = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}
