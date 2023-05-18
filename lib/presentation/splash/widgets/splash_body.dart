import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/constants/app_assets.dart';
import 'package:flutter_jsonplaceholder/app/routing/routes.dart';
import 'package:flutter_jsonplaceholder/app/utils/extensions/app_context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../app/utils/extensions/spaces.dart';
import '../../../app/widgets/custom_svg_visual.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _animation =
        Tween<Offset>(begin: const Offset(0, 1.5), end: const Offset(0, 0))
            .animate(
      _animationController,
    );

    _animationController.forward();

    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacement(homeRoute),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
                position: _animation,
                child: CustomSvgVisual(
                  iconPath: AppAssets.logo,
                  width: 280.w,
                  boxFit: BoxFit.fill,
                )),
            20.vSpace,
            SlideTransition(
              position: _animation,
              child: Text('SAVE NOTES FOR QUICK ACCESS',
                  style: context.appTextTheme.bodySmall!
                      .copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
