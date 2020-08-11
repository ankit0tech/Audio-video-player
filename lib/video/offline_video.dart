import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  Timer timer;
  double _currentvolume = 1.0;
  double videoprogress = 0.0;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset('assets/StressedOut.mp4');
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  void startTimer() {
    // Start the periodic timer which prints something every 1 seconds
    timer = new Timer.periodic(
      new Duration(seconds: 1),
      (Timer time) => setState(
        () {
          // print(videoprogress);

          if (_controller.value.position.inSeconds >=
              _controller.value.duration.inSeconds) {
            time.cancel();
            print('playback is complete');
            videoprogress = 0.0;
          } else {
            videoprogress = _controller.value.position.inSeconds /
                _controller.value.duration.inSeconds;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twenty One Pilots Song'),
        backgroundColor: Colors.orangeAccent,
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return Container(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                // padding:
                                //     const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                color: Colors.orangeAccent[100],
                                child: IconButton(
                                    icon: Icon(Icons.play_circle_filled),
                                    onPressed: null),
                                onPressed: () {
                                  print("Video Playing !!!");
                                  _controller.setLooping(false);
                                  _controller.play();
                                  setState(() {
                                    videoprogress = 0;
                                  });
                                  startTimer();
                                },
                                elevation: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                // padding:
                                //     const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                color: Colors.orangeAccent[100],
                                child: IconButton(
                                    icon: Icon(Icons.pause_circle_filled),
                                    onPressed: null),
                                onPressed: () {
                                  print("Video paused !!!");
                                  _controller.pause();
                                },
                                elevation: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                // padding:
                                //     const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                color: Colors.orangeAccent[100],
                                child: IconButton(
                                    icon: Icon(Icons.stop), onPressed: null),
                                onPressed: () {
                                  print("Video Stopped !!!");
                                  _controller.seekTo(Duration(seconds: 0));
                                  _controller.pause();
                                },
                                elevation: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                // padding:
                                //     const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                color: Colors.orangeAccent[100],
                                child: IconButton(
                                    icon: Icon(Icons.volume_mute),
                                    onPressed: null),
                                onPressed: () {
                                  print("Video Muted !!!");
                                  _controller.setVolume(0.0);
                                },
                                elevation: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                // padding:
                                //     const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                color: Colors.orangeAccent[100],
                                child: IconButton(
                                    icon: Icon(Icons.audiotrack),
                                    onPressed: null),
                                onPressed: () {
                                  print("Video unmuted !!!");
                                  _controller.setVolume(1.0);
                                },
                                elevation: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: LinearProgressIndicator(
                      minHeight: 7,
                      value: videoprogress,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Video progress',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Slider(
                      value: _currentvolume,
                      min: 0.0,
                      max: 1.0,
                      activeColor: Colors.amber,
                      inactiveColor: Colors.amber,
                      onChanged: (double value) {
                        setState(() {
                          _currentvolume = value;
                          _controller.setVolume(_currentvolume);
                        });
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      'Volume control',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
