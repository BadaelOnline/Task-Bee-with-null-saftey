import 'package:financial/widget/Form_Pay_Expencies/viewImage_fromList.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_description.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';

class AllVisibility extends StatefulWidget {
  const AllVisibility({Key? key}) : super(key: key);

  @override
  _AllVisibilityState createState() => _AllVisibilityState();
}

class _AllVisibilityState extends State<AllVisibility> {
  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController exchangeIdController = TextEditingController();
  TextEditingController walletIdController = TextEditingController();
  TextEditingController contactIdController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();

  bool isVisabile = false;
  bool isVisabile2 = false;
  bool isVisabile3 = false;
  bool isVisabile4 = false;

  var val;

  bool adayago = false;
  bool towdayago = false;
  bool sameday = false;

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
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            child: isVisabile == false
                ? Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                : Icon(
                    Icons.arrow_drop_up,
                    size: 35,
                  ),
            onTap: () {
              setState(() {
                isVisabile = !isVisabile;
              });
              //
            },
          ),
        ),
        Visibility(
          visible: isVisabile,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isVisabile2 = !isVisabile2;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Repeated Transaction'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //////////////////////////////////////
                //Visibility_Widget_RepetedTranaction
                /////////////////////////////////////

                Visibility(
                  visible: isVisabile2,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            Text(
                              'Repeated :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                          Text(
                            'daily',
                            style: new TextStyle(fontSize: 12.0),
                          ),
                          Radio(
                            value: 2,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                          Text(
                            'weekly',
                            style: new TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Radio(
                            value: 3,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                          Text(
                            'Monthly',
                            style: new TextStyle(fontSize: 12.0),
                          ),
                          Radio(
                            value: 4,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                          Text(
                            'yearly',
                            style: new TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            Text(
                              'Transaction alert :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: adayago,
                            onChanged: (value) {
                              setState(() {
                                adayago = !adayago;
                              });
                            },
                          ),
                          Text('Before one day'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: towdayago,
                            onChanged: (value) {
                              setState(() {
                                towdayago = !towdayago;
                              });
                            },
                          ),
                          Text('Before Two days'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: sameday,
                            onChanged: (value) {
                              setState(() {
                                sameday = !sameday;
                              });
                            },
                          ),
                          Text('At the same time'),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isVisabile3 = !isVisabile3;
                    });
                  },
                  child: Widget_Container_Image(),
                ),
                //////////////////////////////////////
                //Visibility_Widget_Image
                /////////////////////////////////////
                Visibility(
                    visible: isVisabile3,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 175,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: loadAssets,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_a_photo_rounded),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Upload Image",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
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
                    )),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isVisabile4 = !isVisabile4;
                    });
                  },
                  child: Widget_container_descreption(),
                ),
                //////////////////////////////////////
                //Visibility_Widget_description
                /////////////////////////////////////
                Visibility(
                  visible: isVisabile4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
                    child: Container(
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your note',
                        ),
                        controller: descreptionController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
