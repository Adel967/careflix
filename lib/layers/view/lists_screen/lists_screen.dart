import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:careflix/core/configuration/styles.dart';
import 'package:careflix/core/constants.dart';
import 'package:careflix/core/hero_tags.dart';
import 'package:careflix/core/ui/gradient_text.dart';
import 'package:careflix/core/utils.dart';
import 'package:careflix/core/utils/size_config.dart';
import 'package:careflix/layers/data/data_source/fake_data.dart';
import 'package:careflix/layers/view/lists_screen/widget/animated_list_view.dart';
import 'package:careflix/layers/view/lists_screen/widget/heading_widget.dart';
import 'package:careflix/layers/view/lists_screen/widget/movie_card.dart';
import 'package:careflix/layers/view/lists_screen/widget/show_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/ui/gradient_bg.dart';
import '../../../generated/l10n.dart';
import '../../data/model/show.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  late final _topMoviesPageController;
  late final _trendingPageController;
  ScrollController _listViewController = ScrollController();

  _selectedTrendingPage(int index) {
    final show = FakeData.shows[index];
    return AnimatedBuilder(
      animation: _trendingPageController,
      builder: (context, widget) {
        double value = 1;
        if (_trendingPageController.position.haveDimensions) {
          value = (_trendingPageController.page! - index);
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * SizeConfig.screenHeight * 0.42,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: MovieCard(
        show: show,
        radius: 40,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topMoviesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
    _trendingPageController = PageController(
        initialPage: (FakeData.shows.length / 2).floor(),
        viewportFraction: 0.55,
        keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
          ),
          GradientBackground(),
          Positioned.fill(
              child: ListView(
            shrinkWrap: true,
            controller: _listViewController,
            children: [
              Center(
                child: GradientText(Constants.appName,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    gradient: LinearGradient(colors: [
                      Styles.ColorGradient1,
                      Styles.ColorGradient2
                    ])),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.5,
                child: PageView.builder(
                  controller: _topMoviesPageController,
                  itemCount: FakeData.shows.length,
                  itemBuilder: (context, index) {
                    final show = FakeData.shows[index];
                    return AnimatedListItem(show: show);
                  },
                ),
              ),
              HeadingWidget(
                title: S.of(context).trending,
                child: SizedBox(
                  height: SizeConfig.screenHeight * 0.43,
                  width: SizeConfig.screenWidth,
                  child: PageView.builder(
                    controller: _trendingPageController,
                    itemCount: FakeData.shows.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _selectedTrendingPage(index);
                    },
                  ),
                ),
              ),
              HeadingWidget(
                  title: S.of(context).myList,
                  child: ShowList(
                    shows: FakeData.shows,
                    isOriginals: true,
                    token: HeroTagTokens.myList,
                  )),
              CommonSizes.vBiggerSpace,
              HeadingWidget(
                  title: S.of(context).movies,
                  child: ShowList(
                    shows: FakeData.shows,
                    token: HeroTagTokens.movies,
                  )),
              CommonSizes.vBiggerSpace,
              HeadingWidget(
                  title: S.of(context).series,
                  child: ShowList(
                    shows: FakeData.shows,
                    token: HeroTagTokens.series,
                  )),
              CommonSizes.vBiggerSpace,
              HeadingWidget(
                  title: S.of(context).series,
                  child: ShowList(
                    shows: FakeData.shows,
                    token: HeroTagTokens.series,
                  )),
            ],
          ))
        ],
      ),
    );
  }
}
