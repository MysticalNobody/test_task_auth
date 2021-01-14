import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AppNumberButton extends StatelessWidget {
  const AppNumberButton({
    @required this.number,
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);
  final int number;
  final String text;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(number),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 14),
        child: Container(
          width: MediaQuery.of(context).size.width * window.devicePixelRatio <= 340
              ? MediaQuery.of(context).size.width * .145
              : MediaQuery.of(context).size.width * .2,
          height: MediaQuery.of(context).size.width * window.devicePixelRatio <= 340
              ? MediaQuery.of(context).size.width * .145
              : MediaQuery.of(context).size.width * .2,
          decoration:
              const BoxDecoration(color: AppColors.greyLight, shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoSizeText(
                number.toString(),
                minFontSize:
                    MediaQuery.of(context).size.width * window.devicePixelRatio < 650
                        ? 24
                        : 36,
                maxFontSize: 36,
                style: AppStyles.text,
              ),
              if (text != null)
                AutoSizeText(
                  text,
                  minFontSize: 8,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  maxFontSize:
                      MediaQuery.of(context).size.width * window.devicePixelRatio < 650
                          ? 9
                          : 12,
                  style: AppStyles.text,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
