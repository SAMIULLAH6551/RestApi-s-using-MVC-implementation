import 'package:all_rest_apis/controllers/covid_19_controller.dart';
import 'package:flutter/material.dart';

import 'country_details.dart';

class CountriesList extends StatefulWidget {
  CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final Covid19Controller covid19controller = Covid19Controller();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countires List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              decoration: const InputDecoration(
                  hintText: "Enter Country Name to Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: covid19controller.countriesData(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const Center(
                        child: Text("Internet Connection Error"),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text("No Data Found"),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String country =
                                snapshot.data![index]['country'].toString();

                            if (searchController.text.isEmpty) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CountryDetails(
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                image: snapshot.data![index]
                                                        ['countryInfo']['flag']
                                                    .toString(),
                                                name: snapshot.data![index]
                                                        ['country']
                                                    .toString(),
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                totalRecovered: snapshot
                                                    .data![index]['recovered'],
                                              )));
                                },
                                child: Card(
                                  child: ListTile(
                                    trailing: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 30,
                                        width: 30,
                                        image: NetworkImage(snapshot
                                            .data![index]['countryInfo']['flag']
                                            .toString())),
                                    title: Text(snapshot.data![index]['country']
                                        .toString()),
                                    subtitle: Text(snapshot.data![index]
                                            ['countryInfo']['iso3']
                                        .toString()),
                                  ),
                                ),
                              );
                            } else if (country.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CountryDetails(
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                image: snapshot.data![index]
                                                        ['countryInfo']['flag']
                                                    .toString(),
                                                name: snapshot.data![index]
                                                        ['country']
                                                    .toString(),
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                totalRecovered: snapshot
                                                    .data![index]['recovered'],
                                              )));
                                  searchController.clear();
                                },
                                child: Card(
                                  child: ListTile(
                                    trailing: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 30,
                                        width: 30,
                                        image: NetworkImage(snapshot
                                            .data![index]['countryInfo']['flag']
                                            .toString())),
                                    title: Text(snapshot.data![index]['country']
                                        .toString()),
                                    subtitle: Text(snapshot.data![index]
                                            ['countryInfo']['iso3']
                                        .toString()),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  })),
        ],
      ),
    );
  }
}
