import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils/image_constant.dart';

class CustomAnimatedBottomBar extends StatelessWidget {

  CustomAnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  }) : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   if (showElevation)
        //     const BoxShadow(
        //       color: Colors.black12,
        //       blurRadius: 2,
        //     ),
        // ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 5),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            elevation: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              height: containerHeight,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                children: items.map((item) {
                  var index = items.indexOf(item);
                  return GestureDetector(
                    onTap: () => onItemSelected(index),
                    child: _ItemWidget(
                      item: item,
                      iconSize: iconSize,
                      isSelected: index == selectedIndex,
                      backgroundColor: bgColor,
                      itemCornerRadius: itemCornerRadius,
                      animationDuration: animationDuration,
                      curve: curve,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 50 : 50,
        //width: 50,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:isSelected? item.activeColor:backgroundColor,
          //isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? 50 : 50,
            child: item.image,

            // child: Row(
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     IconTheme(
            //       data: IconThemeData(
            //         size: iconSize,
            //         color: isSelected
            //             ? item.activeColor.withOpacity(1)
            //             : item.inactiveColor == null
            //             ? item.activeColor
            //             : item.inactiveColor,
            //       ),
            //       child: item.icon,
    ),)));
                // if (isSelected)
                //   Expanded(
                //     child: Container(
                //       padding: EdgeInsets.symmetric(horizontal: 4),
                //       child: DefaultTextStyle.merge(
                //         style: TextStyle(
                //           color: item.activeColor,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         maxLines: 1,
                //         textAlign: item.textAlign,
                //         child: item.title,
                //       ),
                //     ),
                //   ),
         //     ],
          //  ),
       //   ),
    //    ),
     // ),
    //);
  }
}
class BottomNavyBarItem {

  BottomNavyBarItem({
    required this.image,
    required this.title,
    this.activeColor = Colors.deepOrange,
    this.textAlign,
    this.inactiveColor,
  });

  final Image image;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;

}