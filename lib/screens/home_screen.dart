import 'package:flutter/material.dart';
import 'package:wetalk/utils/colors.dart';
import 'package:wetalk/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  int _page = 0;
  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: () {},
                text: 'New Meeting',
                icon: Icons.videocam,
                ),

                 HomeMeetingButton(
                onPressed: () {},
                text: 'Join Meeting',
                icon: Icons.add_box_rounded,
                ),

                 HomeMeetingButton(
                onPressed: () {},
                text: 'Schedule',
                icon: Icons.calendar_today,
                ),

                 HomeMeetingButton(
                onPressed: () {},
                text: 'Share Screen',
                icon: Icons.arrow_upward_rounded,
                ),
            ],
          ),
          const Expanded(child: Center(child: Text(
            'Create or Join the meeting with just a click',
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 16
              ),
            ),
          ),
        ),
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(
         backgroundColor: otherColor,
         selectedItemColor: Colors.blue,
         unselectedItemColor: Colors.amber,
         onTap: onPageChanged,
         currentIndex: _page,
         type: BottomNavigationBarType.fixed,
         unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
              ),
              label: 'Meet and Chat',
              ),

               BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
              ),
              label: 'Meetings',
              ),

               BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              ),
              label: 'Contacts',
              ),

               BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              ),
              label: 'Settings' ,
              )
        ],
      )
    );
  }
}