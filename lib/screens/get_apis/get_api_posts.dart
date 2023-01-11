import 'package:all_rest_apis/controllers/get_api_controller.dart';
import 'package:flutter/material.dart';

class GetApiPosts extends StatelessWidget {
  GetApiPosts({Key? key}) : super(key: key);
  final GetApiController getApiController = GetApiController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api Simple"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
                future: getApiController.getApiPosts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: getApiController.postList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].title.toString()),
                            subtitle:
                                Text(snapshot.data![index].body.toString()),
                            leading: Text(snapshot.data![index].id.toString()),
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
                    return Center(child: const Text("No Data Found"));
                  }
                }),
          )
        ],
      ),
    );
  }
}
