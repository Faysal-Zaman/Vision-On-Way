import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:sign_button/create_button.dart';
//import 'package:sign_button/sign_button.dart';
import 'package:sign_in/controller/auth_controller.dart';
import 'package:sign_in/screens/reset_password/reset_password.dart';
import 'package:sign_in/screens/sign_up/sign_up.dart';
import 'package:sign_in/widgets/rounded_elevated_button.dart';
import 'package:sign_in/widgets/text_with_textbutton.dart';

import '../../../config.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: Config.screenHeight! * 0.005),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text('Forgot Password?'),
                onPressed: () => Get.to(() => ResetPassword()),
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              width: Config.screenWidth! * 0.9,
              height: Config.screenHeight! * 0.07,
              child: ElevatedButton(
                child: Text('Sign In', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text;
                    _authController.signIn(email, password);
                  }
                },
              ),
            ),
          ),
          SizedBox(height: Config.screenHeight! * 0.01),
          TextWithTextButton(
            text: 'Don\'t have an account?',
            textButtonText: 'Sign up',
            onPressed: () => Get.to(() => SignUp()),
          ),
        ],
      ),
    );
  }
}
