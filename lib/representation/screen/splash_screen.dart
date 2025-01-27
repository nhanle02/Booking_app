import 'package:booking_app_source/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_source/core/helpers/asset_helper.dart';
import 'package:booking_app_source/core/helpers/image_helper.dart';
import 'package:booking_app_source/core/helpers/local_storage_helper.dart';
import 'package:booking_app_source/representation/screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _routeToIntroScreen();
  }

  void _routeToIntroScreen() async {
    final ignoreIntro = LocalStorageHelper.getValue('ignoreIntro') as bool?;
    await Future.delayed(const Duration(milliseconds: 1000));
    if (ignoreIntro ?? false) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginOrRegister()));
    } else {
      LocalStorageHelper.setValue('ignoreIntro', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.backgroundSplash,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.circleSplash,
          ),
        ),
      ],
    );
  }
}
