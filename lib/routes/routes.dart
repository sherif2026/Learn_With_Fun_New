
import 'package:flutter/material.dart';
import 'package:learn_with_fun/routes/route.dart';

// import '../audio.dart';
import '../start_page.dart';

Route<dynamic>? onGenerate(RouteSettings routeSettings){

  switch(routeSettings.name){
    case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (_)=> const SplashScreen());



  }

}