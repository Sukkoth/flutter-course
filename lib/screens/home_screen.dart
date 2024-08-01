import 'dart:convert';
import 'package:app/components/Weather.dart';
import 'package:app/components/header.dart';
import 'package:app/components/hourly.dart';
import 'package:app/components/today.dart';
import 'package:app/secrets.dart';
import 'package:app/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherData> fetchWeather;
  Future<WeatherData> getCurrentWeather() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=Addis%20Ababa,et&APPID=$openWeatherApiKey'));

      final data = WeatherData.fromJson(json.decode(response.body));
      if (data.cod != '200') {
        debugPrint("🚀🚀 NO COD: $data");
        throw 'Error!: Unexpected Error.';
      }
      return data;
    } catch (e) {
      debugPrint("🚀🚀 CATCH: $e");
      throw 'Error! Could not fetch data.';
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                fetchWeather = getCurrentWeather();
              });
            },
            icon: const Icon(
              Icons.refresh,
              color: Color(0xFF333866),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 15.0, left: 15, bottom: 15, top: 0),
          child: FutureBuilder<WeatherData>(
              future: fetchWeather,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF333866),
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: appFont(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                final data = snapshot.data;
                final currentData = data!.list[0];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      city: data.city.name,
                      country: data.city.country,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Today(
                      temp: (currentData.main.temp - 273.15).toStringAsFixed(2),
                      icon: currentData.weather[0].main == "Clouds" ||
                              currentData.weather[0].main == "Rain"
                          ? Icons.cloud
                          : Icons.sunny,
                      status: currentData.weather[0].main,
                      humidity: currentData.main.humidity.toString(),
                      pressure: currentData.main.pressure.toString(),
                      windSpeed: currentData.wind.speed.toString(),
                    ),
                    const SizedBox(height: 40),
                    Hourly(list: data.list.sublist(1, 10)),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
