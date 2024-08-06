import 'package:flutter/material.dart';

class FlexibleButton extends StatelessWidget {
  final Widget? icon;
  final String? label;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final double? width, height;
  

  const FlexibleButton({
    Key? key,
    this.icon,
    this.label,
    this.onTap,
    this.color,
    this.textColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: const  Color.fromARGB(255, 9, 33, 75),
            width: 1.0,
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null && label != null) SizedBox(width: 8),
            if (label != null) Text(
              label!,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}