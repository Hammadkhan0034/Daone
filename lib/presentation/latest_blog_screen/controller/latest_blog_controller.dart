import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/latest_blog_screen/models/latest_blog_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A controller class for the LatestBlogScreen.
///
/// This class manages the state of the LatestBlogScreen, including the
/// current latestBlogModelObj
class LatestBlogController extends GetxController {
  Rx<LatestBlogModel> latestBlogModelObj = LatestBlogModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in latestBlogModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    latestBlogModelObj.value.dropdownItemList.refresh();
  }

}
