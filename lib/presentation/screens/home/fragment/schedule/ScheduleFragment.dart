import 'package:flutter/material.dart';
import 'package:insync_flutter/presentation/components/card/ScheduleCard.dart';

import '../../../../../core/util/constants/dims.dart';

class ScheduleFragment extends StatelessWidget {
  const ScheduleFragment({super.key});

  @override
  Widget build(BuildContext context) {
    double parentWidth = getScreenWidth(context);
    double parentHeight = getScreenHeight(context);

    return Column(
      children: [
        Container(
          width: parentWidth,
          height: parentHeight * 0.13,
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Added padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24, // Profile picture size
                    backgroundImage: AssetImage('assets/images/profile.png'), // Replace with actual path
                  ),

                  const SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
                    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                    children: const [
                      Text(
                        "Hi,",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Deepak Singh",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.add,  size: 28),
                onPressed: () {
                  // Handle Add button press
                },
              ),
            ],
          ),
        ),

        Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: ScheduleCard(),
                  );
                }
            )
        )
      ],
    );
  }
}
