import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insync_flutter/core/util/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../../core/util/constants/dims.dart';
import '../../view_models/auth/auth_view_model.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double parentWidth = getScreenWidth(context);
    double parentHeight = getScreenHeight(context);

    final authViewModel = Provider.of<AuthViewModel>(context);

    Future<void> googleSignIn() async {
      try{
        await authViewModel.signInWithGoogle();
      }catch(error){
        throw error;
      }
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: parentWidth,
            height: parentHeight * 0.7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                      "assets/images/insync_logo.png",
                    scale: 5,
                  ),
                  Text(
                    "Connect Your Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary
                    ),
                  ),

                  Text(
                      "You will be required to grant email read-only permission so we can access your emails.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.secondary),
                      children: [
                        TextSpan(
                          text: "We do not store any information longer than 30 days neither we share any kind of data with any third party company. ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy policy",
                          style: TextStyle(color: link),
                          // navigate to the privacy policy page
                          recognizer: TapGestureRecognizer()..onTap = () {}
                        )
                      ]
                    ),
                  ),

                  // reusable sign in with google button
                  OutlinedButton(
                    onPressed: googleSignIn,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary
                      ),
                      surfaceTintColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40), // Rounded corners
                      ),
                      minimumSize: Size(parentWidth * 0.7, 50)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        authViewModel.isLoading ?
                        CircularProgressIndicator() :
                        Image.asset(
                          "assets/images/google_logo.png",
                          scale: 2,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.secondary),
                        children: [
                          TextSpan(
                            text: "By continuing you agree to our ",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(color: link),
                              // navigate to the privacy policy page
                              recognizer: TapGestureRecognizer()..onTap = () {}
                          )
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: parentHeight*0.2,),

          SizedBox(
            width: parentWidth,
            height: parentHeight * 0.1,
            child: Center(
                child: Text(
                    "All Copyrights reserved © 2024-2026",
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
            ),
          )
        ],
      )
    );
  }
}
