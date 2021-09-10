import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class DetailScreen extends StatelessWidget {
  List<Asset> images = [];

  DetailScreen(this.images);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            children: List.generate(images.length, (index) {
              Asset asset = images[index];
              return AssetThumb(
                asset: asset,
                width: 1000,
                height: 1400,
              );
            })));
  }
}