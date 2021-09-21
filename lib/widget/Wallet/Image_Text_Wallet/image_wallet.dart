import 'package:flutter/material.dart';

class Image_Wallet extends StatelessWidget {
  const Image_Wallet({
    Key? key,
    required this.image,
    required this.scale,
  }) : super(key: key);

  final String image;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        image: DecorationImage(
          scale: scale,
          image: AssetImage(image),
        ),
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
    );
  }
}
