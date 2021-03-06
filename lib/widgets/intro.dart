import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smart_link/widgets/bubble.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  // animation controller
  late AnimationController _animationController;

  // animations
  late Animation<double> _containerBoxAnimation;
  late Animation<double> _firstBubbleAnimation;
  late Animation<double> _secondBubbleAnimation;
  late Animation<double> _thirdBubbleAnimation;

  // device variables
  late Size size;
  late TextTheme textTheme;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _containerBoxAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0, 0.300, curve: Curves.easeOutCubic),
    ));

    _firstBubbleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.300, 0.600, curve: Curves.easeOutCubic),
    ));

    _secondBubbleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.550, 0.750, curve: Curves.easeOutCubic),
    ));

    _thirdBubbleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.8, 1.0, curve: Curves.easeOutCubic),
    ));

    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    textTheme = Theme.of(context).textTheme;

    return AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return SizedBox(
            height: size.height * 0.55,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Stack(
                children: [
                  // first text box container
                  _buildTopContainer(),
                  // first bubble
                  _buildFirstBubble(),
                  //second bubble
                  _buildSecondBubble(),
                  //third bubble
                  _buildThirdBubble(),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  /// Builder Functions
  ///
  ///
  Widget _buildTopContainer() => Transform.scale(
        scale: _containerBoxAnimation.value,
        alignment: Alignment.center,
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
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Smart link', style: textTheme.headline3),
                        TextSpan(
                          text: '\n\nMake your url look elegent and clean',
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
      );

  Widget _buildFirstBubble() => Positioned(
        bottom: 100.0,
        left: 50.0,
        child: Transform.scale(
          scale: _firstBubbleAnimation.value,
          alignment: Alignment.center,
          child: const Bubble(icon: Icons.sports_baseball_outlined),
        ),
      );

  Widget _buildSecondBubble() => Positioned(
        top: 120.0,
        right: 10.0,
        child: Transform.scale(
          scale: _secondBubbleAnimation.value,
          alignment: Alignment.center,
          child: const Bubble(icon: Icons.sports_baseball_outlined),
        ),
      );

  Widget _buildThirdBubble() => Positioned(
        bottom: 50.0,
        right: 30.0,
        child: Transform.scale(
          scale: _thirdBubbleAnimation.value,
          alignment: Alignment.center,
          child: const Bubble(icon: Icons.sports_baseball_outlined),
        ),
      );
}
