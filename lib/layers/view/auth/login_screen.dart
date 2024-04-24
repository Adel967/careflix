import 'package:animate_do/animate_do.dart';
import 'package:careflix/core/configuration/styles.dart';
import 'package:careflix/core/routing/route_path.dart';
import 'package:careflix/core/validators/validators.dart';
import 'package:careflix/layers/view/auth/widgets/animated_background.dart';
import 'package:careflix/layers/view/auth/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

import '../../../core/configuration/assets.dart';
import '../../../generated/l10n.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedBackground(),
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
                        S.of(context).login,
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
                        ],
                      )),
                      CommonSizes.vLargeSpace,
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RoutePaths.SetUpProfileScreen, (route) => false);
                        },
                        child: GradientButton(
                          title: S.of(context).login,
                        ),
                      ),
                      CommonSizes.vSmallSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).no_account,
                            style: TextStyle(fontSize: 17),
                          ),
                          CommonSizes.hSmallSpace,
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(RoutePaths.SignUp),
                            child: Text(
                              S.of(context).signup,
                              style: TextStyle(
                                  color: Styles.colorPrimary,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
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
