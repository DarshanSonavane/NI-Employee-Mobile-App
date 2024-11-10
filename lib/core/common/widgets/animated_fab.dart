import 'package:flutter/material.dart';

class AnimatedFabMenu extends StatefulWidget {
  final Function()? onAssignTap;
  final Function()? onCloseTap;
  final Function()? onTakeAction;
  final Function()? onGenerateSend;
  final String status;
  final String userStatus;
  final String heroTag;

  const AnimatedFabMenu({
    super.key,
    this.onAssignTap,
    this.onCloseTap,
    this.onTakeAction,
    this.onGenerateSend,
    required this.status,
    required this.userStatus,
    required this.heroTag,
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
    if (widget.status == "1" && widget.userStatus == "0") {
      return [
        _buildMenuButton('Assign', widget.onAssignTap!),
        _buildMenuButton('Close', widget.onCloseTap!),
      ];
    } else if (widget.status == "1" &&
        widget.userStatus == "0" &&
        widget.heroTag == "unique_hero_tag_2") {
      return [
        _buildMenuButton('Generate and send', widget.onGenerateSend!),
        _buildMenuButton('Close', widget.onCloseTap!),
      ];
    } else if (widget.status == "2" && widget.userStatus == "0") {
      return [
        _buildMenuButton('Re-Assign', widget.onAssignTap!),
        _buildMenuButton('Close', widget.onCloseTap!),
      ];
    } else if ((widget.status == "1" || widget.status == "2") &&
        widget.userStatus != "0") {
      return [
        _buildMenuButton('Take Action', widget.onTakeAction!),
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
          heroTag: widget.heroTag,
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
