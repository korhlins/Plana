import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/components/Text_Link.dart';
import 'package:plana/View/components/Text_fields.dart';
import 'package:plana/View/components/large_button.dart';
import 'package:plana/View/screen/Sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:plana/View-Model/sign_in_provider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ModalProgressHUD(
        inAsyncCall: context.watch<SignInAndOutProvider>().getSpinnerAction,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(height * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: height * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "Save and boost your productivity using power features",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.025,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.038,
                    ),
                    TextFields(
                      hintText: 'Email',
                      inputTextType: TextInputType.emailAddress,
                      passwordVisible: context
                          .read<SignInAndOutProvider>()
                          .getPasswordVisibility,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: height * 0.038,
                    ),
                    TextFields(
                      hintText: 'Password',
                      controller: passwordController,
                      passwordVisible: !context
                          .read<SignInAndOutProvider>()
                          .getPasswordVisibility,
                      suffixIcon: IconButton(
                        color: Colors.black26,
                        icon: Icon(context
                                .watch<SignInAndOutProvider>()
                                .getPasswordVisibility
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          context
                              .read<SignInAndOutProvider>()
                              .toggleVisibility();
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextLink(
                        text: "Forget Password?",
                        onTap: () => {},
                        decoration: TextDecoration.none),
                    SizedBox(
                      height: height * 0.038,
                    ),
                    LargeButton(
                        inputText: 'Sign in',
                        onPress: () async {
                          FocusScope.of(context).focusedChild?.unfocus();
                          context
                              .read<SignInAndOutProvider>()
                              .setSpinnerAction(true);
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                            if (user != null) {
                              context
                                  .read<SignInAndOutProvider>()
                                  .setSpinnerAction(false);
                            }
                            context
                                .read<SignInAndOutProvider>()
                                .setSpinnerAction(false);
                            Navigator.pushNamed(context, HomeScreen.id);
                          } catch (e) {
                            Navigator.pushNamed(context, SignUpScreen.id);
                            context
                                .read<SignInAndOutProvider>()
                                .setSpinnerAction(false);
                          }
                        }),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextLink(
                            text: ' sign up',
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen())),
                            decoration: TextDecoration.underline)
                      ],
                    ),
                    SizedBox(
                      height: height * 0.18,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, HomeScreen.id);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.022),
                        ),
                      ),
                    )
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
