import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  CountryDetails(
      {Key? key,
      required this.todayRecovered,
      required this.critical,
      required this.active,
      required this.image,
      required this.name,
      required this.test,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered})
      : super(key: key);
  String? image, name;
  int? totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.toString()),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        Resuable(title: 'Cases', value: totalCases.toString()),
                        Resuable(
                          title: 'Recovered',
                          value: totalRecovered.toString(),
                        ),
                        Resuable(
                          title: 'Death',
                          value: totalDeaths.toString(),
                        ),
                        Resuable(
                          title: 'Critical',
                          value: critical.toString(),
                        ),
                        Resuable(
                          title: 'Today Recovered',
                          value: totalRecovered.toString(),
                        ),
                      ],
                    ), // Column
                  ), // Card
                ), // Padding
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(image.toString()),
                ) // CircleAvatar
              ],
            ) // Stack
          ],
        ),
      ),
    );
  }
}

class Resuable extends StatelessWidget {
  Resuable({Key? key, required this.title, required this.value})
      : super(key: key);

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
