import 'package:flutter/material.dart';
import 'package:sign_in/widgets/hero_title.dart';
import 'package:sign_in/widgets/rounded_text_formfield.dart';

import '../../config.dart';
import 'localWidgets/sign_up_buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Column(
                  children: [
                    HeroTitle(
                      title: 'Vision onWay',
                      subtitle: 'Fitness application....',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RoundedTextFormField(
                      controller: _nameController,
                      hintText: 'Name',
                      validator: (value) {
                        if (value.toString().length <= 2) {
                          return 'Enter valid name.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RoundedTextFormField(
                      controller: _emailController,
                      hintText: 'Email',
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
                    SizedBox(
                      height: 10.0,
                    ),
                    RoundedTextFormField(
                      controller: _passwordController,
                      obsecureText: true,
                      hintText: 'Password',
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return 'Password should be longer or equal to 6 characters.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RoundedTextFormField(
                      obsecureText: true,
                      hintText: 'Confirm Password',
                      validator: (value) {
                        if (value.trim() != _passwordController.text.trim()) {
                          return 'Passwords does not match!';
                        }
                        return null;
                      },
                    ),
                    SignUpButtons(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
