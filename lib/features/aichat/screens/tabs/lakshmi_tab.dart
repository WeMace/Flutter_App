import 'package:flutter/material.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/theme/pallete.dart';

class LakshmiTab extends StatelessWidget {
  const LakshmiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Image.asset(
              Constants.Lakshmi,
            ),
          ),
          const Text(
            'Ask Goddess Lakshmi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: const Text(
              'Powered by Gemini Pro Vision, trained on a tailored dataset, to unlock their full potential.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: .1,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Pallete.surfaceColor,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            // controller: ,
                            decoration: InputDecoration(
                              hintText: 'Share your Doubts',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle sending image
                          },
                          icon: Icon(Icons.add_a_photo),
                          color: Pallete.primaryColor,
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle sending text
                          },
                          icon: Icon(Icons.send),
                          color: Pallete.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
