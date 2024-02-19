import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils{
  static Future showOverlayWithConfirmation ( Future func )async{
    await Get.showOverlay(asyncFunction: ()async{
      await func;
    },
        loadingWidget: Center(
          child: SizedBox(
              height: 60, width: 60, child: CircularProgressIndicator(color: Colors.deepOrange,)),
        ));
  }


  static Future<bool> askForConfirmation(BuildContext context,String action,String title)async{
    bool isConfirmed=false;
    isConfirmed=await showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Color(0xffECE6EB),
        title: Text(title),
        content:
        Text("Are you sure you want to $action?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              "No",
              style: TextStyle(
                  fontSize: 15, color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              "Yes",
              style: TextStyle(
                  fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      );
    });





    return isConfirmed;

  }

}