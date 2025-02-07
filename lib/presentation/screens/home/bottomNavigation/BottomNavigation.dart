import 'package:flutter/material.dart';
import 'package:insync_flutter/presentation/screens/home/fragment/email/EmailFragment.dart';
import 'package:insync_flutter/presentation/screens/home/fragment/profile/ProfileFragment.dart';
import 'package:insync_flutter/presentation/screens/home/fragment/schedule/ScheduleFragment.dart';
import 'package:ionicons/ionicons.dart';

import '../fragment/interest/InterestFragment.dart';

class BottomNavigation extends StatefulWidget {

  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ScheduleFragment(),
    EmailFragment(),
    InterestFragment(),
    ProfileFragment()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        indicatorColor: Theme.of(context).colorScheme.primary,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
              icon: Icon(Ionicons.calendar_outline),
              label: "Schedule"
          ),
          NavigationDestination(
              icon: Icon(Ionicons.mail_outline),
              label: "Email"
          ),
          NavigationDestination(
              icon: Icon(Ionicons.heart_outline),
              label: "Interest"
          ),
          NavigationDestination(
              icon: Icon(Ionicons.person_outline),
              label: "Profile"
          ),
        ],
      ),
    );
  }
}
