import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';
import 'package:plana/View/components/Text_Link.dart';
import 'package:plana/View/components/Text_fields.dart';
import 'package:plana/View/components/large_button.dart';
import 'package:plana/View/screen/sign_in_screen.dart';
import 'package:plana/View/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:plana/View-Model/sign_in_provider.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ModalProgressHUD(
        inAsyncCall: context.watch<SignInAndOutProvider>().getSpinnerAction,
        child: SafeArea(
          child: Form(
            key: _formKey,
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
                        return inputText!.isNotEmpty && inputText.contains("@")
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
                      height: height * 0.038,
                    ),
                    LargeButton(
                      inputText: 'Create account',
                      onPress: () async {
                        FocusScope.of(context).focusedChild?.unfocus();
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
      ),
    );
  }
}
