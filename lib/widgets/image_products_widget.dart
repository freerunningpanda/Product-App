import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageProduts20Widget extends StatelessWidget {
  final String urlImage;
  final double height;
  final double width;

  const ImageProduts20Widget(
      {Key? key, required this.urlImage, this.height = 50, this.width = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset('assets/no_image.jpg'),
        imageUrl: urlImage,
        height: height,
        width: width,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }
}
