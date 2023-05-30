import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/components/Text_Link.dart';
import 'package:plana/View/components/large_button.dart';
import 'package:plana/View/screen/Sign_up_screen.dart';
import 'package:plana/Services/firebase_methods.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:provider/provider.dart';
import '../../View-Model/sign_in_provider.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isClicked = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            child: Form(
              key: _formKey,
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
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "kelvin@email.com",
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFF2F6FF)),
                            borderRadius: BorderRadius.circular(height * 0.02),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF2F6FF),
                            ),
                            borderRadius: BorderRadius.circular(height * 0.02),
                          ),
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (inputText) {
                          return inputText!.isNotEmpty &&
                                  inputText.contains("@")
                              ? null
                              : "email address incorrect";
                        },
                      ),
                      SizedBox(
                        height: height * 0.038,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "*******",
                          suffixIcon: IconButton(
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
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFF2F6FF)),
                            borderRadius: BorderRadius.circular(height * 0.02),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF2F6FF),
                            ),
                            borderRadius: BorderRadius.circular(height * 0.02),
                          ),
                        ),
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: !context
                            .read<SignInAndOutProvider>()
                            .getPasswordVisibility,
                        validator: (String? passwordInput) {
                          return passwordInput!.isNotEmpty &&
                                  passwordInput.length < 6
                              ? "password must  contain a least 6 characters"
                              : null;
                        },
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
                            FirebaseMethods().signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                            context
                                .read<SignInAndOutProvider>()
                                .setSpinnerAction(false);
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
                              onTap: () =>
                                  Navigator.pushNamed(context, SignUpScreen.id),
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
      ),
    );
  }
}
