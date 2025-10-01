import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/widgets/CustomButton.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(child: CustomButton(
            text: 'Free',
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(16) ,
                bottomLeft: Radius.circular(16)),
          )),
          Expanded(child: CustomButton(
            text: 'Free preview',
            textColor: Colors.white,
            backgroundColor: Color(0xFFEF8262),
            borderRadius: BorderRadius.only(
                topRight:Radius.circular(16) ,
                bottomRight: Radius.circular(16)),
          )),
        ],
      ),
    );
  }
}

