import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConPros extends StatelessWidget {
  final Map<String, List<String>> categorizedIngredients;
  const ConPros({super.key, required this.categorizedIngredients});

  @override
  Widget build(BuildContext context) {
    print("CATE ON CPRO ${categorizedIngredients}");
    String alertDialogIngredient(String key, int len) {
      switch (key) {
        case "ชุ่มชื้น/ปลอบประโลมผิว":
          return "ผลิตภัณฑ์นี้มีสารที่ช่วยเรื่องความชุ่มชื้นและ ปลอบประโลมผิวอยู่ ${len} ตัว";
        case "รักษาสิว":
          return "ผลิตภัณฑ์นี้มีสารที่ช่วยเรื่องลดสิวอยู่ ${len} ตัว";
        case "ลดเลือนริ้วรอย":
          return "ผลิตภัณฑ์นี้มีสารที่ช่วยเรื่องการลดเลือนริ้วรอยอยู่ ${len} ตัว";
        case "ลดจุดด่างดำ":
          return "ผลิตภัณฑ์นี้มีสารที่ช่วยเรื่องการลดลดจุดด่างดำอยู่ ${len} ตัว";
        case "ปรับสีผิวให้สม่ำเสมอ":
          return "ผลิตภัณฑ์นี้มีสารที่ช่วยเรื่องการปรับสีผิวให้สม่ำเสมออยู่ ${len} ตัว";
        case "ควบคุมความมัน":
          return "ผลิตภัณฑ์นี้มีสารที่ช่วยเรื่องการควบคุมความมันอยู่ ${len} ตัว";
        case "ควบคุมความมัน":
          return "ผลิตภัณฑ์นี้มีสารที่ช่วยเรื่องการควบคุมความมันอยู่ ${len} ตัว";
        case "ทำให้ผิวเรียบเนียน":
          return "ผลิตภัณฑ์นี้มีสารที่ช่วยเรื่องการทำให้ผิวเรียบเนียนอยู่ ${len} ตัว";
        default:
          return "";
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "รายละเอียด",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Color(0xffE9F2FB),
                        borderRadius: BorderRadius.circular(8)),
                    child: SvgPicture.asset(
                      "assets/icons/icon-park-outline_good-two.svg",
                      width: 14,
                      height: 24,
                    ),
                  ),
                  //all Line
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "คุณสมบัติ",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      clipBehavior: Clip.none,
                      spacing: 6.0,
                      children: categorizedIngredients.entries.map((entry) {
                        String key = "";
                        int len = entry.value.length;

                        switch (entry.key) {
                          case "Hydration":
                            key = "ชุ่มชื้น/ปลอบประโลมผิว";
                          case "Anti-Acne":
                            key = "รักษาสิว";
                          case "Anti-Aging":
                            key = "ลดเลือนริ้วรอย";
                          case "Dark Spot Fading":
                            key = "ลดจุดด่างดำ";
                          case "Evens Skin Tone":
                            key = "ปรับสีผิวให้สม่ำเสมอ";
                          case "Oil Control":
                            key = "ควบคุมความมัน";
                          case "Pore Minimizer":
                            key = "ควบคุมความมัน";
                          case "Smooths Bumpy Skin":
                            key = "ทำให้ผิวเรียบเนียน";
                        }

                        if (key.isEmpty) {
                          return Container();
                        }

                        return GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    backgroundColor: Colors.white,
                                    title: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              key,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            GestureDetector(
                                              onTap: () => Navigator.of(context)
                                                  .pop(), // ปิด AlertDialog เมื่อกดไอคอน
                                              child:
                                                  Icon(Icons.close, size: 24),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 24),
                                        Text(
                                          alertDialogIngredient(
                                              key, entry.value.length),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                    content: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight:
                                            MediaQuery.of(context).size.height *
                                                0.6, // จำกัดความสูงสูงสุด
                                      ),
                                      child: entry.value.length > 20
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: entry.value.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 2.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          "• "), // Bullet point
                                                      Expanded(
                                                          child: Text(
                                                        entry.value[index],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge,
                                                      )),
                                                    ],
                                                  ),
                                                );
                                              },
                                            )
                                          : SingleChildScrollView(
                                              child: Column(
                                                children: entry.value
                                                    .map((item) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      2.0),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "• "), // Bullet point
                                                              Expanded(
                                                                child: Text(
                                                                  item,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyLarge,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                    ),
                                  );
                                });
                          },
                          child: Chip(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            backgroundColor: Color(0xffE9F2FB),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(1000)),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${key}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Color(0xff007AFF)),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 1),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Text(
                                      "${len}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Color(0xff007AFF)),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Color(0xffFBE5D7),
                        borderRadius: BorderRadius.circular(8)),
                    child: SvgPicture.asset("assets/icons/proicons_hand.svg"),
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ที่ต้องระวัง",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      clipBehavior: Clip.none,
                      spacing: 6.0, // horizontal spacing
                      children: categorizedIngredients.entries.map((entry) {
                        String key = "";
                        int len = entry.value.length;

                        switch (entry.key) {
                          case "Hydration":
                            key = "ชุ่มชื้น/ปลอบประโลมผิว";
                          case "Anti-Acne":
                            key = "รักษาสิว";
                          case "Anti-Aging":
                            key = "ลดเลือนริ้วรอย";
                          case "Dark Spot Fading":
                            key = "ลดจุดด่างดำ";
                          case "Evens Skin Tone":
                            key = "ปรับสีผิวให้สม่ำเสมอ";
                          case "Oil Control":
                            key = "ควบคุมความมัน";
                          case "Pore Minimizer":
                            key = "ควบคุมความมัน";
                          case "Smooths Bumpy Skin":
                            key = "ทำให้ผิวเรียบเนียน";
                        }

                        if (key.isEmpty) {
                          return Container();
                        }

                        return GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    backgroundColor: Colors.white,
                                    title: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              key,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            GestureDetector(
                                              onTap: () => Navigator.of(context)
                                                  .pop(), // ปิด AlertDialog เมื่อกดไอคอน
                                              child:
                                                  Icon(Icons.close, size: 24),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 24),
                                        Text(
                                          alertDialogIngredient(
                                              key, entry.value.length),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                    content: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight:
                                            MediaQuery.of(context).size.height *
                                                0.6, // จำกัดความสูงสูงสุด
                                      ),
                                      child: entry.value.length > 20
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: entry.value.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 2.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          "• "), // Bullet point
                                                      Expanded(
                                                          child: Text(
                                                        entry.value[index],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge,
                                                      )),
                                                    ],
                                                  ),
                                                );
                                              },
                                            )
                                          : SingleChildScrollView(
                                              child: Column(
                                                children: entry.value
                                                    .map((item) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      2.0),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "• "), // Bullet point
                                                              Expanded(
                                                                child: Text(
                                                                  item,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyLarge,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                    ),
                                  );
                                });
                          },
                          child: Chip(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            backgroundColor: Color(0xffFBE5D7),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(1000)),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${key}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Color(0xffFF9500)),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 1),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Text(
                                      "${len}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Color(0xffFF9500)),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
