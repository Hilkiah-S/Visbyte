// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// class AudioPlayerPage extends StatefulWidget {
//   final String title;
//   final String address;

//   const AudioPlayerPage({Key? key, required this.title, required this.address})
//       : super(key: key);

//   @override
//   _AudioPlayerPageState createState() => _AudioPlayerPageState();
// }

// class _AudioPlayerPageState extends State<AudioPlayerPage> {
//   late AudioPlayer audioPlayer;
//   bool _isPlaying = false;
//   double _currentPosition = 0;
//   double _totalDuration = 0;

//   @override
//   void initState() {
//     super.initState();
//     audioPlayer = AudioPlayer();
//     initializePlayer();
//   }

//   void initializePlayer() {
//     audioPlayer.onDurationChanged.listen((Duration d) {
//       setState(() {
//         _totalDuration = d.inSeconds.toDouble();
//       });
//     });

//     // audioPlayer.onAudioPositionChanged.listen((Duration p) {
//     //   setState(() {
//     //     _currentPosition = p.inSeconds.toDouble();
//     //   });
//     // });

//     // audioPlayer.onPlayerCompletion.listen((event) {
//     //   setState(() {
//     //     _isPlaying = false;
//     //     _currentPosition = 0;  // Reset position
//     //   });
//     // });

//     // audioPlayer.onPlayerError.listen((msg) {
//     //   print('audioPlayer error : $msg');
//     //   setState(() {
//     //     _isPlaying = false;
//     //     _currentPosition = 0;
//     //     _totalDuration = 0;
//     //   });
//     // });

//     _initializeAndPlay(widget.address);
//   }

//   void _playAudio(String url) async {
//     await audioPlayer.play(UrlSource(url));
//   }

//   Future<void> _initializeAndPlay(String url) async {
//     try {
//       _playAudio(url);
//       setState(() => _isPlaying = true);
//     } catch (e) {
//       print("An error occurred while playing audio: $e");
//       setState(() => _isPlaying = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF121212),
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.network(
//                 'https://placehold.it/400x400', // Placeholder for album art or related image
//                 width: 300,
//                 height: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Slider(
//             value: _currentPosition,
//             min: 0,
//             max: _totalDuration,
//             onChanged: (value) {
//               setState(() {
//                 _currentPosition = value;
//               });
//               audioPlayer.seek(Duration(seconds: value.toInt()));
//             },
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.skip_previous),
//                 onPressed: () => _isPlaying
//                     ? audioPlayer.seek(
//                         Duration(seconds: (_currentPosition - 10).toInt()))
//                     : null,
//                 color: Colors.white,
//                 iconSize: 48,
//               ),
//               IconButton(
//                 icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
//                 onPressed: () {
//                   if (_isPlaying) {
//                     audioPlayer.pause();
//                     setState(() => _isPlaying = false);
//                   } else {
//                     audioPlayer.resume();
//                     setState(() => _isPlaying = true);
//                   }
//                 },
//                 color: Colors.white,
//                 iconSize: 48,
//               ),
//               IconButton(
//                 icon: Icon(Icons.skip_next),
//                 onPressed: () => _isPlaying
//                     ? audioPlayer.seek(
//                         Duration(seconds: (_currentPosition + 10).toInt()))
//                     : null,
//                 color: Colors.white,
//                 iconSize: 48,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  final String title;
  final String address;

  const AudioPlayerPage({Key? key, required this.title, required this.address})
      : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _initializeAndPlay(widget.address);
  }

  Future<void> _initializeAndPlay(String url) async {
    try {
      await audioPlayer.setUrl(url);
      audioPlayer.play();
      audioPlayer.playerStateStream.listen((playerState) {
        final isPlaying = playerState.playing;
        final processingState = playerState.processingState;
        if (processingState == ProcessingState.completed) {
          setState(() {
            _isPlaying = false;
          });
        } else {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      });
    } catch (e) {
      print("An error occurred while playing audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://placehold.it/400x400', // Placeholder for album art or related image
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
//          StreamBuilder
// (Duration>(
// stream: audioPlayer.positionStream,
// builder: (context, snapshot) {
// final currentPosition = snapshot.data?.inMilliseconds.toDouble() ?? 0;
// final totalDuration = audioPlayer.duration?.inMilliseconds.toDouble() ?? 0;
// return Slider(
// value: currentPosition,
// min: 0,
// max: totalDuration,
// onChanged: (value) {
// audioPlayer.seek(Duration(milliseconds: value.toInt()));
// },
// );
// },
// ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  final newTime = (audioPlayer.position.inSeconds - 10)
                      .clamp(0, audioPlayer.duration?.inSeconds ?? 0);
                  audioPlayer.seek(Duration(seconds: newTime));
                },
                color: Colors.white,
                iconSize: 48,
              ),
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  if (_isPlaying) {
                    audioPlayer.pause();
                  } else {
                    audioPlayer.play();
                  }
                },
                color: Colors.white,
                iconSize: 48,
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  final newTime = (audioPlayer.position.inSeconds + 10)
                      .clamp(0, audioPlayer.duration?.inSeconds ?? 0);
                  audioPlayer.seek(Duration(seconds: newTime));
                },
                color: Colors.white,
                iconSize: 48,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
