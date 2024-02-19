import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CenterRightActionButton extends StatelessWidget {
  const CenterRightActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          PhosphorIcons.bookmark_simple,
          size: 28,
        ),
      ),
    );
  }
}
