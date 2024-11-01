import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class CardInProductPage extends StatelessWidget {
  final int state;
  final String title;
  final String desc;
  final String userDetail;

  const CardInProductPage({
    super.key,
    required this.state,
    required this.title,
    required this.desc,
    required this.userDetail,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color pinColor;

    // Define colors based on state
    if (state == -1) {
      bgColor = const Color(0xffFFD4DC);
      pinColor = Colors.red;
    } else if (state == 0) {
      bgColor = const Color(0xffFBE5D7);
      pinColor = Colors.orange;
    } else if (state == 1) {
      bgColor = const Color(0xffE4FDDA);
      pinColor = Colors.green;
    } else {
      bgColor = Colors.grey;
      pinColor = Colors.black;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      width: 260,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            desc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Color(0xff7E7E7E)),
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/hugeicons--pin.svg",
                width: 16,
                height: 16,
                color: pinColor, // Pin color based on state
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                userDetail,
                overflow: TextOverflow.ellipsis, // Prevent overflow
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
