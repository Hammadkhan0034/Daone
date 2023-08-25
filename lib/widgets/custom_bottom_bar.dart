import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgIconlycurvedhome,
      activeIcon: ImageConstant.imgIconlycurvedhome,
      type: BottomBarEnum.Iconlycurvedhome,
      route: AppRoutes.homeScreen,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgMenu,
      activeIcon: ImageConstant.imgMenu,
      type: BottomBarEnum.Menu,
      route: AppRoutes.viewAllTaskTabContainerScreen
    ),
    BottomMenuModel(
      icon: ImageConstant.imgBiplus,
      activeIcon: ImageConstant.imgBiplus,
      type: BottomBarEnum.Biplus,
      route: AppRoutes.selectTaskScreen,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCheckmarkIndigo100,
      activeIcon: ImageConstant.imgCheckmarkIndigo100,
      type: BottomBarEnum.Checkmarkindigo100,
      route: AppRoutes.statsScreen
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUserDeepOrangeA20001,
      activeIcon: ImageConstant.imgUserDeepOrangeA20001,
      type: BottomBarEnum.Userdeeporangea20001,
      route: AppRoutes.accountSettingScreen,
    )
  ];
  // void onTapBtnGetStarted() {
  //   Get.toNamed(AppRoutes.loginPageScreen);
  // }

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        100,
      ),
      margin: getMargin(
        left: 30,
        right: 29,
      ),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            37,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.deepOrangeA20001.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              5,
            ),
          ),
        ],
      ),
      child: Center(
        child: Obx(
          () => BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                icon: CustomImageView(
                  svgPath: bottomMenuList[index].icon,
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          //showUnselectedLabels: false,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getSize(
                  24,
                ),
                width: getSize(
                  24,
                ),
                color: appTheme.indigo100,
              ),
              activeIcon: Container(
                padding: getPadding(
                  all: 11,
                ),
                decoration: AppDecoration.fill9.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder25,
                ),
                child: CustomImageView(
                  svgPath: bottomMenuList[index].activeIcon,
                  height: getSize(
                    24,
                  ),
                  width: getSize(
                    24,
                  ),
                  color: appTheme.indigo100,
                ),
                activeIcon: Container(
                  padding: getPadding(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  decoration: AppDecoration.fill9.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder25,
                  ),
                  child: CustomImageView(
                    svgPath: bottomMenuList[index].activeIcon,
                    height: getSize(
                      28,
                    ),
                    width: getSize(
                      28,
                    ),
                    color: appTheme.whiteA700,
                    margin: getMargin(
                      top: 11,
                      bottom: 11,
                    ),
                  ),
                ),
                label: '',
              );
            }),
            onTap: (index) {
              selectedIndex.value = index;
              onChanged?.call(bottomMenuList[index].type);
            },
          ),
              ),
              label: '',
            );
          }),
          onTap: (index) {
              Get.toNamed(bottomMenuList[index].route);
            selectedIndex.value = index;
           // onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Iconlycurvedhome,
  Menu,
  Biplus,
  Checkmarkindigo100,
  Userdeeporangea20001,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    required this.route
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
  var route;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
