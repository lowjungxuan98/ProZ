import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgedIconButton extends StatefulWidget {
  const BadgedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.badgeValue = 0,
    this.showBadge = false,
    this.badgeColor = const Color(0xffd3af37),
    this.badgeTextColor = Colors.white,
  }) : super(key: key);
  final IconData icon;
  final Color iconColor;
  final Function()? onPressed;
  final int badgeValue;
  final bool showBadge;
  final Color badgeColor;
  final Color badgeTextColor;

  @override
  State<BadgedIconButton> createState() => _BadgedIconButtonState();
}

class _BadgedIconButtonState extends State<BadgedIconButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: widget.onPressed,
            icon: Icon(
              widget.icon,
              color: widget.iconColor,
            )),
        if (widget.badgeValue != 0 && widget.showBadge)
          Positioned(
            top: 5.h,
            right: 5.w,
            child: Container(
              padding: EdgeInsets.all(4.w),
              alignment: Alignment.center,
              height: 20.h,
              width: 20.h,
              decoration: BoxDecoration(
                color: widget.badgeColor,
                shape: BoxShape.circle, // Make it circular
              ),
              child: Text(
                widget.showBadge ? widget.badgeValue.toString() : "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.badgeTextColor,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
