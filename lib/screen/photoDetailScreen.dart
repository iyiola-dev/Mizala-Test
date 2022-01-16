import 'package:flutter/material.dart';
import 'package:mizala_test/models/photo_model.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo? photo;

  PhotoDetailScreen({this.photo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Image.network(
                photo!.urls!.full!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              photo!.description ?? photo!.altDescription ?? "",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.black),
              ),
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Likes: ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                        TextSpan(
                            text: photo!.likes.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black))
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Tags:",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                        TextSpan(
                            text: ' Not available',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black))
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Download: ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                        TextSpan(
                            text: ' Not Available',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black))
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Location:",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                        TextSpan(
                            text: " Not Available",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black))
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
