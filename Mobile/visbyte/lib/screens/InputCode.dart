// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
// import 'package:hive/hive.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:tutorialapp/sightinternetquestions.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:tutorialapp/sidebarsight.dart';

// class Inputcode extends StatefulWidget {
//   const Inputcode({super.key});

//   @override
//   State<Inputcode> createState() => _InputcodeState();
// }

// class _InputcodeState extends State<Inputcode> {
//   FlutterTts flutterTts = FlutterTts();
//   late String spoken;
//   SpeechToText stt = SpeechToText();
//   final _mybox = Hive.box('dotBox');
//   late List<Map<String, dynamic>> userData;
//   late TextEditingController codetext;
//   bool isButtonActive = true;
//   bool Entered = false;
//   Color miccolored = Color.fromARGB(255, 236, 112, 40);
//   Color miccolor = Color.fromARGB(255, 131, 130, 130);
//   Color miccolorreserv = Color.fromARGB(255, 131, 130, 130);
//   @override
//   void initState() {
//     super.initState();

//     codetext = TextEditingController();
//     flutterTts.setSpeechRate(0.4);
//     flutterTts.speak(
//         "You are now on your way to the Intenet Exam, this the the part of the page where you enter the coursecode that was assigned for this exam, you just need to hold anywhere on the screen and say the course code, or it can be typed manually by a gaurdian, when I repeat the course code you entered and you find it acceptable then you can doubletap to start the exam");
//   }

//   @override
//   void dispose() {
//     flutterTts.stop();
//     super.dispose();
//   }

//   int? internettime;
//   List<Internet> suns = [];
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//         data: ThemeData(
//           iconTheme: IconThemeData(
//               color: Color.fromARGB(
//                   255, 236, 112, 40) // set the desired color here
//               ),
//         ),
//         child: Scaffold(
//             appBar: AppBar(
//               iconTheme: IconThemeData(
//                 color: Color.fromARGB(
//                     255, 236, 112, 40), // set the desired color here
//               ),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     _mybox.delete(70);
//                     Navigator.of(context).pop();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text('Logout'),
//                 ),
//               ],
//               backgroundColor: Colors.grey[200],
//             ),
//             drawer: NavBarSS(),
//             body: Scaffold(
//               body: GestureDetector(
//                 onTapDown: (details) async {
//                   flutterTts.stop();
//                   codetext.clear();
//                   setState(() {
//                     miccolor = miccolored;
//                   });
//                   var avaliable = await stt.initialize();
//                   if (avaliable) {
//                     stt.listen(
//                       onResult: (result) {
//                         spoken = result.recognizedWords;
//                         setState(() {
//                           codetext.text = spoken;
//                         });
//                         setState(() {
//                           Entered = true;
//                         });
//                       },
//                     );
//                   }
//                 },
//                 onTapUp: (details) {
//                   setState(() {
//                     miccolor = miccolorreserv;
//                   });
//                   stt.stop();
//                   flutterTts.setSpeechRate(0.4);
//                   flutterTts.speak("Your course code is ${codetext.text}");
//                 },
//                 onTap: Entered
//                     ? () {
//                         flutterTts.setSpeechRate(0.4);
//                         flutterTts
//                             .speak("Your course code is ${codetext.text}");
//                       }
//                     : null,
//                 onDoubleTap: _sendCode,
//                 child: Container(
//                   width: double.infinity,
//                   height: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 236, 235, 235),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 150.0),
//                     child: Center(
//                       child: SingleChildScrollView(
//                         child: Column(children: [
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(25.0),
//                                 ),
//                               ),
//                               child: TextFormField(
//                                 controller: codetext,
//                                 decoration: new InputDecoration(
//                                   labelText: "Enter code",
//                                   fillColor: Colors.white,
//                                   border: new OutlineInputBorder(
//                                     borderRadius:
//                                         new BorderRadius.circular(25.0),
//                                     borderSide: new BorderSide(),
//                                   ),
//                                 ),
//                                 validator: (val) {
//                                   if (val?.length == 0) {
//                                     return "Codecannot be empty";
//                                   } else {
//                                     return null;
//                                   }
//                                 },
//                                 // keyboardType: TextInputType.emailAddress,
//                                 style: new TextStyle(
//                                   fontFamily: "Poppins",
//                                 ),
//                               ),
//                             ),
//                           ),

               

//                           SizedBox(
//                             height: 70,
//                           ),
//                           Icon(Icons.mic, size: 70, color: miccolor),
//                         ]),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )));
//   }

//   void _sendCode() async {
//     if (codetext.text.isNotEmpty) {
//       Response<Map> response =
//      
//           await Dio().post(
//               "https://isub.addisphoenix.com/visbyte/berhan-backend/api/exam/get-question",
//               data: {
//                 "code": codetext.text,
//                 // "email": _mybox.get(80),
//               },
//               options: new Options(
//                   contentType: "application/x-www-form-urlencoded"));

//       suns = response.data!['data']!
//           .map((e) => Internet.fromMap(e as Map<String, dynamic>))
//           .toList();
//       print(suns[0].question);

//       int? internettime = suns[0].timeall?.isEmpty == true
//           ? null
//           : int.tryParse(suns[0].timeall!);
//       print(internettime);
//       _mybox.put(57, codetext.text);
//       Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => InternetquestionSight(
//                 questions: suns,
//                 seconds: internettime!,
//               )));
//     }
//   }

//   Future<void> _showErrorDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext fcontext) {
//         return AlertDialog(
//           title: const Text('Our Records show you took this test,already'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Icon(
//                   Icons.warning,
//                   color: Colors.red,
//                   size: 120,
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Ok'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class Internet {
//   String? question;
//   String? choicea;
//   String? choiceb;
//   String? choicec;
//   String? choiced;
//   String? answers;
//   String? timeall;
//   Internet(
//       {required this.question,
//       required this.choicea,
//       required this.choiceb,
//       required this.choicec,
//       required this.choiced,
//       required this.answers,
//       required this.timeall});

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'question': question,
//       'choicea': choicea,
//       'choiceb': choiceb,
//       'choicec': choicec,
//       'choiced': choiced,
//       'answers': answers,
//       'timeall': timeall,
//     };
//   }

//   factory Internet.fromMap(Map<String, dynamic> map) {
//     return Internet(
//       question: map['question'] != null ? map['question'] as String : null,
//       choicea: map['choicea'] != null ? map['choicea'] as String : null,
//       choiceb: map['choiceb'] != null ? map['choiceb'] as String : null,
//       choicec: map['choicec'] != null ? map['choicec'] as String : null,
//       choiced: map['choiced'] != null ? map['choiced'] as String : null,
//       answers: map['answers'] != null ? map['answers'] as String : null,
//       timeall: map['timeall'] != null ? map['timeall'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Internet.fromJson(String source) =>
//       Internet.fromMap(json.decode(source) as Map<String, dynamic>);
// }
