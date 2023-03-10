import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in/controller/auth_controller.dart';
import 'package:sign_in/screens/root.dart';
import 'package:sign_in/widgets/rounded_elevated_button.dart';
import 'package:sign_in/widgets/text_with_textbutton.dart';

import '../../../config.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: Config.screenHeight! * 0.02),
          Container(
            width: Config.screenWidth! * 0.9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: Config.screenWidth! * 0.9,
                height: Config.screenHeight! * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text.trim();
                      String email = _emailController.text.trim();
                      String password = _passwordController.text;
                      _authController.signUp(name, email, password);
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Config.screenWidth! * 0.05,
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextWithTextButton(
            text: 'Already have an account?',
            textButtonText: 'Sign in',
            onPressed: () => Get.offAll(() => Root()),
          ),
        ],
      ),
    );
  }
}
