import 'package:app/components/Weather.dart';
import 'package:app/components/hourly_tile.dart';
import 'package:app/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Hourly extends StatelessWidget {
  final List<WeatherList> list;
  const Hourly({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Next Hours",
          style: appFont(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333866),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return HourlyTile(
                time: DateFormat.Hm().format(DateTime.parse(list[index].dtTxt)),
                icon: Icons.sunny,
                value: "23°",
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
