import 'package:flutter/material.dart';

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
              DashboardCard(
                title: 'Start Exam',
                icon: Icons.play_circle_fill,
                color: Colors.deepOrange,
                onTap: () {
                  // Start Exam action
                },
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
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 0.7,
        height: height * 0.3,
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {
              // Handle card tap
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 16)),
                Icon(icon, size: 50, color: Colors.deepOrange),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
