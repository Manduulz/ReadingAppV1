import 'package:flutter/material.dart';


class ButtonWithTextAndIcon extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final String type;
  final String size;

  // Constructor to initialize the properties
  const ButtonWithTextAndIcon({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.size = 'default',
    this.type = 'default',
  });

  sizePaddingSwitch(String sizeType) {
    switch (sizeType) {
      case 'default':
        return const EdgeInsets.symmetric(horizontal: 30, vertical: 15);
      case 'small':
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    }
  }

  double sizeTextStyleSwitch(String sizeType) {
    switch (sizeType) {
      case 'default':
        return 14;
      case 'small':
        return 16;
      default:
        return 14;
    }
  }

  double sizeIconStyleSwitch(String sizeType) {
    switch (sizeType) {
      case 'large':
        return 30;
      case 'default':
        return 19;
      case 'small':
        return 15;
      default:
        return 19;
    }
  }

  styleIconColorSwitch(String styleType) {
    switch (styleType) {
      case 'primary':
        return const Color(0xFFF8FAFC);
      case 'secondary':
        return const Color(0xFF6366F1);
      case 'ghost':
        return const Color(0xFF020617);
      case 'default':
        return const Color(0xFF6366F1);
    }
  }

  styleTextSwitch(String styleType) {
    switch (styleType) {
      case 'primary':
        return TextStyle(
          color: const Color(0xFFF8FAFC),
          fontSize: sizeTextStyleSwitch(size),
        );
      case 'secondary':
        return TextStyle(
          color: const Color(0xFF6366F1),
          fontSize: sizeTextStyleSwitch(size),
        );
      case 'ghost':
        return TextStyle(
          color: const Color(0xFF020617),
          fontSize: sizeTextStyleSwitch(size),
        );
      case 'default':
        return TextStyle(
          color: const Color(0xFF6366F1),
          fontSize: sizeTextStyleSwitch(size),
        );
    }
  }

  styleButtonSwitch(String styleType) {
    switch (styleType) {
      case 'primary':
        return TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: sizePaddingSwitch(size),
            disabledBackgroundColor: const Color(0xFFE0E7FF),
            backgroundColor: const Color(0xFF6366F1));
      case 'secondary':
        return TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: sizePaddingSwitch(size),
            disabledBackgroundColor: const Color(0xFFE0E7FF),
            backgroundColor: const Color(0xFFE0E7FF));
      case 'ghost':
        return TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: sizePaddingSwitch(size),
            disabledBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent);
      case 'default':
        return TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: sizePaddingSwitch(size),
            disabledBackgroundColor: const Color(0xFFF8FAFC),
            backgroundColor: const Color(0xFFF8FAFC));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: styleButtonSwitch(type),
      child: icon != null
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,
              size: sizeIconStyleSwitch(size),
              color: styleIconColorSwitch(type)),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: styleTextSwitch(type),
          )
        ],
      )
          : Text(
        text,
        style: styleTextSwitch(type),
      ),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String type;
  final String size;

  // Constructor to initialize the properties
  const ButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = 'default',
    this.type = 'default',
  });

  sizePaddingSwitch(String sizeType) {
    switch (sizeType) {
      case 'large':
        return const EdgeInsets.all(20);
      case 'default':
        return const EdgeInsets.all(10);
      case 'small':
        return const EdgeInsets.all(10);
    }
  }

  double sizeIconStyleSwitch(String sizeType) {
    switch (sizeType) {
      case 'large':
        return 30;
      case 'default':
        return 19;
      case 'small':
        return 20;
      default:
        return 19;
    }
  }

  styleIconColorSwitch(String styleType) {
    switch (styleType) {
      case 'primary':
        return const Color(0xFFF8FAFC);
      case 'secondary':
        return const Color(0xFF6366F1);
      case 'ghost':
        return const Color(0xFF020617);
      case 'default':
        return const Color(0xFF6366F1);
    }
  }

  styleButtonSwitch(String styleType) {
    switch (styleType) {
      case 'primary':
        return BoxDecoration(
            shape: BoxShape.circle,

            // disabledBackgroundColor: ,
            color: onPressed == null
                ? const Color(0xFFE0E7FF)
                : const Color(0xFF6366F1));
      case 'secondary':
        return BoxDecoration(
            shape: BoxShape.circle,

            // disabledBackgroundColor: ,
            color: onPressed == null
                ? const Color(0xFFE0E7FF)
                : const Color(0xFFE0E7FF));
      case 'ghost':
        return BoxDecoration(
            shape: BoxShape.circle,

            // disabledBackgroundColor: ,
            color: onPressed == null ? Colors.transparent : Colors.transparent);
      case 'default':
        return BoxDecoration(
            shape: BoxShape.circle,
            // disabledBackgroundColor: ,
            color: onPressed == null
                ? const Color(0xFFF8FAFC)
                : const Color(0xFFF8FAFC));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      onTap: onPressed,
      // style: styleButtonSwitch(type),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: sizePaddingSwitch(size),
        decoration: styleButtonSwitch(type),
        child: Icon(icon,
            size: sizeIconStyleSwitch(size), color: styleIconColorSwitch(type)),
      ),
    );
  }
}
