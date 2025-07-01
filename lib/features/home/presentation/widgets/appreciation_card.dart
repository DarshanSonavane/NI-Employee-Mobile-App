import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/features/home/presentation/widgets/appreciation_card_content.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppreciationCard extends StatefulWidget {
  final bool hasData;
  final String? message;
  final String? imageUrl;
  final String description;

  const AppreciationCard({
    super.key,
    required this.hasData,
    this.message,
    this.imageUrl,
    required this.description,
  });

  @override
  State<AppreciationCard> createState() => _AppreciationCardState();
}

class _AppreciationCardState extends State<AppreciationCard> {
  @override
  Widget build(BuildContext context) {
    final bool hasData = widget.hasData;

    final gradient = hasData
        ? LinearGradient(
            colors: AppPallete.gradientColorAppreciationCard,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : LinearGradient(
            colors: AppPallete.gradientColorNoAppreciationCard,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );

    final boxShadowColor = hasData
        ? AppPallete.appreciationGlow.withAlpha(80)
        : AppPallete.appreciationGlowEmpty.withAlpha(60);

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: hasData
          ? AppreciationCardContent(
              description: widget.description,
              message: widget.message,
              imageUrl: widget.imageUrl,
            )
          : _buildNoDataContent(),
    );
  }

  Widget _buildNoDataContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          'assets/animations/sadman.json',
          width: 140,
          height: 140,
          repeat: false,
        ),
        const SizedBox(height: 16),
        const CustomGlolbalText(
          text: "No appreciation this week.",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          color: AppPallete.label3Color,
        ),
        const SizedBox(height: 6),
        const CustomGlolbalText(
          text: "💪✨Put in your best effort and shine next time!",
          fontSize: 16,
          fontStyle: FontStyle.normal,
          textAlign: TextAlign.center,
          color: AppPallete.label2Color,
        ),
      ],
    );
  }
}
