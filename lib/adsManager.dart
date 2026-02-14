//
//
//  import 'dart:developer';
// import 'dart:html';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
//
// class AdsManager{
//   static const bool _testMode =true;
//
//   static String get appId{
//     if (Platform.isAndroid) {
//       return'  ca-app-pub-8360681812726614~2388252041  ';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }
//
//   static String get bannerAdUnitId {
//     if (_testMode == true) {
//       return AdmobBanner.testAdUnitId;
//     } else if (Platform.isAndroid) {
//       return '   ca-app-pub-8360681812726614/7908172033  ';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }
//
//   static String get interstitialAdUnitId{
//     if (_testMode==true) {
//       return AdmobInterstitial.testAdUnitId;
//     } else if (Platform.isAndroid) {
//       return ' ca-app-pub-8360681812726614/5090437004  ';
//     } else{
//       throw new UnsupportedError('Unsupported platform');
//     }
//
//   }
//
//
//   static String get nativeAdUnitId{
//     if (_testMode==true) {
//       return AdmobNative.testAdUnitId;
//     } else if (Platform.isAndroid) {
//    return '   ca-app-pub-8360681812726614/6116314885   ';
//   } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//     }
//
//  static String get rewardedAdUnitId{
//
//  }
//
//
//   static String get appOpenAdUnitId{
//
//   }
//
//
// }



// **********************************************






import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

MainController(){
  loadAd();
}
void update() {
}


late BannerAd bannerAd;
bool isloaded = false;

BannerAd initBannerAd(){


  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-9170499794415427/8567473891'
      : 'ca-app-pub-9170499794415427/8567473891';
  return BannerAd(
      size: AdSize.fullBanner,
      adUnitId: adUnitId,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          update();
        },

        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');

          ad.dispose();
        },
      ),
      request: const AdRequest());
}



loadAd()async{
  bannerAd = initBannerAd();
  await bannerAd.load();
  update();
}











