import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smart_link/widgets/custom_app_bar.dart';
import 'package:smart_link/widgets/custom_bottom_bar.dart';
import 'package:smart_link/widgets/gradient_background.dart';
import 'package:smart_link/widgets/link_tile.dart';

const usersList = <Map<String, String>>[
  {
    'name': 'Elia Smith',
    'link': 'Smalinl.to/887rt7rt',
    'image': 'profile_1.png',
  },
  {
    'name': 'Freed Basten',
    'link': 'Smalinl.to/887rt7rt',
    'image': 'profile_2.png',
  },
  {
    'name': 'Jhon Leman',
    'link': 'Smalinl.to/887rt7rt',
    'image': 'profile_3.png',
  },
  {
    'name': 'Elia Smith',
    'link': 'Smalinl.to/887rt7rt',
    'image': 'profile_2.png',
  },
  {
    'name': 'Elia Smith',
    'link': 'Smalinl.to/887rt7rt',
    'image': 'profile_1.png',
  },
];

class LinksScreen extends StatelessWidget {
  const LinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: GradientBackgroud(
        child: SafeArea(
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 300),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 80.0,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 20.0,
                        left: 20.0,
                        top: 25.0,
                      ),
                      child: CustomAppBar(isHomeScreen: true),
                    ),
                    const SizedBox(height: 14.0),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20.0,
                        left: 20.0,
                        top: 25.0,
                        bottom: 20.0,
                      ),
                      child: Text(
                        'Create a\nclickable link in bio',
                        style: textTheme.headline2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: AnimationLimiter(
                        child: Column(
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 800),
                            delay: const Duration(milliseconds: 600),
                            childAnimationBuilder: (widget) => ScaleAnimation(
                              duration: const Duration(milliseconds: 600),
                              delay: const Duration(milliseconds: 500),
                              child: FadeInAnimation(child: widget),
                            ),
                            children: List<Widget>.generate(
                              5,
                              (index) => LinkTile(
                                name: usersList[index]['name']!,
                                link: usersList[index]['link']!,
                                imagePath:
                                    'assets/images/${usersList[index]['image']}',
                                isSelected: index == 0,
                                isLast: index == 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
