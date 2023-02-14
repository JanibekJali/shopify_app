import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';
import 'package:shopify_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shopify_app/app/presentation/widgets/auth_widgets/text_form_field_widget.dart';

import 'auth_widgets/auth_main_button_widget.dart';
import 'auth_widgets/have_account_widget.dart';
import 'auth_widgets/snack_bar_widget/my_message_handler.dart';

class SuppliersLogin extends StatefulWidget {
  const SuppliersLogin({Key? key}) : super(key: key);

  @override
  _SuppliersLoginState createState() => _SuppliersLoginState();
}

class _SuppliersLoginState extends State<SuppliersLogin> {
  late String _email;
  late String _password;
  bool processing = false;
  bool passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  CollectionReference suppliers =
      FirebaseFirestore.instance.collection('suppliers');
  void logIn() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        _formKey.currentState!.reset();
        Navigator.pushReplacementNamed(context, '/supplier_home_screen');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          MyMessageHandler.showSnackBar(
              _scaffoldKey, 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          MyMessageHandler.showSnackBar(
              _scaffoldKey, 'Wrong password provided for that user.');
        }
      }
    } else {
      setState(() {
        processing = false;
      });
      log('not valid');
      MyMessageHandler.showSnackBar(_scaffoldKey, 'Not Valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Log In ',
                            style: AppTextStyles.Bold40,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/welcome_screen');
                            },
                            icon: Icon(
                              Icons.home_work,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 100),
                      child: Column(
                        children: [
                          TextFormFieldWidget(
                              onChanged: (value) {
                                _email = value;
                                log(_email);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your email';
                                } else if (value.isValidEmail() == false) {
                                  return 'invalid email';
                                } else if (value.isValidEmail() == true) {
                                  return null;
                                }
                                return null;
                              },
                              keyBoardType: TextInputType.emailAddress,
                              hintText: 'Enter your email',
                              labelText: 'Email'),
                          const SizedBox(height: 15.0),
                          TextFormFieldWidget(
                            onChanged: (value) {
                              _password = value;
                              log(_password);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your password';
                              }

                              return null;
                            },
                            keyBoardType: TextInputType.number,
                            obscureText: passwordVisible
                                ? passwordVisible = false
                                : passwordVisible = true,
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            widget: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = passwordVisible;
                                });
                              },
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, right: 200, left: 0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget Password?',
                                style: AppTextStyles.black18Italic,
                              ),
                            ),
                          ),
                          SizedBox(height: 35.0),
                          HaveAccountWidget(
                            haveAccount: 'Don\'t Have Account? ',
                            actionLabel: 'Sign Up',
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/supplier_signup');
                            },
                          ),
                        ],
                      ),
                    ),
                    processing == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.purple,
                            ),
                          )
                        : AuthMainButtonWidget(
                            mainButtonLabel: 'Log In',
                            onTap: () {
                              logIn();
                            },
                          ),
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\. ])([a-zA-Z]{2,3})$')
        .hasMatch(this);
  }
}
