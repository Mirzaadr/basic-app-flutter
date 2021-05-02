import 'package:flutter/material.dart';
import 'package:starter_app/screens/auth/auth_layout/styles.dart';
import 'package:starter_app/screens/auth/auth_layout/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  /// The main title to show in the top left of the view
  final String title;

  /// The text to show under the subtitle
  final String subtitle;

  /// The text to show in the main CTA button on the view
  final String mainButtonTitle;

  /// The form to show in the middle of the layout
  final Widget form;

  /// Indicates if we want to display the terms text
  final bool showTermsText;

  /// Called when the main button is pressed
  final VoidCallback onMainButtonTapped;

  // Called when the user taps on the "Create Account text"
  final VoidCallback? onCreateAccountTapped;

  /// Called when tapping on the "Forgot Password" text
  final VoidCallback? onForgetPasswordTapped;

  /// Called when the on screen back button is tapped
  final VoidCallback? onBackPressed;

  /// The validation message to show on the form
  final String? validationMessage;

  /// Indicates if the form is busy or not
  final bool busy;

  const AuthenticationLayout({
    required this.title,
    required this.subtitle,
    required this.form,
    required this.onMainButtonTapped,
    this.validationMessage,
    this.onCreateAccountTapped,
    this.onForgetPasswordTapped,
    this.onBackPressed,
    this.mainButtonTitle = 'CONTINUE',
    this.showTermsText = false,
    this.busy = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            if (onBackPressed == null) verticalSpaceLarge,
            if (onBackPressed != null) verticalSpaceRegular,
            if (onBackPressed != null)
              IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: onBackPressed,
              ),
            Text(
              title,
              style: TextStyle(fontSize: 34),
            ),
            verticalSpaceSmall,
            SizedBox(
              width: screenWidthPercentage(context, percentage: 0.7),
              child: Text(
                subtitle,
                style: ktsMediumGreyBodyText,
              ),
            ),
            verticalSpaceRegular,
            form,
            verticalSpaceRegular,
            if (onForgetPasswordTapped != null)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onForgetPasswordTapped,
                  child: Text(
                    'Forget Password',
                    style: ktsMediumGreyBodyText.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            verticalSpaceRegular,
            if (validationMessage != null)
              Text(
                '$validationMessage',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            if (validationMessage != null) verticalSpaceRegular,
            GestureDetector(
              onTap: onMainButtonTapped,
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: busy
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                    : Text(
                        mainButtonTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
              ),
            ),
            verticalSpaceRegular,
            if (onCreateAccountTapped != null)
              GestureDetector(
                onTap: onCreateAccountTapped,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    horizontalSpaceTiny,
                    Text(
                      'Create an account',
                      style: TextStyle(color: kcPrimaryColor),
                    )
                  ],
                ),
              ),
            if (showTermsText)
              Text(
                'By signing up you agree to our terms, conditions and privacy Policy.',
                style: ktsMediumGreyBodyText,
                textAlign: TextAlign.center,
              )
          ],
        ));
  }
}
