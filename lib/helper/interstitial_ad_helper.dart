
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learn_with_fun/helper/ad_unit_id_helper.dart';

class InterstitialAdHelper{

  static late InterstitialAd interstitialAd;
  static bool isInterstitialAdIsReady = false;


   static void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdUnitIdHelper.interstitialId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(

          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');

            interstitialAd = ad;
            isInterstitialAdIsReady = true;
          },

          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
            isInterstitialAdIsReady = false;
          },
        ));
  }


  static void showInterstitialAd(){
    if(isInterstitialAdIsReady){
      interstitialAd.show();
      isInterstitialAdIsReady = false;
      loadInterstitialAd();
    }
  }
}