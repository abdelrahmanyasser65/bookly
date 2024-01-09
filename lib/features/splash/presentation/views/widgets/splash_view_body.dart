import 'package:abookly/features/splash/presentation/views/widgets/slide_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/resources/app_router.dart';
import '../../../../../core/resources/constants.dart';
import '../../../../../core/resources/images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation <Offset>slidingAnimation;

  @override
  void initState() {

    super.initState();
    initSlideAnimation();
    navigateToHome();
  }


  @override
  void dispose() {
   animationController.dispose();

    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          AppImages.logo,
          height: 7.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        SlideText(slidingAnimation: slidingAnimation),
      ],
    );
  }
  void initSlideAnimation() {
    animationController=AnimationController(vsync:this,
        duration:const Duration(seconds: 1));
    slidingAnimation=Tween<Offset>(
      begin:const Offset(0,10) ,
      end:Offset.zero ,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHome(){
    Future.delayed(AppConstants.splashDelay,(){
      GoRouter.of(context).push(AppRouter.rHomeView);
    });
  }
}
