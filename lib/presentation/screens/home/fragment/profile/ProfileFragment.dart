import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insync_flutter/core/util/theme/colors.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../core/util/constants/dims.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    double parentWidth = getScreenWidth(context);
    double parentHeight = getScreenHeight(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36, left: 8, right: 8, bottom: 8),
          child: Container(
            width: parentWidth,
            decoration: BoxDecoration(
              color: softWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const ListTile(
              leading: CircleAvatar(radius: 30),
              title: Text(
                "Deepak Singh",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("profile, name"),
              trailing: Icon(Ionicons.chevron_forward_outline),
            ),
          ),
        ),

        const SizedBox(height: 20), // Reduced spacing

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: parentWidth,
            decoration: BoxDecoration(
              color: softWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Ionicons.person),
                  title: const Text("Language", style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, // Prevents overflow
                    children: [
                      Text("English", style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(width: 8), // Added spacing
                      const Icon(Ionicons.chevron_forward_outline),
                    ],
                  ),
                ),
                Container(
                  width: parentWidth*0.9,
                  height: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Ionicons.notifications),
                  title: const Text("Notifications", style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, // Prevents overflow
                    children: [
                      Text("On", style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(width: 8), // Added spacing
                      const Icon(Ionicons.chevron_forward_outline),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20), // Reduced spacing

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: parentWidth,
            decoration: BoxDecoration(
              color: softWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Ionicons.mail),
                  title: const Text("Emails", style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, // Prevents overflow
                    children: [
                      Text("deepak78@gmail.com", style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(width: 8), // Added spacing
                      const Icon(Ionicons.chevron_forward_outline),
                    ],
                  ),
                ),
                Container(
                  width: parentWidth*0.9,
                  height: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Ionicons.contrast),
                  title: const Text("Theme", style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, // Prevents overflow
                    children: [
                      Text("Dark mode", style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(width: 8), // Added spacing
                      const Icon(Ionicons.chevron_forward_outline),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20), // Reduced spacing

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: parentWidth,
            decoration: BoxDecoration(
              color: softWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Ionicons.log_out),
                  title: const Text("Log out", style: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
