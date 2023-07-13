import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.action = 'View More',
  });

  final String title;
  final String action;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GlowText(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            Text(
              action,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w100),
            ),
          ],
        )
      ],
    );
  }
}
