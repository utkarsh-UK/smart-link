import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smart_link/widgets/bubble.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _containerBoxAnimation;
  late Animation<double> _firstBubbleAnimation;
  late Animation<double> _secondBubbleAnimation;
  late Animation<double> _thirdBubbleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _containerBoxAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0, 0.300, curve: Curves.easeOutCubic),
    ))
          ..addListener(() {
            setState(() {});
          });

    _firstBubbleAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.320, 0.450, curve: Curves.easeOutCubic),
    ))
          ..addListener(() {
            setState(() {});
          });

    _secondBubbleAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.450, 0.620, curve: Curves.easeOutCubic),
    ))
          ..addListener(() {
            setState(() {});
          });

    _thirdBubbleAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.620, 0.790, curve: Curves.easeOutCubic),
    ))
          ..addListener(() {
            setState(() {});
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height * 0.55,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Stack(
          children: [
            // first text box container
            ScaleAnimation(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOutCubic,
              scale: _containerBoxAnimation.value,
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 600),
                child: AnimatedContainer(
                  width: size.width * 0.6,
                  duration: const Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(2, 4),
                        blurRadius: 6.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 18.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Smart link',
                                  style: textTheme.headline3),
                              TextSpan(
                                text:
                                    '\n\nMake your url look elegent and clean',
                                style: textTheme.bodyText2!.copyWith(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        top: -10,
                        right: -20,
                        child: FadeInAnimation(
                          duration: Duration(milliseconds: 600),
                          delay: Duration(milliseconds: 600),
                          child: Bubble(icon: Icons.link),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // first bubble
            Positioned(
              bottom: 100.0,
              left: 50.0,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                scale: _firstBubbleAnimation.value,
                delay: const Duration(seconds: 1),
                child: const Bubble(icon: Icons.sports_basketball_outlined),
              ),
            ),
            //second bubble
            Positioned(
              top: 120.0,
              right: 10.0,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                scale: _secondBubbleAnimation.value,
                delay: const Duration(seconds: 2),
                child: const Bubble(icon: Icons.sports_basketball_outlined),
              ),
            ),
            //third bubble
            Positioned(
              bottom: 50.0,
              right: 30.0,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                scale: _thirdBubbleAnimation.value,
                delay: const Duration(seconds: 3),
                child: const Bubble(
                  icon: Icons.sports_basketball_outlined,
                  size: BubbleSize.small,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
