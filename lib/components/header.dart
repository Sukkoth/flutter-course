import 'package:app/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final String city;
  final String country;
  const Header({super.key, required this.city, required this.country});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$city,",
          style: appFont(
            fontSize: 38,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF333866),
          ),
        ),
        Text(
          country,
          style: appFont(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333866),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          DateFormat.MMMEd().format(DateTime.now()),
          style: appFont(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade500,
          ),
        )
      ],
    );
  }
}
