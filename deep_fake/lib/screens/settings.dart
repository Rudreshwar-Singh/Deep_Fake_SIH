import 'package:flutter/material.dart';
// import 'package:moofli_fullstack/utils/appbar.dart';

// class Settings extends StatefulWidget {
//   const Settings({super.key});

//   @override
//   State<Settings> createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Moofli'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Go to Settings'),
//           onPressed: () {
//             Navigator.pushNamed(context, '/settings');
//           },
//         ),
//       ),
//     );
//   }
// }

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Edit Account Information',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                // Handle edit account information tap
              },
            ),
            // Divider(),
            // Spacer(),
            // ListTile(
            //   leading: Icon(Icons.logout, color: Colors.red),
            //   title: Text('Log Out',
            //       style: TextStyle(
            //           color: Colors.red, fontWeight: FontWeight.bold)),
            //   onTap: () {
            //     // Handle logout tap
            //   },
            // ),
            // Divider(),
          ],
        ),
      ),
    );
  }
}
