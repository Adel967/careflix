import 'package:animate_do/animate_do.dart';
import 'package:careflix/layers/view/auth/widgets/animated_background.dart';
import 'package:careflix/layers/view/auth/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

import '../../../core/configuration/styles.dart';
import '../../../core/routing/route_path.dart';
import '../../../core/validators/validators.dart';
import '../../../generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedBackground(),
            Positioned(
              top: 30,
              left: 15,
              child: IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: Styles.colorSecondary.withOpacity(0.4)),
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back),
                iconSize: 30,
              ),
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: FadeInDown(
                  duration: Duration(milliseconds: 1500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).signup,
                        style: TextStyle(
                            color: Styles.colorPrimary,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      CommonSizes.vBiggestSpace,
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text != null) {
                                if (!Validators.isNotEmptyString(text)) {
                                  return S.of(context).fill_all_fields;
                                }
                                if (!Validators.isValidEmail(text)) {
                                  return S.of(context).invalidEmail;
                                }
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: S.of(context).email,
                                prefixIcon: Icon(Icons.email)),
                          ),
                          CommonSizes.vSmallSpace,
                          TextFormField(
                            controller: _password,
                            keyboardType: TextInputType.text,
                            validator: (text) {
                              if (text != null) {
                                if (!Validators.isNotEmptyString(text)) {
                                  return S.of(context).fill_all_fields;
                                }
                                if (!Validators.isValidPassword(text)) {
                                  return S.of(context).invalidPassword;
                                }
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(fontSize: 16),
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: S.of(context).password,
                                prefixIcon: Icon(Icons.lock)),
                          ),
                          CommonSizes.vSmallSpace,
                          TextFormField(
                            controller: _confirmPassword,
                            keyboardType: TextInputType.text,
                            validator: (text) {
                              if (text != null) {
                                if (!Validators.isNotEmptyString(text)) {
                                  return S.of(context).fill_all_fields;
                                }
                                if (text != _password.text) {
                                  return S
                                      .of(context)
                                      .confirmationPasswordError;
                                }
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(fontSize: 16),
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: S.of(context).confirm_password,
                                prefixIcon: Icon(Icons.lock)),
                          ),
                        ],
                      )),
                      CommonSizes.vLargeSpace,
                      GestureDetector(
                        onTap: () {},
                        child: GradientButton(
                          title: S.of(context).signup,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
