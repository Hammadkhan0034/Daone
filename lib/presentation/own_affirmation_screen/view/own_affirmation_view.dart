import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/own_affirmation_screen/controller/own_affirmation_controller.dart';
import 'package:daone/presentation/own_affirmation_screen/own_affirmation_model.dart';
import 'package:daone/presentation/own_affirmation_screen/view/ownaffirmationdialogue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart'; // Make sure to import Get for GetX state management
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../widgets/app_bar/appbar_iconbutton.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/text_widget.dart';
import '../../edit_affirmation_dialog/edit_affirmation_dialog.dart';

class OwnAffirmationView extends StatefulWidget {
  const OwnAffirmationView({Key? key}) : super(key: key);

  @override
  State<OwnAffirmationView> createState() => _OwnAffirmationViewState();
}

class _OwnAffirmationViewState extends State<OwnAffirmationView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final GlobalKey key = GlobalKey();
  final controller = Get.find<OwnAffirmationController>();


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Adjust the duration as needed
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    OwnAffirmationController controller = Get.put(OwnAffirmationController());

    return SafeArea(
      child: PopScope(
        onPopInvoked: (value){
          controller.shouldShowEdit.value=false;
        },
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          floatingActionButton: FloatingActionButton(onPressed: () {
            Get.to(() => EditAffirmationScreen(),);
          },
            child: Icon(Icons.add, color: Colors.white,),
            backgroundColor: Colors.deepOrange,),
          appBar: AppBar(
            backgroundColor: Colors.grey[100],

            centerTitle: true,
            title: Obx(() {
              return Text(
                  controller.shouldShowEdit.value
                      ? 'Edit Affirmations'
                      : 'My Affirmations',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Gotham Light'

                  )
              );
            }),
            leadingWidth: 68,
            leading: AppbarIconbutton(
              onTap: () {
                Get.back();
              },
              svgPath: ImageConstant.imgInfo,
              margin: getMargin(
                //   left: 30,
                top: 10,
                //   bottom: 5,
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child:
                InkWell(
                    onTap: () {
                      controller.shouldShowEdit.value =
                      !controller.shouldShowEdit.value;
                    },
                    child: Obx(() {
                      return Icon(
                        controller.shouldShowEdit.value?FontAwesomeIcons.close : Icons.edit, color: Colors.deepOrange, size: 24,);
                    })),
              )
            ],
          ),

          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            height: Get.height,
            width: double.infinity,
            child: StreamBuilder<List<OwnAffirmationModel>>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(user?.email)
                  .collection('OwnAffirmationList')
                  .snapshots().map((snapshot) {
                if (snapshot.size == 0) return [];
                List<OwnAffirmationModel> list = [];
                for (var affirmation in snapshot.docs) {
                  OwnAffirmationModel ownAffirmationModel = OwnAffirmationModel
                      .fromMap(affirmation.data());
                  list.add(ownAffirmationModel);
                }
                return list;
              }),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Loading indicator while data is being fetched
                  return Center(
                    child: Container(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                          color: Colors.deepOrangeAccent,
                        )),
                  );
                }

                if (snapshot.hasError) {
                  // Handle errors here
                  return Text('Error: ${snapshot.error}');
                }

                // Check if there are no tasks
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: Get.height * 0.3,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.08),
                        Center(
                          child: Image.asset(
                            ImageConstant.vector21,
                            scale: 4,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.04),
                        TextWidget(
                          text: "You don't have any affirmation",
                          color: Colors.black38,
                          fsize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 2, // Set the number of columns here
                  //   crossAxisSpacing: 8.0, // Adjust spacing as needed
                  //   mainAxisSpacing: 8.0, // Adjust spacing as needed
                  // ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final OwnAffirmationModel affirmationModel = snapshot
                        .data[index];
                    return FadeTransition(
                      opacity: _animationController.drive(
                          CurveTween(curve: Curves.easeInOut)),
                      child: Obx(() {
                        return Card(
                          margin: EdgeInsets.only(top: 10),
                          semanticContainer: false,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey[350]!),

                              borderRadius: BorderRadius.circular(20)),
                          surfaceTintColor: Colors.white,
                          child: Row(
                            children: [
                              controller.shouldShowEdit.value ? Container(
                                width: 50, height: 125,

                                decoration: BoxDecoration(
                                    border: Border(right: BorderSide(
                                      width: 1, color: Colors.grey[350]!,))
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(()=> EditAffirmationScreen(ownAffirmationModel: affirmationModel,));

                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.deepOrangeAccent,
                                        size: 24,
                                      ),
                                    ),
                                    Container(height: 1,
                                      width: 40,
                                      color: Colors.grey[350]!,),
                                    InkWell(
                                      onTap: () {
        controller.deleteAffirmation(affirmationModel.documentID);
                                      },
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                    ),
                                  ],),) : SizedBox.shrink(),
                              InkWell(
                                onTap: () {
                                  controller.affirmationText.text =
                                      affirmationModel.affirmation;
                                  Get.dialog(
                                    AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      contentPadding: EdgeInsets.zero,
                                      insetPadding: const EdgeInsets.only(
                                          left: 0),
                                      content:
                                      OwnAffirmationBlastEffectDialog(
                                        controller,
                                        ownAffirmationModel: affirmationModel,
                                        key: key,
                                      ),
                                    ),
                                  );
                                }, child: Container(
                                height: 115,
                                width: Get.width -
                                    (controller.shouldShowEdit.value ? 90 : 50),
                                margin: controller.shouldShowEdit.value
                                    ? EdgeInsets.only(
                                    top: 10, left: 5, right: 5, bottom: 5)
                                    : EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 5),
                                // decoration: BoxDecoration(
                                //   // image: DecorationImage(
                                //   //   image:  CachedNetworkImageProvider(affirmationModel.imageUrl),
                                //   //   fit: BoxFit.cover,
                                //   // ),
                                //   borderRadius: BorderRadius.circular(20),
                                //   border: Border.all(color: Colors.grey)
                                // ),
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      height: 65,
                                      child: Text(
                                        affirmationModel.affirmation,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Color(0xff5E4646),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 5, bottom: 0),
                                        height: 30,
                                        width: 80,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                30),
                                            border: Border.all(
                                              color: Colors.deepOrange,)
                                        ),
                                        child: TextWidget(text: affirmationModel
                                            .affirmationCount.toString(),
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.w600,
                                            fsize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
