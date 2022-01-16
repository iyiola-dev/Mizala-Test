import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mizala_test/screen/photoDetailScreen.dart';
import 'package:mizala_test/viewmodel/photos_viewmodel.dart';

class PhotosListScreen extends StatefulWidget {
  const PhotosListScreen({Key? key}) : super(key: key);

  @override
  _PhotosListScreenState createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context,
        T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
      final model = watch(photoVm);
      return Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search Tags",
                      border: OutlineInputBorder(borderSide: BorderSide())),
                ),
                SizedBox(
                  height: 20,
                ),
                model.loading!
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: model.photos!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 200,
                                child: InkWell(
                                  onTap: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (_) => PhotoDetailScreen(
                                                photo: model.photos![index],
                                              ))),
                                  child: Card(
                                    child: Image.network(
                                      model.photos![index].urls!.regular!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }))
              ],
            ),
          ),
        ),
      );
    });
  }
}

final photoVm =
    ChangeNotifierProvider<PhotosViewModel>((ref) => PhotosViewModel());
