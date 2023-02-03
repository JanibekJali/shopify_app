import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify_app/app/constants/colors/app_colors.dart';
import 'package:shopify_app/app/constants/decoration/app_decoration.dart';
import 'package:shopify_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shopify_app/app/presentation/widgets/auth_widgets/text_form_field_widget.dart';

import 'auth_widgets/auth_main_button_widget.dart';
import 'auth_widgets/snack_bar_widget/my_message_handler.dart';

class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({Key? key}) : super(key: key);

  @override
  _CustomerRegisterScreenState createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  dynamic _pickedImageError;
  void _pickImageFromCamera() async {
    try {
      final _pickedImage = await _picker.pickImage(
        imageQuality: 95,
        maxHeight: 300,
        maxWidth: 300,
        source: ImageSource.camera,
      );

      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      log(_pickedImageError);
    }
  }

  void _pickImageFromGallery() async {
    try {
      final _pickedImage = await _picker.pickImage(
        imageQuality: 95,
        maxHeight: 300,
        maxWidth: 300,
        source: ImageSource.gallery,
      );
      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      log(_pickedImageError);
    }
  }

  late String _name;
  late String _email;
  late String _password;
  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  void signUp() async {
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password,
          );
          Navigator.pushReplacementNamed(context, '/customer_screen');
          _formKey.currentState!.reset();
          setState(() {
            _imageFile = null;
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'The password provided is too weak.');
            log('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'The account already exists for that email.');
            log('The account already exists for that email.');
          }
        } catch (e) {
          log('$e');
        }
      } else {
        MyMessageHandler.showSnackBar(
            _scaffoldKey, 'Please pick an image first');
      }
    } else {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Sing Up text

                          Text(
                            'Sign Up ',
                            style: AppTextStyles.Bold40,
                          ),
                          // home_work black icon
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
                      children: [
                        // CircleAvatar purpleAccont
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 40,
                          ),
                          child: CircleAvatar(
                            backgroundImage: _imageFile == null
                                ? null
                                : FileImage(
                                    File(_imageFile!.path),
                                  ),
                            radius: 60,
                            backgroundColor: AppColors.purpleAccent,
                          ),
                        ),
                        Column(
                          children: [
                            // top camera icon
                            Container(
                              decoration: AppDecoration.purple15top,
                              child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.white,
                                ),
                                onPressed: () {
                                  _pickImageFromCamera();
                                  log('Pick image from camera');
                                },
                              ),
                            ),
                            SizedBox(height: 6.0),
                            // bottom camera icon
                            Container(
                              decoration: AppDecoration.purple15bottom,
                              child: IconButton(
                                icon: Icon(
                                  Icons.photo,
                                  color: AppColors.white,
                                ),
                                onPressed: () {
                                  _pickImageFromGallery();
                                  log('Pick image from gallery');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // TextFormFieldWidget
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          TextFormFieldWidget(
                            onChanged: (value) {
                              _name = value;
                              log(_name);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your full name';
                              }

                              return null;
                            },
                            keyBoardType: TextInputType.text,
                            hintText: 'Enter your full name',
                            labelText: 'Full Name',
                          ),
                          const SizedBox(height: 15.0),
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
                          SizedBox(height: 35.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'already have account?',
                                style: AppTextStyles.black16Italic,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                'Log In',
                                style: AppTextStyles.purple20Bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // already have account text

                    SizedBox(height: 55.0),
                    // Sign Up button
                    AuthMainButtonWidget(
                      mainButtonLabel: 'Sign Up',
                      onTap: () {
                        signUp();
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
