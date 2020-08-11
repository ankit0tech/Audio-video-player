import 'package:flutter/material.dart';
import 'audio/offline_audio.dart';
import 'video/offline_video.dart';
import 'video/online_video.dart';
import 'audio/online_audio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return myapp();
  }
}

myapp() {
  return new MaterialApp(
    home: new FirstPage(),
  );
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Multi Page Application"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: new RaisedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new AudioPage()),
                    ),
                  },
                  child: Text(
                    'Play Audio Offline',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: new RaisedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new OnlineAudioPage()),
                    ),
                  },
                  child: Text(
                    'Play Audio Online',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: new RaisedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new VideoPage()),
                    ),
                  },
                  child: Text(
                    'Play Video Offline',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: new RaisedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new OnlineVideoPage()),
                    ),
                  },
                  child: Text(
                    'Play Video Online',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
