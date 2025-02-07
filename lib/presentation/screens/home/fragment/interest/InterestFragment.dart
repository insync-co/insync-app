import 'package:flutter/material.dart';
import 'package:insync_flutter/core/util/theme/colors.dart';
import 'package:insync_flutter/presentation/components/button/CFilledButton.dart';

import '../../../../../core/util/constants/dims.dart';

class InterestFragment extends StatelessWidget {
  const InterestFragment({super.key});

  @override
  Widget build(BuildContext context) {
    double parentWidth = getScreenWidth(context);
    double parentHeight = getScreenHeight(context);

    List<Map<String, String>> emails = List.generate(
      20,
          (index) => {
        "sender": "Thora2909@gmail.com",
        "subject": "Constructive and destructive waves"
      },
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: softBlack,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal Scrollable Filters
            SizedBox(
              width: parentWidth,
              height: parentHeight * 0.06,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CfilledButton(
                      width: 60,
                      height: 30,
                      text: "All",
                      buttonColor: Theme.of(context).colorScheme.primary,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 6),
                    CfilledButton(
                      width: 140,
                      height: 30,
                      text: "deepak1@gmail.com",
                      buttonColor: softWhite,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 6),
                    CfilledButton(
                      width: 100,
                      height: 30,
                      text: "deepak78@gmail.com",
                      buttonColor: softWhite,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),


            // Email List
            Expanded(
              child: ListView.builder(
                itemCount: emails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: softWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index == 0 ? "General" : emails[index]["sender"]!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.email, size: 18, color: Colors.black),
                              const SizedBox(width: 8),
                              Text(
                                emails[index]["subject"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
