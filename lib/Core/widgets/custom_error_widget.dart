
import 'package:flutter/cupertino.dart';
import 'package:run_way/Core/utils/appText.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.errorMessage, {super.key});

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: AppText(text: errorMessage, fontSize: 16, fontFamily: 'poppins', fontWeight: FontWeight.w500));
  }
}
