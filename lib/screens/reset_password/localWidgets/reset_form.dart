import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in/controller/auth_controller.dart';
import 'package:sign_in/widgets/rounded_elevated_button.dart';
import 'package:sign_in/widgets/rounded_text_formfield.dart';

import '../../../config.dart';

class ResetForm extends StatelessWidget {
  const ResetForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();

    final _authController = Get.find<AuthController>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          RoundedTextFormField(
            hintText: 'Email',
            controller: _emailController,
            validator: (value) {
              bool _isEmailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);
              if (!_isEmailValid) {
                return 'Invalid email.';
              }
              return null;
            },
          ),
          SizedBox(height: Config.screenHeight! * 0.03),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              width: Config.screenWidth! * 0.9,
              height: Config.screenHeight! * 0.07,
              child: ElevatedButton(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _authController.resetPassword(_emailController.text.trim());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
