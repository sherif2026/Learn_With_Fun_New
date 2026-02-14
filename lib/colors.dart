// import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_fun/helper/interstitial_ad_helper.dart';
import 'package:learn_with_fun/start_page.dart';
import 'package:sizer/sizer.dart';

import 'item_model.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({key});

  @override
  _ColorsPageState createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {

  void initState() {
    initGame();
    loadAudioExcellent();
    loadAudioNormal();
    loadAudioFalse();
    super.initState();
  }
  final audioPlayerExcellent = AudioPlayer();
  final audioPlayerNormal = AudioPlayer();
  final audioPlayerFalse = AudioPlayer();



  late List<ItemModel> items;
  late List<ItemModel> items2;
  late int score;
  late bool gameOver;
  late String audioPathExcellent;
  late String audioPathNormal;
  late String audioPathFalse;
  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(value: 'black', name: 'black', img: 'assets/images/black.png'),
      ItemModel(value: 'blue', name: 'blue', img: 'assets/images/blue.png'),
      ItemModel(value: 'brown', name: 'brown', img: 'assets/images/brown.png'),
      ItemModel(value: 'green', name: 'green', img: 'assets/images/green.png'),
      ItemModel(value: 'orange', name: 'orange', img: 'assets/images/orange.png'),
      ItemModel(value: 'pink', name: 'pink', img: 'assets/images/pink.png'),
      ItemModel(value: 'purple', name: 'purple', img: 'assets/images/purple.png'),
      ItemModel(value: 'red', name: 'red', img: 'assets/images/red.png'),
      ItemModel(value: 'white', name: 'white', img: 'assets/images/white.png'),
      ItemModel(value: 'yellow', name: 'yellow', img: 'assets/images/yellow.png'),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  loadAudioExcellent()async{
    final player = AudioCache();

    final url = await player.load("audio/endlevel.mp3");

    // audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPathExcellent = url.path;
  }

  loadAudioNormal()async{
    final player = AudioCache();

    final url = await player.load("audio/done.mp3");

    // audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPathNormal = url.path;
  }

  loadAudioFalse()async{
    final player = AudioCache();

    final url = await player.load("audio/falselevel.mp3");

    // audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPathFalse = url.path;
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameOver = true;
    if (score > 75 && gameOver) {
      try {
        audioPlayerExcellent.play(UrlSource(audioPathExcellent));
      } catch (ex) {
        print(ex);
      }
    } else if(score <= 75 && gameOver) {
      try {
          audioPlayerFalse.play(UrlSource(audioPathFalse));
        } catch(ex) {
        print("=============== $ex ===============");
      }
    }else{
      try{
        audioPlayerNormal.play(UrlSource(audioPathNormal));
      }catch(ex){
        print(ex);
      }
    }

    // @override
  // void initState() {
  //   super.initState();
  //   initGame();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   if (items.length == 0) gameOver = true;
    return Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.topLeft,
        colors: [
        Colors.green,
        Colors.orangeAccent,
        ],
    ),
    ),

    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
    child: Scrollbar(
    thickness: 10,
    thumbVisibility: true,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder:(context,index)=>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 0,top: 0),
                  child: Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                          text: 'Score : ',
                          style: TextStyle(fontSize: 30,
                              fontWeight:FontWeight.bold)

                        // style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextSpan(
                          text: score.toString(),
                          style: const TextStyle(fontSize: 30,
                              color: Colors.yellow,
                              fontWeight:FontWeight.bold)
                        // style: Theme.of(context).textTheme.headlineMedium?.copyWith(color:Colors.teal),
                      ),
                    ]),
                  ),
                ),
              ),
              if (!gameOver)
                Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: items.map((item) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: Container(
                              height: 65,
                              width: 60,
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,

                                image: DecorationImage(
                                    image: AssetImage(item.img),
                                    fit: BoxFit.fill
                                ),
                              ),
                            ),
                            feedback: Container(
                              height: 65,
                              width: 60,
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,

                                image: DecorationImage(
                                    image: AssetImage(item.img),
                                    fit: BoxFit.fill
                                ),
                              ),
                            ),
                            child: Container(
                              height: 65,
                              width: 60,
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,

                                image: DecorationImage(
                                    image: AssetImage(item.img),
                                    fit: BoxFit.fill
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),

                    ),
                    const Spacer(flex: 2),
                    Column(
                      children: items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem) {
                            if (item.value == receivedItem.value) {
                              setState(() {
                                items.remove(receivedItem);
                                items2.remove(item);
                              });
                              score += 10;
                              item.accepting = true;
                              // player.play('true.wav');
                              //  Image.asset('assets/images/happy.jpg');
                            } else {
                              setState(() {
                                score -= 5;
                                item.accepting = false;
                                // player.play('false.wav');
                              });
                            }
                          },
                          onWillAccept: (receivedItem) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          onLeave: (receivedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          builder: (context, acceptedItems, rejectedItems) =>
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: item.accepting
                                        ? Colors.grey[400]
                                        : Colors.grey[200],
                                  ),
                                  alignment: Alignment.center,
                                  height:
                                  MediaQuery.of(context).size.width / 6.5,
                                  width: MediaQuery.of(context).size.width / 3,
                                  margin: const EdgeInsets.all(8),
                                  child: Text(
                                    item.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )),
                        );
                      }).toList(),
                    ),
                    const Spacer(),
                  ],
                ),
              if (gameOver && 75<score)
                Center(
                  child:
                  Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70,right: 70,top: 70,bottom: 20),
                        child: Text(
                          'Excellent',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium

                              ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),

                        ),
                      ),
                      Image.asset('assets/images/happy.png',width: 200,height: 200,),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),

                          child: TextButton(
                            style: TextButton.styleFrom(minimumSize: Size.fromWidth(15.h)),
                            onPressed: () {
                              InterstitialAdHelper.showInterstitialAd();
                              setState(() {
                                initGame();
                              });
                            },

                            child:  const  Icon(Icons.replay,color: Colors.teal,),
                          ),


                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),

                          child: TextButton(
                            style: TextButton.styleFrom(minimumSize: Size.fromWidth(15.h)),
                            onPressed: () {
                              InterstitialAdHelper.showInterstitialAd();
                              // setState(() {
                              //   initGame();
                              // });
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const SplashScreen ()));
                            },

                            child:  const Icon(Icons.home,color: Colors.teal,),
                          ),


                        ),
                      )
                    ],
                  ),
                ),
              if (gameOver && 75>=score)
                Center(
                  child:
                  Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100,right: 100,top: 100,bottom: 20),
                        child: Text(
                          'Try Again',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium

                              ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),

                        ),
                      ),
                      Image.asset('assets/images/sad.png',width: 200,height: 200,),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),

                          child: TextButton(
                            style: TextButton.styleFrom(minimumSize: Size.fromWidth(15.h)),
                            onPressed: () {
                              setState(() {
                                initGame();
                              });
                            },

                            child:  const  Icon(Icons.replay,color: Colors.teal,),
                          ),


                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),

                          child: TextButton(
                            style: TextButton.styleFrom(minimumSize: Size.fromWidth(15.h)),
                            onPressed: () {
                              // setState(() {
                              //   initGame();
                              // });
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const SplashScreen ()));
                            },
                            child:  const Icon(Icons.home,color: Colors.teal,),
                          ),


                        ),
                      )
                    ],
                  ),
                ),
              // const SizedBox(
              //   height:150,
              // ),




            ],
          ),

      ),

    ),
      ),
    )

    );

  }

  String result() {
    if (score == 100) {
      // player.play('Success.wav');
      return 'Awesome!';
    } else {
      // player.play('tryAgain.wav');
      return 'Play again to get better score';
    }
  }

}
