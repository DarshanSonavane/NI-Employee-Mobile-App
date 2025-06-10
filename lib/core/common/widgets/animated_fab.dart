import 'package:flutter/material.dart';

class AnimatedFabMenu extends StatefulWidget {
  final Function()? onAssignTap;
  final Function()? onCloseTap;
  final Function()? onTakeAction;
  final Function()? onGenerateSend;
  final Function()? onDelete;
  final Function()? onGenerateFSR;
  final String status;
  final String userStatus;
  final String tag;

  const AnimatedFabMenu({
    super.key,
    this.onAssignTap,
    this.onCloseTap,
    this.onTakeAction,
    this.onGenerateSend,
    this.onDelete,
    this.onGenerateFSR,
    required this.status,
    required this.userStatus,
    required this.tag,
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
    final status = widget.status;
    final userStatus = widget.userStatus;
    final tag = widget.tag;

    if (status == "1" && userStatus == "0" && tag == "_complaints") {
      return [
        _buildMenuButton('FSR', widget.onGenerateFSR ?? () {}),
        _buildMenuButton('Assign', widget.onAssignTap ?? () {}),
        _buildMenuButton('Close', widget.onCloseTap ?? () {}),
      ];
    }

    if (status == "2" && userStatus == "0" && tag == "_complaints") {
      return [
        _buildMenuButton('FSR', widget.onGenerateFSR ?? () {}),
        _buildMenuButton('Re-Assign', widget.onAssignTap ?? () {}),
        _buildMenuButton('Close', widget.onCloseTap ?? () {}),
      ];
    }

    if ((status == "1" || status == "2") &&
        userStatus != "0" &&
        tag == "_complaints") {
      return [
        _buildMenuButton('FSR', widget.onGenerateFSR ?? () {}),
        _buildMenuButton('Take Action', widget.onTakeAction ?? () {}),
      ];
    }

    if (userStatus == "0" && status != "0" && tag == "_calibration") {
      return [
        _buildMenuButton('Generate and Send', widget.onGenerateSend ?? () {}),
        _buildMenuButton('Delete', widget.onDelete ?? () {}),
      ];
    }

    if (status == "0" && userStatus == "0" && tag == "_calibration") {
      return [
        _buildMenuButton('Delete', widget.onDelete ?? () {}),
      ];
    }

    if (status != "0" && userStatus != "0" && tag == "_calibration") {
      return [
        _buildMenuButton('Generate and Send', widget.onGenerateSend ?? () {}),
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
          heroTag: null,
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
