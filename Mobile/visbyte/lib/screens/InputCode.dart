// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:visbyte/screens/InternetQuestions.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:ui';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:tutorialapp/sidebarsight.dart';

class Inputcode extends StatefulWidget {
  const Inputcode({super.key});

  @override
  State<Inputcode> createState() => _InputcodeState();
}

class _InputcodeState extends State<Inputcode> {
  final box = GetStorage();
  FlutterTts flutterTts = FlutterTts();
  late String spoken;
  SpeechToText stt = SpeechToText();

  late List<Map<String, dynamic>> userData;
  late TextEditingController codetext;
  bool isButtonActive = true;
  bool Entered = false;
  Color miccolored = Color.fromARGB(255, 236, 112, 40);
  Color miccolor = Color.fromARGB(255, 131, 130, 130);
  Color miccolorreserv = Color.fromARGB(255, 131, 130, 130);
  bool Usegyroscope = true;
  @override
  void initState() {
    super.initState();
    box.write('useGyroscope', true);
    codetext = TextEditingController();
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak(
        "You are a click away from your Exam, please Enter the code assigned for this exam, you just need to hold anywhere on the screen and say the course code, or it can be typed manually by a gaurdian,  you can doubletap to start the exam");
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  int? internettime;
  List<Internet> suns = [];
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
              color: Color.fromARGB(
                  255, 236, 112, 40) // set the desired color here
              ),
        ),
        child: Scaffold(
            backgroundColor: Colors.grey[800],
            body: Scaffold(
              body: GestureDetector(
                onTapDown: (details) async {
                  flutterTts.stop();
                  codetext.clear();
                  setState(() {
                    miccolor = miccolored;
                  });
                  var avaliable = await stt.initialize();
                  if (avaliable) {
                    stt.listen(
                      onResult: (result) {
                        spoken = result.recognizedWords;
                        setState(() {
                          codetext.text = spoken;
                        });
                        setState(() {
                          Entered = true;
                        });
                      },
                    );
                  }
                },
                onTapUp: (details) {
                  setState(() {
                    miccolor = miccolorreserv;
                  });
                  stt.stop();
                  flutterTts.setSpeechRate(0.4);
                  flutterTts.speak("Your course code is ${codetext.text}");
                },
                onTap: Entered
                    ? () {
                        flutterTts.setSpeechRate(0.4);
                        flutterTts
                            .speak("Your course code is ${codetext.text}");
                      }
                    : null,
                onDoubleTap: _sendCode,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          CustomPopupWidget(
                            text:
                                'Use Voice based response, instead of the Gyroscope function?',
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              child:
                                  // TextFormField(
                                  //   controller: codetext,
                                  //   decoration: new InputDecoration(
                                  //     labelText: "Enter code",
                                  //     fillColor: Colors.white,
                                  //     border: new OutlineInputBorder(
                                  //       borderRadius:
                                  //           new BorderRadius.circular(25.0),
                                  //       borderSide: new BorderSide(),
                                  //     ),
                                  //   ),
                                  //   validator: (val) {
                                  //     if (val?.length == 0) {
                                  //       return "Codecannot be empty";
                                  //     } else {
                                  //       return null;
                                  //     }
                                  //   },
                                  //   // keyboardType: TextInputType.emailAddress,
                                  //   style: new TextStyle(
                                  //     fontFamily: "Poppins",
                                  //   ),
                                  // ),
                                  TextFormField(
                                controller: codetext,
                                style: TextStyle(color: Colors.white70),
                                decoration: InputDecoration(
                                  hintText: "Enter code",
                                  hintStyle: TextStyle(color: Colors.white54),
                                  filled: true,
                                  fillColor: Colors.grey[800],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.security,
                                      color: Colors.deepOrange),
                                ),
                                validator: (val) {
                                  if (val?.length == 0) {
                                    return "Codecannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),

                          // TextButton(
                          //   // style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 255, 150, 64)
                          //   // )
                          //   // ),
                          //   child: Text("Submit",style:TextStyle(fontSize: 25,color:Colors.white,fontFamily: "Poppins",)),
                          //   onPressed: isButtonActive?  (){print("LOGIN");

                          //      _sendCode();

                          //   }:null,

                          //     // Email =email.text;
                          //     // Password=password.text;
                          //   // String newEmail = Email.replaceAll(new RegExp(r'[^\w\s]+'), '');
                          //                       // String compareemail= compareemail.replaceAll(new RegExp(r'[^\w\s]+'),
                          // // String emailtrim = Email.trim();
                          // //  String passwordtrim = Password.trim();
                          // //   validator(newEmail.trim(),passwordtrim);},
                          // ),

                          SizedBox(
                            height: 70,
                          ),
                          Icon(Icons.mic, size: 70, color: miccolor),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }

  void _sendCode() async {
    print("Click");
    if (codetext.text.isNotEmpty) {
      Response<Map> response =

          // await Dio().post(
          //     "https://isub.addisphoenix.com/visbyte/berhan-backend/api/exam/get-question",
          await Dio().post("http://192.168.43.42:5000/api/exam/get-question",
              data: {
                "code": codetext.text,
              },
              options: new Options(
                  contentType: "application/x-www-form-urlencoded"));

      if (response.data!['message'] == "Success") {
        List<dynamic> rawData = response.data!['data'];
        suns = rawData.map<Internet>((dataItem) {
          return Internet.fromMap(dataItem as Map<String, dynamic>);
        }).toList();
        // return suns;
      } else {
        throw Exception(
            'Failed to load questions with status code: ${response.statusCode}');
      }

      print(suns[0].question);

      int? internettime = suns[0].timeall?.isEmpty == true
          ? null
          : int.tryParse(suns[0].timeall!);
      print(internettime);
      // _mybox.put(57, codetext.text);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InternetquestionSight(
                questions: suns,
                seconds: internettime!,
              )));
    }
  }

  Future<void> _showErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext fcontext) {
        return AlertDialog(
          title: const Text('Our Records show you took this test,already'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 120,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Internet {
  String? question;
  String? choicea;
  String? choiceb;
  String? choicec;
  String? choiced;
  String? answers;
  String? timeall;
  Internet(
      {required this.question,
      required this.choicea,
      required this.choiceb,
      required this.choicec,
      required this.choiced,
      required this.answers,
      required this.timeall});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'choicea': choicea,
      'choiceb': choiceb,
      'choicec': choicec,
      'choiced': choiced,
      'answers': answers,
      'timeall': timeall,
    };
  }

  factory Internet.fromMap(Map<String, dynamic> map) {
    return Internet(
      question: map['question'] != null ? map['question'] as String : null,
      choicea: map['choicea'] != null ? map['choicea'] as String : null,
      choiceb: map['choiceb'] != null ? map['choiceb'] as String : null,
      choicec: map['choicec'] != null ? map['choicec'] as String : null,
      choiced: map['choiced'] != null ? map['choiced'] as String : null,
      answers: map['answers'] != null ? map['answers'] as String : null,
      timeall: map['timeall'] != null ? map['timeall'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Internet.fromJson(String source) =>
      Internet.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CustomPopupWidget extends StatefulWidget {
  final String text;

  CustomPopupWidget({Key? key, required this.text}) : super(key: key);

  @override
  _CustomPopupWidgetState createState() => _CustomPopupWidgetState();
}

class _CustomPopupWidgetState extends State<CustomPopupWidget> {
  bool isSwitched = false;
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[900]?.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  box.write('useGyroscope', !value);
                  print("box");
                  print(box.read('useGyroscope'));
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeTrackColor: Colors.deepOrangeAccent.withOpacity(0.7),
                activeColor: Colors.deepOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
