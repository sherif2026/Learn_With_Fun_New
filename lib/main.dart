import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:learn_with_fun/start_page.dart';
import 'package:learn_with_fun/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  UnityAds.init(
    gameId: '6046303',       // Game ID
    testMode: false,          // false قبل الرفع
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const GameScreen(),
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          onGenerateRoute: onGenerate,
        );
      },
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int stage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stage $stage'),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: _nextStage,
                child: Text('Finish Stage'),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: UnityBannerAd(
              placementId: 'Banner_Android',
              listener: (state, args) {
                print('Banner Ad State: $state, args: $args');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showRewarded,
        child: const Icon(Icons.card_giftcard),
        tooltip: 'Watch Ad for Reward',
        backgroundColor: Colors.grey.shade800,
      ),
    );
  }

  void _nextStage() {
    setState(() {
      stage++;
    });

    UnityAds.showVideoAd(
      placementId: 'Interstitial_Android',
      onComplete: (placementId) {
        print('Interstitial Completed');
      },
    );
  }

  void _showRewarded() {
    UnityAds.showVideoAd(
      placementId: 'Rewarded_Android',
      onComplete: (placementId) {
        print('Reward Granted!');
        // ضع هنا المكافأة للاعب
      },
    );
  }
}
