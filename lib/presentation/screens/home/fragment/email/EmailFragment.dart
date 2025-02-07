import 'package:flutter/material.dart';
import 'package:insync_flutter/core/util/theme/colors.dart';
import 'package:insync_flutter/presentation/components/button/CFilledButton.dart';

import '../../../../../core/util/constants/dims.dart';
import '../../../../components/card/ScheduleCard.dart';

class EmailFragment extends StatelessWidget {
  const EmailFragment({super.key});

  @override
  Widget build(BuildContext context) {
    double parentHeight = getScreenHeight(context);
    double parentWidth = getScreenWidth(context);

    return Column(
      children: [
        Container(
          width: parentWidth,
          height: parentHeight * 0.26,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              const SizedBox(height: 36),

              // Search Bar
              SizedBox(
                width: parentWidth * 0.8,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search from emails",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Gmail Button
              Align(
                alignment: Alignment.centerLeft,
                child: CfilledButton(
                  width: 100,
                  text: "Gmail",
                  height: 36,
                  buttonColor: softBlack,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  onTap: () {},
                ),
              ),

              const SizedBox(height: 10),

              // Horizontal Scrollable Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Add Button
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: softWhite,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(child: Text("+")),
                    ),
                    const SizedBox(width: 6),

                    // Vertical Divider
                    Container(
                      width: 2,
                      height: 30,
                      color: softBlack,
                    ),
                    const SizedBox(width: 6),

                    // Filter Buttons
                    CfilledButton(
                      width: 60,
                      height: 30,
                      text: "All",
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 6),
                    CfilledButton(
                      width: 140, // Increased width for long text
                      height: 30,
                      text: "deepak78@gmail.com",
                      buttonColor: softWhite,
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 6),
                    CfilledButton(
                      width: 140,
                      height: 30,
                      text: "deepak78@gmail.com",
                      buttonColor: softWhite,
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
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
