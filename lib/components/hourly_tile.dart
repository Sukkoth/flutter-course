import 'package:app/utils.dart';
import 'package:flutter/material.dart';

class HourlyTile extends StatelessWidget {
  final String time;
  final String value;
  final IconData icon;
  const HourlyTile(
      {super.key, required this.time, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2,
          color: const Color(0xffadb1cc),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            style: appFont(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xffadb1cc)),
          ),
          Icon(
            icon,
            color: const Color(0xffadb1cc),
            size: 30,
          ),
          Text(
            // "19°",
            value,
            style: appFont(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xffadb1cc)),
          ),
        ],
      ),
    );
  }
}
