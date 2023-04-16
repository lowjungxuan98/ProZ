import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({
    Key? key,
    required this.label,
    this.fontColor,
  }) : super(key: key);
  final String label;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty_search.png'),
          Text(
            label,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: fontColor ?? const Color(0xff7f7f7f),
            ),
          ),
        ],
      ),
    );
  }
}
