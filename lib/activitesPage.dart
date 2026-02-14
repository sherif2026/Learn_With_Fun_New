//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//


// class ActivitesPage extends StatefulWidget{
//   _ActivitesPageState createState()=> _ActivitesPageState();
// }
// class _ActivitesPageState extends State<ActivitesPage>{
//   @override
//   final _natveAdController = NativeAdmobController();
//   AdmobBannerSize bannerSize;
//   AdmobInterstitial interstitialAd;
//
// }

//
//   void initState(){
//     super.initState();
//
//     interstitialAd = AdmobInterstitial(
//       adUnitId: AdsManager.interstitialAdUnitId,
//       listener: (AdmobAdEvent event,Map<String,dynamic>args){
//       if (event==AdmobAdEvent.closed) interstitial.load();
//   },
//     );
//
//     interstitialAd.load();
//     _natveAdController.reloadAd(forceRefresh: true);
//   }
//
//   void dispose(){
//     interstitialAd.dispose();
//     _natveAdController.dispose();
//     super.dispose();
//
// }
//
//   Widget build(BuildContext context){
//   return Scaffold(
//     body: Stack(
//       children: [
//         Column(
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//             ),
//             Container(
//            color: Colors.white ,
//               height: MediaQuery.of(context).size.width/3,
//               padding: EdgeInsets.all(10),
//               margin: EdgeInsets.only(bottom: 20.0),
//               child: NativeAdmob(
//                 adUnitID: AdsManager.nativeAdUnitId,
//                 numberAds: 3,
//                 controller: _natveAdController,
//                 type: NativeAdmobType.full,
//               ),
//             ),
//             Spacer(),
//             AdmobBanner(
//               adUnitId: AdsManager.bannerAdUnitId,
//               adSize: AdmobBannerSize.SMART_BANNER(context),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
//   }
//



// **************************************
//
//
//
// GetBuilder<MainController>(
// builder: ((controller) =>
// controller.isloaded == true ? Align(
// alignment: Alignment.topCenter,
// child: SizedBox(
// width: controller.bannerAd.size.width.toDouble(),
// height: controller.bannerAd.size.height.toDouble(),
// child: AdWidget(ad: controller.bannerAd),
// ),
// ) : const SizedBox()
// )
// ),
//
