import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:run_way/Features/home/presentation/views/HomeView.dart';
import 'package:run_way/Core/utils/appText.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }


  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/logo.png'),
       const SizedBox(height: 10,),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context,_) {
            return SlideTransition(
                position: slidingAnimation,
                child: AppText(
                  text: 'Read Free Books',
                  fontSize: 18,
                  fontFamily: 'fredoka',
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,)

            );
          } )
      ],
    );
  }

//Sliding Animation
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation=
        Tween<Offset>(begin:const Offset(0, 4),end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }



  void navigateToHome() {
    Future.delayed(Duration(seconds: 3),(){
      // Get.to(()=> Homeview(),
      //     transition: Transition.rightToLeft,
      //     duration: Duration(microseconds: 250));
      GoRouter.of(context).push('/homeView');
    });
  }


}
