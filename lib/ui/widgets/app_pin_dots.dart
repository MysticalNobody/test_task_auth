import 'package:flutter/material.dart';

import '../theme/theme.dart';

class PinDots extends StatelessWidget {
  const PinDots({
    @required this.count,
    Key key,
    this.color,
  }) : super(key: key);
  final int count;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: color ?? (index + 1 <= count ? AppColors.primary : AppColors.grey),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
