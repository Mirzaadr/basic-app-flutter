import 'package:flutter/material.dart';

/// Primary button based on [ElevatedButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, this.isLoading = false, this.onPressed});
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 20, 
                height: 20, 
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                // style: Theme.of(context)
                //     .textTheme
                //     .titleLarge!
                //     .copyWith(color: Colors.white),
                style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
              ),
      ),
    );
  }
}