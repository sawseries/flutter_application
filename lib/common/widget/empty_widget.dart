import 'package:flutter_application/common/Theme/app_asset.dart';
import 'package:flutter_application/common/Theme/app_style.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppAsset.emptyState),
          Text(message, style: headLine1),
        ],
      ),
    );
  }
}
