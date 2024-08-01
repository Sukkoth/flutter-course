import 'package:app/components/detail_tile.dart';
import 'package:app/utils.dart';
import 'package:flutter/material.dart';

class Today extends StatelessWidget {
  final String temp;
  final String status;
  final IconData icon;
  //for bottom
  final String windSpeed;
  final String humidity;
  final String pressure;

  const Today(
      {super.key,
      required this.temp,
      required this.status,
      required this.icon,
      required this.windSpeed,
      required this.humidity,
      required this.pressure});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Today",
            style: appFont(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF333866),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.amber,
                size: 100,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 35),
                        child: Text(
                          temp,
                          style: appFont(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF333866),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 0,
                        child: Text(
                          "°C",
                          style: appFont(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    status,
                    style: appFont(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailTile(
                  icon: Icons.air,
                  label: windSpeed,
                ),
                DetailTile(
                  icon: Icons.water_drop,
                  label: "$humidity%",
                ),
                DetailTile(
                  icon: Icons.beach_access,
                  label: pressure,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
