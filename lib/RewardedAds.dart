//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:learn_with_fun/Interstitial_Ad.dart';
//
// import 'package:provider/provider.dart';
//
// class RewardedAds extends StatelessWidget{
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     adunit  AdUnitIdRes = Provider. of <AdUnitIdRes>(context,listen: false);
//
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer<AdUnitIdRes>(builder: context,date,child:){
//             return Text('Rewarded Point is');
//             },),
//             ElevatedButton(onPressed: (){adunit.loadRewardedAd();}, child: Text('Load Rewarded Ads')),
//             ElevatedButton(onPressed: (){adunit.showRewardAd();}, child: Text('Show Rewarded Ads')),
//           ],
//         ),
//       ),
//     );
//
//   }
//
// }