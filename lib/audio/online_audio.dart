import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class OnlineAudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();
    AudioCache playback = AudioCache(fixedPlayer: player);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Play Onlie Audio"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: Image(image: AssetImage('assets/music.jpg')),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.orangeAccent[100],
                          child: IconButton(
                              icon: Icon(Icons.play_circle_filled),
                              onPressed: null),
                          onPressed: () {
                            print("Playing !!!");
                            player.play(
                                "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
                          },
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.orangeAccent[100],
                          child: IconButton(
                              icon: Icon(Icons.adjust), onPressed: null),
                          onPressed: () {
                            print("Resuming !!!");
                            player.resume();
                          },
                          elevation: 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.orangeAccent[100],
                          child: IconButton(
                              icon: Icon(Icons.pause_circle_filled),
                              onPressed: null),
                          onPressed: () {
                            print("Pause !!!");
                            player.pause();
                          },
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.orangeAccent[100],
                          child: IconButton(
                              icon: Icon(Icons.stop), onPressed: null),
                          onPressed: () {
                            print("Stoped !!!");
                            player.stop();
                          },
                          elevation: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
