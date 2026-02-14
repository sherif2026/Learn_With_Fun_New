import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learn_with_fun/ad_unit.dart';
class AdUnitIdRes {
  int rewardedPoint = 0;
  int getreward() => rewardedPoint;


  static final bannerAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-9170499794415427/8567473891'
      : 'ca-app-pub-9170499794415427/8567473891';


  static final InterstitialAdalAd = Platform.isAndroid
      ? 'ca-app-pub-9170499794415427/1195216499'
      : 'ca-app-pub-9170499794415427/1195216499';


  late InterstitialAd _interstitialAd;
  late RewardedAd _rewardedAd;
  int num_of_attempt_load = 0;

  static initialization() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  void loadRewardedAd() {
    RewardedAd.load(
        adUnitId: '              ',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad) {
              print('Ad loaded');
              this._rewardedAd = ad;
            },
            onAdFailedToLoad: (LoadAdError error) {

            })
    );
  }

  void showRewardAd() {
    // _rewardedAd.show(
    //     onUserEarnedReward: (RewardedAd ad, RewardItem rpoint) {
    //       print('Reward Earned is ${rpoint.amount}');
    //       rewardedPoint = rewardedPoint + rpoint.amount;
    //       notifyListeners();
    //     }
    // );

    _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {

      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        ad.dispose();
      },
      onAdImpression: (RewardedAd ad) => print('$ad impression occurred'),

    );
  }
}
