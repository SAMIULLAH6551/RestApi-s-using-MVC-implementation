import 'package:all_rest_apis/controllers/get_api_controller.dart';
import 'package:flutter/material.dart';

class GetApiUsers extends StatelessWidget {
  GetApiUsers({Key? key}) : super(key: key);
  final GetApiController getApiController = GetApiController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api Users"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
                future: getApiController.getApiUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: getApiController.userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ReusableWidget(
                                    title: 'ID :',
                                    data: snapshot.data![index].id.toString()),
                                ReusableWidget(
                                    title: 'Name :',
                                    data:
                                        snapshot.data![index].name.toString()),
                                ReusableWidget(
                                    title: 'Username :',
                                    data: snapshot.data![index].username
                                        .toString()),
                                ReusableWidget(
                                    title: 'Email :',
                                    data:
                                        snapshot.data![index].email.toString()),
                                ReusableWidget(
                                    title: 'Phone :',
                                    data:
                                        snapshot.data![index].phone.toString()),
                                ReusableWidget(
                                    title: 'Website :',
                                    data: snapshot.data![index].website
                                        .toString()),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Address",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ReusableWidget(
                                    title: "Street :",
                                    data: snapshot.data![index].address!.street
                                        .toString()),
                                ReusableWidget(
                                    title: "Suite :",
                                    data: snapshot.data![index].address!.suite
                                        .toString()),
                                ReusableWidget(
                                    title: "City :",
                                    data: snapshot.data![index].address!.city
                                        .toString()),
                                ReusableWidget(
                                    title: "ZipCode :",
                                    data: snapshot.data![index].address!.zipcode
                                        .toString()),
                              ],
                            ),
                          );
                        });
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return const Center(
                      child: Text("Internet Connection Error"),
                    );
                  } else {
                    return Center(child: const Text("No Data Found"));
                  }
                }),
          )
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  ReusableWidget({Key? key, required this.title, required this.data})
      : super(key: key);

  String title;
  String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(data),
        ],
      ),
    );
  }
}
