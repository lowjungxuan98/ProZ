import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProZTabBarView extends StatefulWidget {
  const ProZTabBarView({
    Key? key,
    required this.labels,
    required this.pages,
    this.onTap,
    this.onPageChanged,
    this.selectedColor = const Color(0xffd3af37),
    this.unselectColor = const Color(0xff7f7f7f),
  }) : super(key: key);
  final List<String> labels;
  final List<Widget> pages;
  final Function(int)? onTap, onPageChanged;
  final Color? selectedColor, unselectColor;

  @override
  State<ProZTabBarView> createState() => _ProZTabBarViewState();
}

class _ProZTabBarViewState extends State<ProZTabBarView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.labels.length);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      if (widget.onPageChanged != null) widget.onPageChanged!(_selectedIndex);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> myTabs = List.generate(widget.labels.length, (index) => Tab(text: widget.labels[index]));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
          indicatorWeight: 3,
          indicatorColor: widget.selectedColor,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: const EdgeInsets.all(10),
          labelPadding: EdgeInsets.only(top: 0.h, bottom: 5.h),
          labelColor: widget.selectedColor,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          unselectedLabelColor: widget.unselectColor,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          controller: _tabController,
          tabs: myTabs,
          onTap: widget.onTap,
        ),
        Expanded(
          child: Container(
            width: 1.sw,
            margin: EdgeInsets.symmetric(horizontal: 7.w),
            decoration: BoxDecoration(
              color: const Color(0xfff4f4f4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: TabBarView(
              controller: _tabController,
              children: widget.pages,
            ),
          ),
        ),
      ],
    );
  }
}
