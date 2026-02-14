// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:learn_with_fun/MainController.dart';
// import 'package:learn_with_fun/MainView.dart';
// import 'package:learn_with_fun/MainView.dart';
// import 'package:learn_with_fun/MainView.dart';
// import 'package:learn_with_fun/MainView.dart';
// import 'package:learn_with_fun/MainView.dart';
// import 'package:learn_with_fun/MainView.dart';
// import 'package:learn_with_fun/ad_unit.dart';
// import 'package:learn_with_fun/main.dart';
//
//
// class MainView extends GetView<MainController> {
//   const MainView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(MainController());
//     return safeArea(
//
//         context: context,
//         add: GetX<MainController>(
//             builder: ((controller) => controller.isloaded.value == true
//                 ? Align(
//               alignment: Alignment.topCenter,
//               child: SizedBox(
//                 width: controller.bannerAd.size.width.toDouble(),
//                 height: controller.bannerAd.size.height.toDouble(),
//                 child: AdWidget(ad: controller.bannerAd),
//               ),
//             )
//                 : const SizedBox())),
//         scaffold: Scaffold(
//           backgroundColor: Colors.white,
//           body: Stack(
//             children: [
//               loading(controller),
//               pdfViewr(
//                   context: context,
//                   controller: controller),
//               topSettings(),
//               bottomSettings(),
//             ],
//           ),
//         ));
//   }
// }
//
//
//   late BannerAd bannerAd;
//
//   RxBool isloaded = RxBool(false);
//
//
// BannerAd? initBannerAd(){
//   return BannerAd(
//       size: AdSize.fullBanner,
//       adUnitId: AdUnitIdRes.bannerAdUnitId,
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           isloaded.value = true;
//         },
//         onAdFailedToLoad: (ad, err) {
//           isloaded.value = false;
//           ad.dispose();
//         },
//       ),
//       request: const AdRequest());
// }
//
// loadAd()async{
//   bannerAd = initBannerAd();
//   await bannerAd.load();
// }



// *************************************


import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// class MainView extends GetView<MainController> {
//   const MainView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(MainController());
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//
//             Obx(
//                   () => controller.isLoaded.value == true
//                   ? Align(
//                 alignment: Alignment.topCenter,
//                 child: SizedBox(
//                   width: controller.bannerAd.size.width.toDouble(),
//                   height: controller.bannerAd.size.height.toDouble(),
//                   child: AdWidget(ad: controller.bannerAd),
//                 ),
//               )
//                   : SizedBox(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MainController extends GetxController {
//   late BannerAd bannerAd;
//   RxBool isLoaded = false.obs;
//
//   get AdUnitId => null;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadAd();
//   }
//
//   BannerAd initBannerAd() {
//     return BannerAd(
//       size: AdSize.fullBanner,
//       adUnitId: AdUnitId,
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           isLoaded.value = true;
//         },
//         onAdFailedToLoad: (ad, err) {
//           isLoaded.value = false;
//           ad.dispose();
//         },
//       ),
//       request: const AdRequest(),
//     );
//   }
//
//   Future<void> loadAd() async {
//     bannerAd = initBannerAd();
//     await bannerAd.load();
//   }
// }


/////////////////////////////////////




//
//
//
// MainController(){
//   _loadRewardedAd();
// }
//
// RewardedAd? _rewardedAd;
// // بنتحقق اذا الاعلان اتحمل عشان نقدر نعرضه ولا لا
// bool _isRewardedLoaded = false;
//
// // تحميل الاعلان
// _loadRewardedAd(){
//   // TODO: replace this test ad unit with your own ad unit.
//   final adUnitId = Platform.isAndroid
//       ? 'ca-app-pub-3940256099942544/5224354917'
//       : 'ca-app-pub-3940256099942544/1712485313';
//   RewardedAd.load(
//       adUnitId: adUnitId,
//       request: const AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         // Called when an ad is successfully received.
//         onAdLoaded: (ad) {
//           _rewardedAd = ad;
//           _isRewardedLoaded = true;
//         },
//         // Called when an ad request failed.
//         onAdFailedToLoad: (LoadAdError error) {
//           print("Failed to load ${error.message}");
//         },
//       ));
// }
//
//
// _showRewardedAd() {
//   Get.defaultDialog(
//     title: "",
//     middleText: "showAdMessage".tr,
//     textConfirm: "watch ad".tr,
//     textCancel: "cancel".tr,
//     onConfirm: () {
//       Get.back();
//       // اذا الاعلان اتحمل هينفذ الكود دا
//       if (_isRewardedLoaded == true) {
//         _rewardedAd!.show(
//           // الكود الى جوه بيتنفذ لما المستخدم يشوف الاعلان بالكامل
//             onUserEarnedReward: (ad, rewardItem) {
//               _goTo();
//             });
//         _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//           // لما المستخدم يقفل الاعلان سواء شاف الاعلان كله او لا
//           onAdDismissedFullScreenContent: (ad) {
//             ad.dispose();
//             _isRewardedLoaded = false;
//           },
//           onAdFailedToShowFullScreenContent: (ad, error) {
//             ad.dispose();
//             _isRewardedLoaded = false;
//             _goTo();
//           },
//         );
//       } else if (_connectivityResult == ConnectivityResult.none) {
//         Get.snackbar("", "",
//             titleText: Center(
//               child: Text("check internet".tr),
//             ),
//             padding: const EdgeInsets.all(0));
//       } else if (_isRewardedLoaded == false) {
//         _loadRewardedAd();
//         if (_isRewardedLoaded == true) {
//           _rewardedAd!.show(
//             // الكود الى جوه بيتنفذ لما المستخدم يشوف الاعلان بالكامل
//               onUserEarnedReward: (ad, rewardItem) {
//                 _goTo();
//               });
//           _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//             // لما المستخدم يقفل الاعلان سواء شاف الاعلان كله او لا
//             onAdDismissedFullScreenContent: (ad) {
//               ad.dispose();
//               _isRewardedLoaded = false;
//             },
//             onAdFailedToShowFullScreenContent: (ad, error) {
//               ad.dispose();
//               _isRewardedLoaded = false;
//               _goTo();
//             },
//           );
//         } else {
//           _goTo();
//         }
//       } else if (_connectivityResult != ConnectivityResult.none) {
//         _goTo();
//       }
//     },
//   );
// }
// ////////////////////////////////////////////////////////////////////////////////////
// (😎 إعلان بينى interstitial
//
// 1- اعداد الاعلان البينى فى ال adMob
//
// -- 1- بنختار الوحده الاعلانيه "اعلان بينى" وبعدين نديلها اسم
// -- 2- بنروح على الاعدادات المتقدمه ونفعل تحديد عدد مرات الظهور
// -- 3- بنحدد اقصى عدد لمرات ظهور الاعلان خلال فتره محدده من الزمن وبمجرد ما يعدى الفتره الزمنيه المحدده هيبدا يحسب من اول وجديد عدد الاعلانات خلال فتره زمنيه الى محددينها
// -- 4- الى عملناه دا على مستوى الوحده الاعلانيه مش على مستوى التطبيق
//
// 2- فى صفحة ال controller
//
// // الاعلان بيتم تحميله مره واحده لما الصفحه بتتفتح والكونستراكتور بيستعديه
// // لو عاوزين الاعلان يظهر مثلا كل مره نعمل حاجه معينه يبقى بالاضافه لاستدعاء تحميل الاعلان فى الكونستراكتور بنستدعى الداله دى فى الكود تانى عشان تحمل اعلان جديد ونقدر نعرضه تانى
// // الكونستراكتور
// PdfController(){
// loadInterstitialAd();
// }
//
// late InterstitialAd interstitialAd;
// bool isInterstitialAdIsReady = false;
//
// // دالة تحميل الاعلان
// void loadInterstitialAd() {
// InterstitialAd.load(
// adUnitId: AdUnitIdModel.interistitialAdUnitId,
// request: const AdRequest(),
// adLoadCallback: InterstitialAdLoadCallback(
// // Called when an ad is successfully received.
// onAdLoaded: (ad) {
// debugPrint('$ad loaded.');
// // Keep a reference to the ad so you can show it later.
// interstitialAd = ad;
// isInterstitialAdIsReady = true;
// },
// // Called when an ad request failed.
// onAdFailedToLoad: (LoadAdError error) {
// debugPrint('InterstitialAd failed to load: $error');
// isInterstitialAdIsReady = false;
// },
// ));
// }
//
// // دالة عرض الاعلان
// // بنستخدمها جوه الكود مش فى صفحة view والاعلان بيظهر عادى كل الى علينا ان وقت ما نكون عاوزين
// نعرض الاعلان نستدعى الداله دى
// // الاعلان دا مش بيحتاج يتعرض جوه widget
// void showInterstitialAd(){
// if(isInterstitialAdIsReady){
// interstitialAd.show();
// }
// }
//
