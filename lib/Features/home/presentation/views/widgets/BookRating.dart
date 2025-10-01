
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/appText.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,  this.mainAxisAlignment=MainAxisAlignment.start, required this.bookRating, required this.count,});
final MainAxisAlignment mainAxisAlignment;
final String bookRating;
 final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment:mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xFFFFDD4F),
          size: 13.4,
        ),
        SizedBox(width: 6,),
        AppText(text: '4.5', fontSize: 16, fontFamily: 'poppins', fontWeight: FontWeight.w400),
        SizedBox(width: 7,),
        AppText(text: '($count)', fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.5),)
      ],
    );
  }
}