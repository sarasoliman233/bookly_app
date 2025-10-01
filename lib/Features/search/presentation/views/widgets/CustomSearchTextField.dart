import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:run_way/Features/home/presentation/manager/search_cubit/search_cubit.dart';

import '../../../../../Core/utils/appText.dart';

class CustomSearchTextField extends StatelessWidget {
   CustomSearchTextField({super.key});
final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value){
        if(value.isNotEmpty){
          BlocProvider.of<SearchCubit>(context).searchBooks(value);
        }
      },
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hint: AppText(
              text: 'Search', fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.w400),
          suffixIcon: IconButton
            (onPressed: (){
          },
              icon: Opacity(
                opacity: 0.7,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,size: 17,
                ),
              ))
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(

        borderSide: BorderSide(color: Colors.white.withOpacity(0.19)),
        borderRadius: BorderRadius.circular(16)
    );
  }
}
