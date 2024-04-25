// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math';
// import 'dart:ui'; // For ImageFilter.blur

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Animated Waves Popup Example'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => ListeningPopup(),
//                 barrierDismissible: true,
//               );
//             },
//             child: Text('Show Popup'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ListeningPopup extends StatefulWidget {
//   @override
//   _ListeningPopupState createState() => _ListeningPopupState();
// }

// class _ListeningPopupState extends State<ListeningPopup>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration:
//           Duration(seconds: 20), // Increased duration for slower animation
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: EdgeInsets.all(10), // Give some padding around the dialog
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: Container(
//             width: double.infinity,
//             height: 300,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return CustomPaint(
//                   painter: WavePainter(_controller.value),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WavePainter extends CustomPainter {
//   final double animationValue;
//   WavePainter(this.animationValue);

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()..style = PaintingStyle.fill;

//     Path path = Path();

//     // Adjust the number of waves to 3, increased vertical scale, and add spacing
//     double baseHeight = size.height / 2;
//     double amplitude = 50; // Increased amplitude for larger wave height
//     double frequency = 2 * pi / size.width;

//     for (int i = 0; i < 3; i++) {
//       var color = [Colors.deepOrange, Colors.green, Colors.blue][i];
//       var phase = (i + 1) * animationValue * size.width / 2;

//       paint.color = color;
//       path.moveTo(0, baseHeight);

//       for (double x = 0; x <= size.width; x++) {
//         double y = baseHeight + amplitude * sin(frequency * x + phase);
//         path.lineTo(x, y);
//       }

//       path.lineTo(size.width, size.height);
//       path.lineTo(0, size.height);
//       path.close();

//       canvas.drawPath(path, paint);
//       path = Path(); // Reset path for the next wave
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:visbyte/global/globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Modern Siri-like Waves Popup'),
        ),
        body: GestureDetector(
          onLongPressEnd: (details) {
            Navigator.pop(context);
          },
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ListeningPopup(),
                  barrierDismissible: true,
                );
              },
              child: Text('Show Popup'),
            ),
          ),
        ),
      ),
    );
  }
}

class ListeningPopup extends StatefulWidget {
  @override
  _ListeningPopupState createState() => _ListeningPopupState();
}

class _ListeningPopupState extends State<ListeningPopup>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 5), // This controls the overall speed of the animation loop
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Center(
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 50, 48, 48).withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromARGB(255, 184, 181, 181),
                      width: 20)),
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return CustomPaint(
                    painter: SiriWavePainter(
                      animationValue: _controller.value,
                      colors: [
                        Colors.deepOrange,
                        Colors.orange,
                        Colors.deepPurple,
                        Colors.deepPurple
                      ],
                      waveHeights: [
                        40.0,
                        15.0,
                        25.0
                      ], // Change these values for larger or smaller waves
                      waveLengthFactors: [
                        1.0,
                        1.5,
                        0.8
                      ], // Smaller values mean more peaks and troughs (more wavy)
                      waveSpeeds: [
                        1.0,
                        1.5,
                        0.5
                      ], // Different speeds for each wave
                    ),
                    size: const Size(300, 300),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class SiriWavePainter extends CustomPainter {
//   final double animationValue;
//   SiriWavePainter(this.animationValue);

//   final colors = [Colors.orange, Colors.blue, Colors.black];
//   final waveLengths = [1.0, 1.2, 1.5]; // Different wavelengths for variety
//   final waveSpeeds = [
//     1.0,
//     0.7,
//     0.5
//   ]; // Each wave will animate at a different speed

//   @override
//   void paint(Canvas canvas, Size size) {
//     double baseHeight = size.height / 2;

//     for (int i = 0; i < colors.length; i++) {
//       var paint = Paint()
//         ..color = colors[i]
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 2.0;

//       var path = Path();
//       var wavelength = size.width / waveLengths[i];
//       var waveHeight = 10.0;

//       // Start the path
//       path.moveTo(0, baseHeight);
//       for (double x = 0; x <= size.width; x++) {
//         double y = waveHeight *
//                 sin((x / wavelength) +
//                     (animationValue * 2 * pi * waveSpeeds[i])) +
//             baseHeight;
//         path.lineTo(x, y);
//       }
//       canvas.drawPath(path, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

class SiriWavePainter extends CustomPainter {
  final double animationValue;
  final List<Color> colors;
  final List<double> waveHeights;
  final List<double> waveLengthFactors;
  final List<double> waveSpeeds;

  SiriWavePainter({
    required this.animationValue,
    required this.colors,
    required this.waveHeights,
    required this.waveLengthFactors,
    required this.waveSpeeds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double baseHeight = size.height / 2;

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0;

      final path = Path();
      final wavelength = size.width / waveLengthFactors[i];

      path.moveTo(0, baseHeight);
      for (double x = 0; x <= size.width; x++) {
        final y = waveHeights[i] *
                sin((x / wavelength) +
                    (animationValue * 2 * pi * waveSpeeds[i])) +
            baseHeight;
        path.lineTo(x, y);
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
