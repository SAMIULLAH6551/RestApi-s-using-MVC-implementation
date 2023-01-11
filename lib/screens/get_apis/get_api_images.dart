import 'package:all_rest_apis/controllers/get_api_controller.dart';
import 'package:flutter/material.dart';

class GetApiImages extends StatelessWidget {
  GetApiImages({Key? key}) : super(key: key);

  final GetApiController getApiController = GetApiController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api Medium"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
                future: getApiController.getApiImages(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: getApiController.imageList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://miro.medium.com/max/1400/1*3SLCJeRLl26EhCxY65EdZw.png"),
                            ),
                            title: Text(snapshot.data![index].title.toString()),
                            subtitle: Text(
                                "Album Id : ${snapshot.data![index].albumId.toString()}"),
                            trailing: Text(snapshot.data![index].id.toString()),
                          );
                        });
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return const Center(
                      child: Text("No Internet Connection"),
                    );
                  } else {
                    return const Center(child: Text("No Data Found"));
                  }
                }),
          )
        ],
      ),
    );
  }
}
