import 'dart:convert';

import 'package:tour/data/places.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:http/http.dart' as http;

import '../models/placesD.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late TapGestureRecognizer readMoreGestureRecognizer;
  bool showMore = false;
  String weatherDegree = '';
  String weatherDescription = '';

  @override
  void initState() {
    super.initState();
    readMoreGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showMore = !showMore;
        });
      };
    fetchWeatherData();
  }

  @override
  void dispose() {
    super.dispose();
    readMoreGestureRecognizer.dispose();
  }

  Future<void> fetchWeatherData() async {
    final apiKey = '2349597974161416a031ba09eaed0fcb'; // Replace with your OpenWeatherMap API key
    final city = 'Riyadh'; // Replace with the desired city name

      final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        final main = weatherData['weather'][0]['main'];
        final description = weatherData['weather'][0]['description'];
        final tempKelvin = weatherData['main']['temp'];
        final tempCelsius = tempKelvin - 273.15;

        setState(() {
          weatherDegree = '${tempCelsius.toStringAsFixed(1)}°C';
          weatherDescription = '$main: $description';
        });
      } else {
        // Handle API call failure
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.bookmark),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.product.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            widget.product.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Text(
            "Description",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: [
                TextSpan(
                  text: showMore
                      ? widget.product.description
                      : '${widget.product.description.substring(0, widget.product.description.length - 100)}...',
                ),
                TextSpan(
                  recognizer: readMoreGestureRecognizer,
                  text: showMore ? " Read less" : " Read more",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: '\n\nWeather Degree: $weatherDegree\nWeather Description: $weatherDescription',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Similar Places:",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 90,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 90,
                  width: 80,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(products[index].image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
              separatorBuilder: (__, _) => const SizedBox(
                width: 10,
              ),
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}