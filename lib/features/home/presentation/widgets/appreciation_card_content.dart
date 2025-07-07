import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/core/utils/get_image_path.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AppreciationCardContent extends StatefulWidget {
  final String? message;
  final String? imageUrl;
  final String description;

  const AppreciationCardContent(
      {super.key, this.message, this.imageUrl, required this.description});

  @override
  State<AppreciationCardContent> createState() =>
      _AppreciationCardContentState();
}

class _AppreciationCardContentState extends State<AppreciationCardContent>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnim = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    super.initState();
  }

  bool _isTextExceedingTwoLines(String text, double maxWidth, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }

  String _getFirstTwoLines(String text) {
    final words = text.split(' ');
    String result = '';
    for (var word in words) {
      if ((result + word).length < 70) {
        result += '$word ';
      } else {
        break;
      }
    }
    return result.trim();
  }

  Widget _buildCollapsedText(String description) {
    final maxWidth =
        MediaQuery.of(context).size.width - 64; // adjust for padding
    const textStyle = TextStyle(
      fontSize: 15,
      color: AppPallete.label3Color,
    );

    final showExpandIcon =
        _isTextExceedingTwoLines(description, maxWidth, textStyle);

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: textStyle,
          children: [
            TextSpan(text: _getFirstTwoLines(description)),
            if (showExpandIcon) const TextSpan(text: '...  '),
            if (showExpandIcon)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () => setState(() => _isExpanded = true),
                  child: const Icon(Icons.keyboard_arrow_down_rounded,
                      size: 20, color: AppPallete.labelColor),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedText(String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Column(
        children: [
          CustomGlolbalText(
            text: description,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            color: AppPallete.label3Color,
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () => setState(() => _isExpanded = false),
            child: const Icon(Icons.keyboard_arrow_up_rounded,
                size: 22, color: AppPallete.labelColor),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final description = widget.description;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Message
        ScaleTransition(
          scale: _scaleAnim,
          child: CustomGlolbalText(
            text: widget.message ?? '',
            textAlign: TextAlign.center,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppPallete.gradientColor,
            style: const TextStyle(
              shadows: [
                Shadow(blurRadius: 8, color: AppPallete.appreciationGlow),
                Shadow(blurRadius: 16, color: AppPallete.appreciationGlow),
                Shadow(
                  blurRadius: 2,
                  color: AppPallete.label3Color,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Image
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 5),
            ],
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage:
                AssetImage(getImagePathFromKey(widget.imageUrl ?? '')),
          ),
        ),
        const SizedBox(height: 16),

        // Animated Description
        AnimatedCrossFade(
          firstChild: _buildCollapsedText(description),
          secondChild: _buildExpandedText(description),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),

        const SizedBox(height: 14),

        // Marquee
        SizedBox(
          height: 26,
          child: Marquee(
            text: '✨ Give your best! You could be next week’s star! 🚀',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppPallete.labelColor,
            ),
            velocity: 30,
            blankSpace: 40,
            pauseAfterRound: const Duration(seconds: 1),
          ),
        ),
      ],
    );
  }
}
