import 'package:tour/data/places.dart';
import 'package:tour/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tour/utils/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExplorePage extends StatelessWidget {
const ExplorePage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Scaffold(
body: ListView(
padding: const EdgeInsets.all(16.0),
children: [
Padding(
padding: const EdgeInsets.only(bottom: 15),
child: Row(
children: [
Expanded(
child: TextField(
decoration: InputDecoration(
hintText: "Search For Activity...",
isDense: true,
contentPadding: const EdgeInsets.all(12.0),
border: OutlineInputBorder(
borderSide: BorderSide(),
borderRadius: BorderRadius.all(
Radius.circular(99),
),
),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(
color: Colors.grey.shade300,
),
borderRadius: BorderRadius.all(
Radius.circular(99),
),
),
prefixIcon: const Icon(IconlyLight.search),
),
),
),
Padding(
padding: const EdgeInsets.only(left: 12),
child: IconButton(
onPressed: () {},
icon: const Icon(IconlyLight.filter2),
),
),
],
),
),
Padding(
padding: const EdgeInsets.only(bottom: 25),
child: SizedBox(
height: 170,
child: Card(
color: Colors.white,
elevation: 0.1,
shadowColor: Colors.white,
child: Padding(
padding: const EdgeInsets.all(12),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Flexible(
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
ElevatedButton(
onPressed: () {
// Open the map window here
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => MapWindow(),
),
);
},
child: const Text("Map window"),
),
],
),
),
// Image.asset(
// 'assets/contact_us.png',
// width: 140,
// ),
],
),
),
),
),
),
Container(
margin: EdgeInsets.symmetric(vertical: 16), // Add vertical margin for spacing
child: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
"Recommended for you",
style: Theme.of(context).textTheme.headline6,
),
TextButton(
onPressed: () {},  //see all option
child: const Text("See all"),
),
],
),
GridView.builder(
itemCount: products.length,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
childAspectRatio: 0.9,
crossAxisSpacing: 16,
mainAxisSpacing: 16,
),
itemBuilder: (context, index) {
return ProductCard(product: products[index]);
},
),
],
),
),
Container(
margin: EdgeInsets.symmetric(vertical: 16), // Add vertical margin for spacing
child: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
"Trending",
style: Theme.of(context).textTheme.headline6,
),
TextButton(
onPressed: () {},
child: const Text("See all"),
),
],
),
GridView.builder(
itemCount: products.length,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
childAspectRatio: 0.9,
crossAxisSpacing: 16,
mainAxisSpacing: 16,
),
itemBuilder: (context, index) {
return ProductCard(product: products[index]);
},
),
],
),
),
],
),
);
}
}

class MapWindow extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Map'),
),
body: GoogleMap(
initialCameraPosition: CameraPosition(
target: LatLng(24.7136, 46.6753), // Riyadh city coordinates
zoom: 14,
),
markers: {
Marker(
markerId: const MarkerId('riyadh'),
position: LatLng(24.7136, 46.6753), // Riyadh city coordinates
),
},
),
);
}
}