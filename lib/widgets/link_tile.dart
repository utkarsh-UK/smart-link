import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:smart_link/core/colors.dart';
import 'package:smart_link/screens/link_detail.dart';

class LinkTile extends StatelessWidget {
  final String name;
  final String link;
  final String imagePath;
  final bool isSelected;
  final bool isLast;

  const LinkTile({
    Key? key,
    this.isSelected = false,
    this.isLast = false,
    required this.name,
    required this.link,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LinkDetailScreen(
            name: name,
            link: link,
            imagePath: imagePath,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ...List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Container(
                    height: 10,
                    width: 5,
                    decoration: BoxDecoration(
                      color: isSelected ? null : borderColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: 4.0),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
              ...List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Container(
                    height: 10,
                    width: 5,
                    decoration: BoxDecoration(
                      color: isLast ? null : borderColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: !isSelected
                      ? null
                      : [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            offset: const Offset(1, 7),
                            blurRadius: 16,
                            spreadRadius: 12,
                          ),
                        ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textTheme.headline4!.copyWith(
                        color: !isSelected ? primaryColor : Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      link,
                      style: textTheme.headline5!.copyWith(
                        color: isSelected
                            ? Colors.white.withOpacity(0.6)
                            : bodyTextColor,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: isSelected
                                ? primaryDarkColor.withOpacity(0.4)
                                : primaryColor.withOpacity(0.2),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                          ),
                          icon: Icon(
                            FontAwesome.binoculars,
                            color: isSelected
                                ? Colors.white.withOpacity(0.7)
                                : primaryColor,
                            size: 20.0,
                          ),
                          label: Text(
                            '12k visitor',
                            style: textTheme.button!.copyWith(
                              color: isSelected
                                  ? Colors.white.withOpacity(0.7)
                                  : primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: isSelected
                                ? primaryDarkColor.withOpacity(0.4)
                                : primaryColor.withOpacity(0.2),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                          ),
                          icon: Icon(
                            FontAwesome.paper_plane,
                            color: isSelected
                                ? Colors.white.withOpacity(0.7)
                                : primaryColor,
                            size: 20.0,
                          ),
                          label: Text(
                            'Share',
                            style: textTheme.button!.copyWith(
                              color: isSelected
                                  ? Colors.white.withOpacity(0.7)
                                  : primaryColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
