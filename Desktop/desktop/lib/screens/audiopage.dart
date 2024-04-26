import 'package:desktop/screens/singleaudio.dart';
import 'package:flutter/material.dart';

class MyMP3Page extends StatelessWidget {
  final List<Map<String, String>> mp3Collection = [
    {
      "title": "Song One",
      "address":
          "https://storage.googleapis.com/cloudlabs-tts.appspot.com/audio/audio-ed993fbe592f3c17db4bc665fba5462f.mp3"
    },
    {
      "title": "Song Two",
      "address":
          "https://storage.googleapis.com/cloudlabs-tts.appspot.com/audio/audio-ed993fbe592f3c17db4bc665fba5462f.mp3"
    },
    {"title": "Song Three", "address": "Artist Three"},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212) // Dark charcoal
      ,
      appBar: AppBar(
        title: Text('MP3 Collection'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              3, // Adjust based on screen size and design requirements
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1 / 1.2,
        ),
        itemCount: mp3Collection.length,
        itemBuilder: (context, index) {
          return
              // GestureDetector(
              //   onTap: () {
              //     AudioPlayerPage(
              //       title: '${mp3Collection[index]["title"]}',
              //       address: '${mp3Collection[index]["address"]}',
              //     );
              //     print('Playing ${mp3Collection[index]["title"]}');
              //   },
              //   child: Card(
              //     elevation: 8,
              //     shadowColor: Colors.deepOrange.withOpacity(0.5),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [Colors.grey[850]!, Colors.black],
              //           begin: Alignment.topLeft,
              //           end: Alignment.bottomRight,
              //         ),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(15.0),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.stretch,
              //           children: [
              //             Text(
              //               mp3Collection[index]["title"]!,
              //               style: TextStyle(color: Colors.white),
              //               textAlign: TextAlign.center,
              //             ),
              //             SizedBox(height: 10),
              //             // Text(
              //             //   mp3Collection[index]["address"]!,
              //             //   style: TextStyle(color: Colors.white),
              //             //   textAlign: TextAlign.center,
              //             // ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // );
              ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AudioPlayerPage(
                    title: mp3Collection[index]["title"]!,
                    address: mp3Collection[index]["address"]!,
                  ),
                ),
              );
              print('Playing ${mp3Collection[index]["title"]}');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor:
                  MaterialStateProperty.all(Colors.deepOrange.withOpacity(0.5)),
              elevation: MaterialStateProperty.all(8),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.deepOrange.withOpacity(0.5);
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey[850]!, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      mp3Collection[index]["title"]!,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Icon(
                      Icons.play_arrow,
                      size: 80,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
