import 'package:flutter/material.dart';
import 'package:learn_with_fun/adsManager.dart';

Widget safeArea({required BuildContext context,required Widget add,required Widget scaffold}){
  return SafeArea(
      child: SizedBox(
        height:  MediaQuery.of(context).size.height,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Expanded(
                child:scaffold
            ),
            add,

         ],
        ),
      )
  );
}
