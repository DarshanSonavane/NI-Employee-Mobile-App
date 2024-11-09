import 'package:flutter/material.dart';

class AnimatedFabMenu extends StatefulWidget {
  final Function() onAssignTap;
  final Function() onCloseTap;
  final Function() onTakeAction;
  final String status;
  final String userStatus;

  const AnimatedFabMenu({
    super.key,
    required this.onAssignTap,
    required this.onCloseTap,
    required this.onTakeAction,
    required this.status,
    required this.userStatus,
  });

  @override
  State<AnimatedFabMenu> createState() => _AnimatedFabMenuState();
}

class _AnimatedFabMenuState extends State<AnimatedFabMenu> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  List<Widget> _buildMenuOptions() {
    // Check conditions to determine which buttons to show
    if (widget.status == "1" && widget.userStatus == "0") {
      return [
        _buildMenuButton('Assign', widget.onAssignTap),
        _buildMenuButton('Close', widget.onCloseTap),
      ];
    } else if (widget.status == "2" && widget.userStatus == "0") {
      return [
        _buildMenuButton('Re-Assign', widget.onAssignTap),
        _buildMenuButton('Close', widget.onCloseTap),
      ];
    } else if ((widget.status == "1" || widget.status == "2") &&
        widget.userStatus != "0") {
      return [
        _buildMenuButton('Take Action', widget.onTakeAction),
      ];
    }
    return [];
  }

  Widget _buildMenuButton(String label, Function() onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
        _toggleMenu();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (_isMenuOpen) ..._buildMenuOptions(),
        // Main FAB
        FloatingActionButton.small(
          backgroundColor: _isMenuOpen ? Colors.green : Colors.purple,
          elevation: 3,
          onPressed: _toggleMenu,
          child: Icon(
            _isMenuOpen ? Icons.close : Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}







// import 'package:flutter/material.dart';

// class AnimatedFabMenu extends StatefulWidget {
//   final Function() onAssignTap;
//   final Function() onCloseTap;
//   final String status;

//   const AnimatedFabMenu({
//     super.key,
//     required this.onAssignTap,
//     required this.onCloseTap,
//     required this.status,
//   });

//   @override
//   State<AnimatedFabMenu> createState() => _AnimatedFabMenuState();
// }

// class _AnimatedFabMenuState extends State<AnimatedFabMenu> {
//   bool _isMenuOpen = false;

//   void _toggleMenu() {
//     setState(() {
//       _isMenuOpen = !_isMenuOpen;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         if (_isMenuOpen) ...[
//           // Assign Option
//           GestureDetector(
//             onTap: () {
//               widget.onAssignTap();
//               _toggleMenu();
//             },
//             child: Container(
//               margin: const EdgeInsets.only(right: 8),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.green),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: const Text(
//                 'Assign',
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),

//           // Close Option
//           GestureDetector(
//             onTap: () {
//               widget.onCloseTap();
//               _toggleMenu();
//             },
//             child: Container(
//               margin: const EdgeInsets.only(right: 8),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.green),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: const Text(
//                 'Close',
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//         ],

//         // Main FAB
//         FloatingActionButton.small(
//           backgroundColor: _isMenuOpen ? Colors.green : Colors.purple,
//           elevation: 3,
//           onPressed: _toggleMenu,
//           child: Icon(
//             _isMenuOpen ? Icons.close : Icons.add,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }

