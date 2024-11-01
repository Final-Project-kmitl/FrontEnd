import 'package:flutter/material.dart';

class LinearScore extends StatelessWidget {
  final int good;
  final int avg;
  final int bad;
  final int dontKnow;
  const LinearScore(
      {super.key,
      required this.good,
      required this.avg,
      required this.bad,
      required this.dontKnow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "ส่วนผสม",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              "  ${good + avg + bad + dontKnow}",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Color(0xffD0D0D0)),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            //Good section
            Expanded(
              flex: good.toInt(),
              child: good.toInt() == 0
                  ? SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                          color: Color(0xffE4FDDA),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                      height: 30,
                      child: Center(
                        child: Text(
                          "${good.toInt()}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Color(0xff34C759)),
                        ),
                      ),
                    ),
            ),
            //AVG section
            Expanded(
              flex: avg.toInt() == 0 ? 0 : avg.toInt(),
              child: avg.toInt() == 0
                  ? SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                          color: Color(0xffE9F2FB),
                          borderRadius: BorderRadius.only(
                              topLeft: good.toInt() == 0
                                  ? Radius.circular(8)
                                  : Radius.circular(0),
                              bottomLeft: good.toInt() == 0
                                  ? Radius.circular(8)
                                  : Radius.circular(0),
                              topRight:
                                  bad.toInt() == 0 && dontKnow.toInt() == 0
                                      ? Radius.circular(8)
                                      : Radius.circular(0),
                              bottomRight:
                                  bad.toInt() == 0 && dontKnow.toInt() == 0
                                      ? Radius.circular(8)
                                      : Radius.circular(0))),
                      height: 30,
                      child: Center(
                        child: Text(
                          "${avg.toInt()}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Color(0xff007AFF)),
                        ),
                      ),
                    ),
            ),
            //Bad section
            Expanded(
              flex: bad.toInt() == 0 ? 0 : bad.toInt(),
              child: bad.toInt() == 0
                  ? SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFD4DC),
                        borderRadius: BorderRadius.only(
                          topLeft: good.toInt() == 0 && avg.toInt() == 0
                              ? Radius.circular(8)
                              : Radius.circular(0),
                          bottomLeft: good.toInt() == 0 && avg.toInt() == 0
                              ? Radius.circular(8)
                              : Radius.circular(0),
                          topRight: dontKnow.toInt() == 0
                              ? Radius.circular(8)
                              : Radius.circular(0),
                          bottomRight: dontKnow.toInt() == 0
                              ? Radius.circular(8)
                              : Radius.circular(0),
                        ),
                      ),
                      height: 30,
                      child: Center(
                        child: Text(
                          "${bad.toInt()}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
            ),
            //Not Rate section
            Expanded(
              flex: dontKnow.toInt() == 0 ? 0 : dontKnow.toInt(),
              child: dontKnow.toInt() == 0
                  ? SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        color: Color(0xffD0D0D0),
                        borderRadius: BorderRadius.only(
                            topLeft: good.toInt() == 0 &&
                                    avg.toInt() == 0 &&
                                    bad.toInt() == 0
                                ? Radius.circular(8)
                                : Radius.circular(0),
                            bottomLeft: good.toInt() == 0 &&
                                    avg.toInt() == 0 &&
                                    bad.toInt() == 0
                                ? Radius.circular(8)
                                : Radius.circular(0),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                      height: 30,
                      child: Center(
                        child: Text(
                          "${dontKnow.toInt()}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffE4FDDA)),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "ดี",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffE9F2FB)),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "กลาง",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffFFD4DC)),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "แย่",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffD0D0D0)),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "ไม่ทราบ",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
