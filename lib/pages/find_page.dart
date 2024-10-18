import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  List<Map<String, dynamic>> _q3test = [
    {"label": "รักษาสิว", "selected": false, "color": Color(0xffE9F2FB)},
    {"label": "ลดเลือนริ้วรอย", "selected": false, "color": Color(0xffFDF3E9)},
    {"label": "ลดจุดด่างดำ", "selected": false, "color": Color(0xffEFE8FA)},
    {"label": "กระชับรูขุมขน", "selected": false, "color": Color(0xffFBE5D7)},
    {"label": "ควบคุมความมัน", "selected": false, "color": Color(0xffE9F2FB)},
    {
      "label": "ปรับสีผิวให้สม่ำเสมอ",
      "selected": false,
      "color": Color(0xffFDF3E9)
    },
    {
      "label": "ชุ่มชื้น/ปลอบประโลมผิว",
      "selected": false,
      "color": Color(0xffEFE8FA)
    },
    {
      "label": "ทำให้ผิวเรียบเนียน",
      "selected": false,
      "color": Color(0xffFBE5D7)
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "คุณมองหาผลิตภัณฑ์ที่ช่วยเรื่องอะไร?",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "เลือกได้มากกว่า 1 ข้อ",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 32,
            ),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: _q3test.map((e) {
                return ChoiceChip(
                  showCheckmark: false,
                  label: Text(
                    e["label"],
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  side: e["selected"]
                      ? BorderSide(color: e["color"])
                      : BorderSide(color: Color(0xffD0D0D0)),
                  selected: e["selected"],
                  onSelected: (value) {
                    setState(() {
                      e["selected"] = !e["selected"];
                    });
                  },
                  selectedColor: e["color"],
                  backgroundColor: Colors.white,
                );
              }).toList(), // Convert the map result to a list
            )
          ],
        ),
      ),
    );
  }
}
