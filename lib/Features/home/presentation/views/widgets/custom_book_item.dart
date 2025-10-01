import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: AspectRatio(
        aspectRatio: 2.6/4,
        child:
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      imageUrl
                  ))
          ),
        ),
      ),
    );
  }
}


