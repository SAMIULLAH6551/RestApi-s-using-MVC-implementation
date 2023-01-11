import 'package:all_rest_apis/controllers/covid_19_controller.dart';
import 'package:all_rest_apis/models/world_states_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import 'countries_list.dart';

class CovidUpdate extends StatelessWidget {
  CovidUpdate({Key? key}) : super(key: key);
  Covid19Controller covid19controller = Covid19Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid 19 live Update"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                  future: covid19controller.worldData(),
                  builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text("No Data Found"),
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              'Total':
                                  double.parse(snapshot.data!.cases.toString()),
                              'Recovered': double.parse(
                                  snapshot.data!.recovered.toString()),
                              'Deaths': double.parse(
                                  snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            colorList: const [
                              Colors.greenAccent,
                              Colors.lightBlueAccent,
                              Colors.redAccent,
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            elevation: 10,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Resuable(
                                      title: "Total",
                                      value: snapshot.data!.cases.toString()),
                                  Resuable(
                                      title: "Deaths",
                                      value: snapshot.data!.deaths.toString()),
                                  Resuable(
                                      title: "Recoverd",
                                      value:
                                          snapshot.data!.recovered.toString()),
                                  Resuable(
                                      title: "Active",
                                      value: snapshot.data!.active.toString()),
                                  Resuable(
                                      title: "Critical",
                                      value:
                                          snapshot.data!.critical.toString()),
                                  Resuable(
                                      title: "Today Cases",
                                      value:
                                          snapshot.data!.todayCases.toString()),
                                  Resuable(
                                      title: "Today Deaths",
                                      value: snapshot.data!.todayDeaths
                                          .toString()),
                                  Resuable(
                                      title: "Today Recovered",
                                      value: snapshot.data!.todayRecovered
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(() => CountriesList());
                              },
                              child: const Text("Track Countries")),
                        ],
                      );
                    }
                  }),
            ),
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
