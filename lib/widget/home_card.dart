import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String upperText;
  final String? lowerText;
  final Icon icon;
  const HomeCard({
    super.key,
    required this.upperText,
    this.lowerText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Ink(
          decoration: const BoxDecoration(
            color: Color(0xff404040),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                upperText,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              if (lowerText != null) ...[
                const SizedBox(height: 6),
                Text(
                  lowerText!,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: icon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
