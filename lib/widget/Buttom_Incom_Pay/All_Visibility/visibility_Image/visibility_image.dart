import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../widget_container.dart';
import 'viewImage_afterPresson.dart';

// ignore: camel_case_types
class Visibility_Image extends StatefulWidget {
  const Visibility_Image({Key? key}) : super(key: key);

  @override
  _Visibility_ImageState createState() => _Visibility_ImageState();
}

// ignore: camel_case_types
class _Visibility_ImageState extends State<Visibility_Image> {
  bool isVisabile3 = false;

  final ImagePicker _picker = ImagePicker();

  List<Asset> images = [];
  List<Asset> resultList = [];

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Stack(children: [
          InkWell(
            onTap: () => setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(images);
              }));
            }),
            child: AssetThumb(
              asset: asset,
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              child: IconButton(
                  icon: Icon(
                    Icons.delete,
                  ),
                  onPressed: () => setState(() {
                        images.removeAt(index);
                      })),
            ),
          )
        ]);
      }),
    );
  }

  Future<void> loadAssets() async {
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "Camera"),
        materialOptions: MaterialOptions(
          startInAllView: true,
          actionBarColor: "#FCD71B",
          actionBarTitle: "Task Bee",
          allViewTitle: "All Photos",
          selectCircleStrokeColor: "#FCD71B",
          autoCloseOnSelectionLimit: true,
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isVisabile3 = !isVisabile3;
            });
          },
          child: Widget_container(text: 'Image'),
        ),
        Visibility(
            visible: isVisabile3,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: loadAssets,
                          child: Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo_rounded),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Upload Image",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: buildGridView(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
