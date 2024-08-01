import 'package:app/utils.dart';
import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  final String label;
  final IconData icon;
  const DetailTile({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xffe3e7ff),
              borderRadius: BorderRadius.circular(15)),
          child: Icon(
            icon,
            color: const Color(0xffa2acff),
            size: 30,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style:
              appFont(fontWeight: FontWeight.w400, color: Colors.grey.shade400),
        )
      ],
    );
  }
}
