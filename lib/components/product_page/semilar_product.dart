import 'package:flutter/material.dart';

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "ผลิตภัณฑ์ที่คล้ายกัน",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 144,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5 + 1,
            separatorBuilder: (context, index) => SizedBox(width: 16.0),
            itemBuilder: (context, index) {
              if (index == 0 || index == 5) {
                return SizedBox(width: 9);
              }
              return Container(
                width: 100,
                color: Colors.grey[300],
                child: Center(child: Text('Product $index')),
              );
            },
          ),
        ),
      ],
    );
  }
}
