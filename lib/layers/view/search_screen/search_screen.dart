import 'package:careflix/core/configuration/assets.dart';
import 'package:careflix/core/configuration/styles.dart';
import 'package:careflix/core/routing/route_path.dart';
import 'package:careflix/l10n/local_provider.dart';
import 'package:careflix/layers/data/data_source/fake_data.dart';
import 'package:careflix/layers/view/lists_screen/widget/movie_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../generated/l10n.dart';
import '../../data/model/show.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonSizes.vBiggerSpace,
              Container(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        textDirection:
                            Provider.of<LocaleProvider>(context, listen: false)
                                        .locale
                                        .languageCode !=
                                    'ar'
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                        textAlign:
                            Provider.of<LocaleProvider>(context, listen: false)
                                        .locale
                                        .languageCode !=
                                    'ar'
                                ? TextAlign.left
                                : TextAlign.right,
                        decoration: InputDecoration(
                            hintText: S.of(context).search,
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                    CommonSizes.hSmallSpace,
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(RoutePaths.FilterSearch),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Styles.colorPrimary)),
                        child: Center(
                          child: SvgPicture.asset(
                            AssetsLink.FILTER_IMAGE,
                            width: 25,
                            height: 25,
                            colorFilter: ColorFilter.mode(
                                Styles.colorPrimary, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CommonSizes.vBiggerSpace,
              Expanded(
                child: AnimationLimiter(
                  child: GridView.builder(
                      physics: const ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          mainAxisExtent: 300.0),
                      itemCount: FakeData.shows.length,
                      itemBuilder: (context, index) {
                        Show show = FakeData.shows[index];
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: 2,
                          duration: Duration(milliseconds: 500),
                          child: SlideAnimation(
                            delay: Duration(milliseconds: 275),
                            child: MovieCard(
                              show: show,
                              withShadow: false,
                              withMargin: false,
                              radius: 0,
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
