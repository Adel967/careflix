import 'dart:io';
import 'package:careflix/core/configuration/assets.dart';
import 'package:careflix/core/configuration/styles.dart';
import 'package:careflix/core/routing/route_path.dart';
import 'package:careflix/core/shared_preferences/shared_preferences_instance.dart';
import 'package:careflix/core/utils/size_config.dart';
import 'package:careflix/l10n/local_provider.dart';
import 'package:careflix/layers/logic/splash__provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/shared_preferences/shared_preferences_key.dart';
import '../../../injection_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  getData() {
    Future.delayed(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      sl<SplashProvider>().closeSplash(user);
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation =
        ColorTween(begin: Styles.colorPrimary, end: Styles.backgroundColor)
            .animate(_animationController);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    getData();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: _animation.value,
        body: Center(
          child: Image.asset(AssetsLink.APP_LOGO),
        ));
  }
}
