import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/components/Text_Link.dart';
import 'package:plana/View/components/Text_fields.dart';
import 'package:plana/View/components/large_button.dart';
import 'package:plana/View/screen/sign_in_screen.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool passwordVisible = true;
  bool showSpinner = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(height * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CircleAvatar(
                    radius: height * 0.1,
                  ),
                  TextFields(
                    hintText: 'Username',
                    passwordVisible: false,
                    controller: usernameController,
                  ),
                  SizedBox(
                    height: height * 0.038,
                  ),
                  TextFields(
                    hintText: 'Email',
                    passwordVisible: false,
                    inputTextType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: height * 0.038,
                  ),
                  TextFields(
                    hintText: 'password',
                    controller: passwordController,
                    passwordVisible: passwordVisible,
                    suffixIcon: IconButton(
                      color: Colors.black26,
                      icon: Icon(passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.038,
                  ),
                  LargeButton(
                    inputText: 'Create account',
                    onPress: () async {
                      FocusScope.of(context).focusedChild?.unfocus();
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        if (newUser != null) {
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        Navigator.pushNamed(context, SignUpScreen.id);
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      TextLink(
                          text: ' sign in',
                          onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()))
                              },
                          decoration: TextDecoration.underline)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
