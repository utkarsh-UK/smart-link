import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:smart_link/core/colors.dart';
import 'package:smart_link/widgets/custom_app_bar.dart';

const linkDetailsList = <Map<String, dynamic>>[
  {
    'name': 'URL Link',
    'link': 'Smalinl.to/887rt7rt',
    'icon': FontAwesome.link,
  },
  {
    'name': 'Promote',
    'link': 'Promote your link on the official Ngefly Instagram',
    'icon': FontAwesome.ticket,
  },
  {
    'name': 'Form Message',
    'link': 'All form messages at this link are collected here',
    'icon': FontAwesome.chat,
  },
  {
    'name': 'Setting',
    'link': 'EOS, Google Analytics, FB Pixel, UTM Parameters',
    'icon': FontAwesome.cog,
  },
];

class LinkDetailScreen extends StatelessWidget {
  final String name;
  final String link;
  final String imagePath;

  const LinkDetailScreen({
    Key? key,
    required this.name,
    required this.link,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: secondaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                  top: 25.0,
                ),
                child: CustomAppBar(),
              ),
              const SizedBox(height: 14.0),
              SizedBox(
                height: size.height * 0.4,
                width: size.width,
                child: const Image(
                  image: AssetImage('assets/images/detail_1.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.3,
                          child: Divider(
                            color: primaryColor.withOpacity(0.15),
                            thickness: 4.0,
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: linkDetailsList.length,
                          itemBuilder: (_, index) => ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.18),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Icon(
                                linkDetailsList[index]['icon'],
                                size: 30.0,
                                color: primaryColor,
                              ),
                            ),
                            title: Text(
                              linkDetailsList[index]['name'],
                              style: textTheme.headline4!.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            subtitle: Text(
                              linkDetailsList[index]['link'],
                              style: textTheme.button!.copyWith(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: borderColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
