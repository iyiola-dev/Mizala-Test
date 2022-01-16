import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mizala_test/api/splashkey.dart';
import 'package:mizala_test/models/photo_model.dart';

class Api {
  String api = "https://api.unsplash.com/photos?per_page=30";
  Future<List<Photo>?> getAllPhotos() async {
    List<Photo>? photos;
    try {
      var result = await http.get(Uri.parse(api),
          headers: {"Authorization": "Client-ID $ACCESSKEY"});
      print(result.body);
      if (result.statusCode == 200) {
        List res = jsonDecode(result.body) as List;
        photos = res.map((e) => Photo.fromJson(e)).toList();
      }
      return photos;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
