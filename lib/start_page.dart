
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_fun/adsManager.dart';
import 'package:learn_with_fun/helper/ad_unit_id_helper.dart';
import 'package:learn_with_fun/helper/interstitial_ad_helper.dart';

import 'animals.dart';
import 'colors.dart';
import 'main.dart';
import 'numbers.dart';





 void main() {
  runApp( MyApp());
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   bool isLoaded = false;
   bool isAudioRunning = true;

   final audioPlayer = AudioPlayer();

  runAudio()async{
    final player = AudioCache();

    final url = await player.load("audio/startgame.mp3");

    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.play(UrlSource(url.path));
    isAudioRunning = true;
  }

  stopAudio(){
    audioPlayer.pause();
    isAudioRunning = false;
  }

  resumeAudio(){
    audioPlayer.resume();
    isAudioRunning = true;
  }


  @override
  void initState() {
    super.initState();
    loadAd();
    InterstitialAdHelper.loadInterstitialAd();
    runAudio();
  }

  BannerAd initBannerAd() {
    return BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdUnitIdHelper.bannerId,

        listener: BannerAdListener(
        onAdLoaded: (ad) {
         setState(() {
           isLoaded = true;
           print('*****load******');
         });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          print('***trend****');
        },
      ),
      request: const AdRequest(),

    );
  }

  Future<void> loadAd() async {
    bannerAd = initBannerAd();
    await bannerAd.load();


  }



  @override
  Widget build(BuildContext context) {
    return
      safeArea(context: context,
        add:isLoaded == true

            ? Align(
          alignment: Alignment.bottomCenter,
            child:  SizedBox(
            width: bannerAd.size.width.toDouble(),
            height: bannerAd.size.height.toDouble(),
            child: AdWidget(ad: bannerAd),

          ),
        )

            : SizedBox(),



        scaffold:
      Scaffold(

      // backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,

        children: [
          Image.asset('assets/images/learnwithfun.jpg',

            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
            // height: MediaQuery.of(context).size.height,
            // width:  MediaQuery.of(context).size.width,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              // IconButton(onPressed: (){
              //   Navigator.pop(context);
              // }, icon: const Icon(Icons.volume_off_rounded,color: Colors.amberAccent,size: 35,)),
              // TextFormField(
              // IconButton(
              //   onPressed: () {
              //     setState(() {
              //       isVolume = !isVolume;
              //       print(isVolume);
              //     });
              //   },
              //
              // icon: isVolume
              //   ? const Icon(Icons.volume_up,color: Colors.amberAccent,size: 35)
              //     : const Icon(Icons.volume_off,color: Colors.amberAccent,size: 35 ,)),
              const SizedBox(height:50),
              // const Text(
              //   'Sokhna Fishing',
              //   style: TextStyle(
              //     fontSize: 40,
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),


//               const SizedBox(height:350),
// // child:(
//          ElevatedButton(
//              onPressed: () {
//             AudioPlayer player = AudioPlayer();
//             Source path = AssetSource('start.mp3');
//             Player.play(path);
//           },
           const SizedBox(height:350),
              ElevatedButton(

                  onPressed: () {
                    InterstitialAdHelper.showInterstitialAd();
                    stopAudio();
                    // Navigate to the next screen
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const Numbers ()));
                  },
                  child:
                  const Text('Play With Numbers',

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 30,
                      fontWeight:FontWeight.bold,
                      letterSpacing: 2,
                    ),

                  )

              ),


              const SizedBox(height:10),

              ElevatedButton(

                onPressed: () {
                  InterstitialAdHelper.showInterstitialAd();
                  stopAudio();
                  // Navigate to the next screen
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const HomeScreen ()));
                },
                  child:
                  const Text('Play With Animals',

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 30,
                      fontWeight:FontWeight.bold,
                      letterSpacing: 2,
                    ),

                  )

              ),

              const SizedBox(height:10),


              ElevatedButton(

                  onPressed: () {
                    InterstitialAdHelper.showInterstitialAd();
                    stopAudio();
                    // Navigate to the next screen
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const ColorsPage ()));
                  },
                  child:
                  const Text('Play With Colors',

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 30,
                      fontWeight:FontWeight.bold,
                      letterSpacing: 2,
                    ),

                  )

              ),

              const SizedBox(height:10),


              ElevatedButton(

                  onPressed: () {
                    // // Navigate to the next screen
                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (context) => const ColorsPage ()));

                    setState(() {
                      showAlertDialog(context);
                    });


                  },
                  child:
                  const Text('Quite Game',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 30,
                      fontWeight:FontWeight.bold,
                      letterSpacing: 2,
                    ),

                  )

              )


            ],

          ),
          Positioned(
            top: 8,
              right: 8,
              child: IconButton(
              onPressed: (){
                setState(() {
                  isAudioRunning == true ?
                  stopAudio() :
                  resumeAudio() ;
                });
              }, icon: isAudioRunning == true ?
                  Icon(Icons.music_note_sharp,color: Colors.orange,) :
              Icon(Icons.music_off_sharp,color: Colors.yellowAccent,)))
        ],
      ),
      )
    );

  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.pop(context);

      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed:  () {
        exit(0);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      content: Text("Do you want to close the game?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}



