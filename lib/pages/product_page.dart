import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int vat = 190;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              minHeight: 350.0,
              maxHeight: 450.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 60, bottom: 20),
                    height: 372,
                    child: Image.asset(
                      "assets/test_img.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 34,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 34,
                      ),
                      onPressed: () {
                        // Handle favorite button logic
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 29, right: 29, top: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ชื่อสินค้า',
                            style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(height: 4),
                        Text(
                          "ชื่อแบรนด์",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Color(0xff7E7E7E)),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('เรตติ้ง',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            Text('5.0',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ],
                        ),
                        const SizedBox(height: 11),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ราคา',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            Text('${vat} บาท',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ],
                        ),
                        const SizedBox(height: 42.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("เหมาะกับสภาพผิว",
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            Text(
                              "ผิวแห้ง",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.green),
                            )
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ส่วนผสมที่คุณแพ้",
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            Text(
                              "ไม่มี",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.red),
                            )
                          ],
                        ),
                        const SizedBox(height: 35.0),
                        Text('หน้าที่ของส่วนผสม',
                            style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(height: 11.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('รักษาสิว:',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                            Text('Azelaic Acid, Benzoyl Peroxide',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ลดเรือนริ้วรอย:',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                            Text('Folic Acid',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ],
                        ),
                        const SizedBox(height: 50.0),
                        Row(
                          children: [
                            Text(
                              'อาจก่อให้เกิดอาการระคายเคือง: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(color: Colors.orange),
                            ),
                            const SizedBox(width: 18),
                            Text('Cornmint',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ],
                        ),
                        const SizedBox(height: 45.0),
                        Text('เราขอแนะนำ',
                            style: Theme.of(context).textTheme.headlineLarge),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  Container(
                    height: 144,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5 + 1,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 16.0),
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
                  SizedBox(
                      height:
                          21.0), // Reduced from 1000.0 to 50.0 for demonstration
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 40),
                    child: SizedBox(
                      height: 52,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                          ),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.black),
                        ),
                        onPressed: () {
                          // Handle like button logic
                        },
                        child: Text(
                          'ถูกใจ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
