// import 'package:flutter/material.dart';
//
// class CutomBottomNevbar extends StatefulWidget {
//   final List<Widget> screens;
//
//   const CutomBottomNevbar({super.key, required this.screens});
//
//   @override
//   State<CutomBottomNevbar> createState() => _CutomBottomNevbarState();
// }
//
// class _CutomBottomNevbarState extends State<CutomBottomNevbar> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final List<IconData> _icons = [
//     Icons.home_outlined,
//     Icons.task_outlined,
//     Icons.add, // dummy - handled separately
//     Icons.trending_up_outlined,
//     Icons.person_outline,
//   ];
//
//   final List<IconData> _selectedIcons = [
//     Icons.home,
//     Icons.task,
//     Icons.add_rounded, // dummy - handled separately
//     Icons.trending_up,
//     Icons.person,
//   ];
//
//   final List<String> _labels = [
//     'Home',
//     'Tasks',
//     'New Task',
//     'Report',
//     'Profile',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.screens[_selectedIndex],
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _onItemTapped(2),
//         backgroundColor: Colors.white,
//         shape: const CircleBorder(),
//         elevation: 4,
//         child: Icon(
//           _selectedIndex == 2 ? Icons.add : Icons.add_outlined,
//           color: const Color(0xFF438B92),
//           size: 28,
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: const Color(0xFF438B92),
//         notchMargin: 6.0,
//         shape: const CircularNotchedRectangle(),
//         child: SizedBox(
//           height: 70,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: List.generate(5, (index) {
//               if (index == 2) {
//                 // Middle is handled by FAB
//                 return const SizedBox(width: 50);
//               }
//
//               final bool isSelected = _selectedIndex == index;
//
//               return GestureDetector(
//                 onTap: () => _onItemTapped(index),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       decoration:
//                           isSelected
//                               ? const BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                               )
//                               : null,
//                       padding: const EdgeInsets.all(8),
//                       child: Icon(
//                         isSelected ? _selectedIcons[index] : _icons[index],
//                         color:
//                             isSelected ? const Color(0xFF438B92) : Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     if (isSelected)
//                       Text(
//                         _labels[index],
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                         ),
//                       ),
//                   ],
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
//
// // class CutomBottomNevbar extends StatefulWidget {
// //   final List<Widget> screens;
//
// //   const CutomBottomNevbar({super.key, required this.screens});
//
// //   @override
// //   State<CutomBottomNevbar> createState() => _CutomBottomNevbarState();
// // }
//
// // class _CutomBottomNevbarState extends State<CutomBottomNevbar> {
// //   int _selectedIndex = 0;
//
// //   // void _onItemTapped(int index) {
// //   //   setState(() {
// //   //     //print("index $index");
// //   //     _selectedIndex = index;
//
// //   //    // print("Selected $_selectedIndex");
// //   //   });
// //   // }
//
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }
//
// //   final List<IconData> _icons = [
// //     Icons.home_outlined,
// //     Icons.task_outlined,
// //     Icons.add_circle_outline,
// //     Icons.trending_up,
// //     Icons.person_outlined,
// //   ];
//
// //   final List<String> _labels = [
// //     'Home',
// //     'Tasks',
// //     'New Task',
// //     'Report',
// //     'Profile',
// //   ];
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: widget.screens[_selectedIndex],
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () => _onItemTapped(2),
// //         backgroundColor: Colors.white,
// //         shape: CircleBorder(),
// //          child: Icon(Icons.add, color: Color(0x438B92)),
// //         elevation: 4,
// //       ),
// //       bottomNavigationBar: BottomAppBar(
// //         color: Color(0xFF438B92),
// //         // shape: CircularCenterNotchedShape(), //
// //         notchMargin: 6.0,
// //         child: SizedBox(
// //           height: 60,
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: List.generate(widget.screens.length, (index) {
// //               if (index == 2) {
// //                 return SizedBox(width: 40); // Space for center FAB
// //               }
// //               return InkWell(
// //                 onTap: () => _onItemTapped(index),
// //                 child: Column(
// //                   children: [
// //                     Icon(_icons[index], color: Colors.white),
// //                     if (_selectedIndex == index)
// //                       Text(
// //                         _labels[index],
// //                         style: TextStyle(color: Colors.white, fontSize: 12),
// //                       ),
// //                   ],
// //                 ),
// //               );
// //             }),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
