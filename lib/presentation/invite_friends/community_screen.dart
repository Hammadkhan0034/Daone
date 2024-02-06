

import 'package:daone/core/app_export.dart';
import 'package:flutter/material.dart';

class CommunityScreenNew extends StatelessWidget {
  const CommunityScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * 0.1,
          width: Get.width *0.1,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          )
        ],
      ),
    );
  }
}
