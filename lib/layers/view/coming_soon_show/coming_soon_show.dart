import 'package:cached_network_image/cached_network_image.dart';
import 'package:careflix/core/configuration/assets.dart';
import 'package:careflix/core/configuration/styles.dart';
import 'package:careflix/core/constants.dart';
import 'package:careflix/core/ui/responsive_text.dart';
import 'package:careflix/core/utils/size_config.dart';
import 'package:careflix/layers/data/data_source/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/hero_tags.dart';
import '../../../core/ui/hero_widget.dart';
import '../../../core/ui/waiting_widget.dart';
import '../../../core/utils.dart';
import '../../../generated/l10n.dart';
import '../lists_screen/widget/movie_card.dart';

class ComingSoonShow extends StatefulWidget {
  const ComingSoonShow({super.key});

  @override
  State<ComingSoonShow> createState() => _ComingSoonShowState();
}

class _ComingSoonShowState extends State<ComingSoonShow> {
  String selectedType = S.current.all;

  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(Constants.showTypes.length + 1, (index) {
                  if (index == 0) return buildShowTypeBar(S.of(context).all);
                  String showType = Constants.showTypes[index - 1];
                  return Expanded(
                    child: buildShowTypeBar(
                      showType,
                    ),
                  );
                }),
              ),
              CommonSizes.vBiggerSpace,
              Expanded(
                child: GridView.builder(
                  itemCount: FakeData.shows.length,
                  physics: const ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      mainAxisExtent: 300.0),
                  itemBuilder: (context, index) {
                    final show = FakeData.shows[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      duration: Duration(milliseconds: 500),
                      child: SlideAnimation(
                          delay: Duration(milliseconds: 275),
                          child: Stack(
                            children: [
                              _buildImage(show.imageUrl),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.black.withOpacity(0.9),
                                      Colors.transparent
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ResponsiveText(
                                      textWidget: Text(
                                        show.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                                color: Colors.white),
                                      ),
                                    ),
                                    Text(show.releaseDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.white))
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Stack(
      children: [
        Image.asset(
          AssetsLink.FILTER_IMAGE,
          height: SizeConfig.screenHeight * 0.42,
          width: SizeConfig.screenWidth * 0.49,
          fit: BoxFit.cover,
        ),
        HeroWidget(
          tag: HeroTag.image(imageUrl, token: HeroTagTokens.movieCard),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: SizeConfig.screenHeight * 0.42,
            width: SizeConfig.screenWidth * 0.49,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget buildShowTypeBar(String showType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = showType;
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selectedType == showType
                ? Styles.colorPrimary
                : Styles.colorTertiary,
          ),
          child: Center(
              child: Text(
            showType,
            style: TextStyle(color: Colors.white),
          ))),
    );
  }
}
