import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visbyte/screens/InputCode.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    //  flutterTts.setSpeechRate(0.4);
    // flutterTts.speak("You have successfully logged in, you are now at your dashboard page, here you have two options you can either take a practice test by swiping to the left, or you can moveon to the internet questions by swiping to the right");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: ListView(
            children: <Widget>[
              // DashboardCard(
              //   title: 'Start Exam',
              //   icon: Icons.play_circle_fill,
              //   color: Colors.deepOrange,
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => Inputcode()));
              //   },
              // ),
              SingleChildScrollView(
                child: Container(
                  height: 400, // Provide a bounded height
                  child: CustomCard(
                    text:
                        'To start your exam you will be asked for the exam code you are given, you can take a practice test, to get familar with the testing environment',
                    onPressed: () {
                      // Define what happens when the button is pressed
                    },
                  ),
                ),
              ),

              DashboardCard(
                title: 'Practice Test',
                icon: Icons.school,
                color: Colors.blue,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DashboardCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: width * 0.7,
//         height: height * 0.3,
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: InkWell(
//             onTap: () {
//               // Handle card tap
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Icon(Icons.dashboard_customize, size: 50, color: Colors.orange),
//                 Text('Card Title', style: TextStyle(fontSize: 16)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DashboardCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final Color color;
//   final VoidCallback onTap;

//   const DashboardCard({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.color,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: width * 0.7,
//         height: height * 0.3,
//         decoration: BoxDecoration(border: Border.all(color: Colors.white)),
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Inputcode()));
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(title, style: TextStyle(fontSize: 16)),
//                 Icon(icon, size: 50, color: Colors.deepOrange),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Determine the gradient colors based on the title
    List<Color> gradientColors = title == 'Start Exam'
        ? [Colors.deepOrange, Colors.orange.shade800]
        : [Colors.blue, Colors.blue.shade800];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 0.7,
        height: 150, // Fixed height for uniformity
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(icon, size: 50, color: Colors.white),
                  Text(title,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomCard({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // To make the card fit its children's size
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5, // Line spacing for better readability
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Space between text and button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context)
                    .primaryColor, // Use the theme's primary color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: onPressed,
              child: DashboardCard(
                title: 'Start Exam',
                icon: Icons.play_circle_fill,
                color: Colors.deepOrange,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Inputcode()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
