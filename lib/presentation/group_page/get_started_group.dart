import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/group_page/creategroup.dart';
import 'package:daone/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class GetStartedGroupScreen extends StatelessWidget {
  const GetStartedGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/creategroup.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.1,
              ),
              Container(
                decoration: glassmorphicDecoration(),
                padding: EdgeInsets.all(5),
                child: TextWidget(
                    text: "Create a group that  \n   interests you.",
                    color: Colors.white,
                    fontFamily: 'Gotham Light',
                    font: FontWeight.w900,
                    fsize: 30),
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              Container(
                width: Get.width * 0.9,
                child: Column(
                  children: [
                    TextWidget(
                        text: "by contuning, you are agreeing to abide",
                        color: Colors.black,
                        fontFamily: 'Gotham Light',
                        font: FontWeight.w900,
                        fsize: 14),
                    TextWidget(
                        text: "by the Community Guidelines.",
                        color: Colors.black,
                        fontFamily: 'Gotham Light',
                        font: FontWeight.w900,
                        fsize: 14),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              InkWell(
                onTap: (){
                  Get.to(CreateGroup());
                },
                child: Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: TextWidget(
                    text: "Get Started",
                    color: Colors.white,
                    fontFamily: "Gotham Light",
                    font: FontWeight.w800,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration glassmorphicDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.1),
          Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: [0.1, 1],
      ),
      border: Border.all(
        width: 2,
        color: Colors.white.withOpacity(0.2),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 20,
          offset: Offset(0, 3),
        ),
      ],
    );
  }
}
