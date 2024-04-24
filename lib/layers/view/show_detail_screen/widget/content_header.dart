import 'package:cached_network_image/cached_network_image.dart';
import 'package:careflix/layers/view/show_detail_screen/widget/vertical_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../../../../core/configuration/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../generated/l10n.dart';
import '../../../data/model/show.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({
    super.key,
    required this.show,
  });

  final Show show;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: SizeConfig.screenHeight * 0.55,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: show.imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator(color: Colors.red)),
          ),
        ),
        Container(
          height: SizeConfig.screenHeight * 0.55 + 5,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
                iconSize: 30.0,
                color: Colors.white,
              ),
              OutlineGradientButton(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.transparent,
                    Colors.transparent
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                strokeWidth: 1,
                padding: EdgeInsets.zero,
                radius: Radius.circular(26),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Row(
            children: [
              Expanded(
                child: VerticalIconButton(
                    icon: Icons.add,
                    title: S.of(context).list,
                    onTap: () async {}),
              ),
              _PlayButton(
                show: show,
                context: context,
              ),
              Expanded(
                child: VerticalIconButton(
                    icon: Icons.share,
                    title: S.of(context).share,
                    onTap: () => {
                          print("info"),
                        }),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  final Show show;
  final BuildContext context;
  _PlayButton({required this.show, required this.context});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(Icons.play_arrow, size: 30, color: Styles.colorTertiary),
      label: Text(S.of(context).play,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Styles.colorTertiary)),
      onPressed: () => {},
      style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
          backgroundColor: Colors.white),
    );
  }
}
