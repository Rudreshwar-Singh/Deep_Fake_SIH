import 'package:flutter/material.dart';


class Appbar_screen extends StatefulWidget implements PreferredSizeWidget {
  const Appbar_screen({super.key});

  @override
  State<Appbar_screen> createState() => _AppbarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<Appbar_screen> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: CircleAvatar(
                radius: 20, // Adjust the radius as needed
                backgroundImage: AssetImage('images/Rudreshwar.jpg'),
              ));
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           SizedBox(width: 3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset('images/logo.jpg',
                    height: 38), // Change this to your logo
                SizedBox(width: 8),
                Text('DeFake.ai'),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.search
                // color: newPost ? Colors.red : Colors.black,
              ),
              // SizedBox(width: 4),
              // Text('0'),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.orange[300],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
