// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:frontend/pages/camera_page.dart';
// import 'package:frontend/pages/home_page.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({super.key});

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   int _currentPage = 0;
//   late PageController _pageController;
//   double _bottomMargin = 30;
//   double _blurRadius = 10;
//   double _opacity = 0.7;
//   late List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentPage);
//     _initializePages();
//   }

//   void _initializePages() {
//     _pages = [
//       HomePage(
//         onScrollEnd: _onHomePageScrollEnd,
//         normalScroll: _normalScrollBottomBar,
//       ),
//       Center(child: Text("Routine Page")),
//       Center(), // This can be the CameraPage if you want to show it here
//       Center(child: Text("Favorite Page")),
//       Center(child: Text("Profile Page")),
//     ];
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _normalScrollBottomBar() {
//     setState(() {
//       _opacity = 0.7;
//       _blurRadius = 10;
//     });
//   }

//   void _onHomePageScrollEnd() {
//     setState(() {
//       _opacity = 1;
//       _blurRadius = 0;
//       // Update other properties as needed
//     });
//   }

//   void _onItemTapped(int index) {
//     if (index == 2) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => CameraPage()));
//     } else {
//       _pageController.animateToPage(
//         index,
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void _onPageChanged(int index) {
//     setState(() {
//       _currentPage = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _icons = [
//       _buildNavIcon("assets/bottomNavigation/home.svg", 0),
//       _buildNavIcon("assets/bottomNavigation/routine.svg", 1),
//       SizedBox(width: 60), // Placeholder for the floating scan button
//       _buildNavIcon("assets/bottomNavigation/favorite.svg", 3),
//       _buildNavIcon("assets/bottomNavigation/profile.svg", 4),
//     ];

//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 child: PageView(
//                   controller: _pageController,
//                   onPageChanged: _onPageChanged,
//                   children: _pages,
//                   physics: ClampingScrollPhysics(),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: _bottomMargin, // Use dynamic margin
//             left: 20,
//             right: 20,
//             child: Container(
//               height: 70,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(_opacity),
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: _blurRadius,
//                     // offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 alignment: Alignment.center,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       GestureDetector(
//                         onTap: () => _onItemTapped(0),
//                         child: _icons[0],
//                       ),
//                       GestureDetector(
//                         onTap: () => _onItemTapped(1),
//                         child: _icons[1],
//                       ),
//                       SizedBox(width: 30), // Space for the floating scan button
//                       GestureDetector(
//                         onTap: () => _onItemTapped(3),
//                         child: _icons[3],
//                       ),
//                       GestureDetector(
//                         onTap: () => _onItemTapped(4),
//                         child: _icons[4],
//                       ),
//                     ],
//                   ),
//                   Positioned(
//                     top: -20,
//                     left: (MediaQuery.of(context).size.width - 40) / 2 - 35,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CameraPage()));
//                       },
//                       child: Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.black,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black,
//                               // blurRadius: 8,
//                               // offset: Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: SvgPicture.asset(
//                             "assets/bottomNavigation/scan.svg",
//                             width: 30,
//                             height: 30,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavIcon(String assetPath, int index) {
//     bool isSelected = _currentPage == index;

//     return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       child: SvgPicture.asset(
//         assetPath,
//         color: isSelected ? Colors.black : Color(0xff7E7E7E),
//         width: 30,
//         height: 30,
//       ),
//     );
//   }
// }
