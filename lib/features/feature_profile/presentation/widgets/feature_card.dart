import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const FeatureCard({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.90, // 90 % of width
          heightFactor: 0.70, // 70 % of half‑height
          child: Material(
            color: AppPallete.transparentColor,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppPallete.gradientColorCard,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: AppPallete.deepNavy,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: AppPallete.cardBackgroundWithOpacity,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 60, color: AppPallete.backgroundColor),
                        const SizedBox(height: 12),
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppPallete.backgroundColor,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
