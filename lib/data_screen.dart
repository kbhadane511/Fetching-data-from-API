import 'package:api_integration/api_services.dart';
import 'package:api_integration/data_model.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool isReady = false;
  DataModel apiData = DataModel();

  _getData() {
    isReady = true;
    ApiServices().getDataWithModel().then((val) {
      setState(() {
        apiData = val!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Data From Model"),
        ),
        body: isReady == true
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text(apiData.page.toString()),
                  Expanded(
                    child: ListView.builder(
                        itemCount: apiData.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Text(apiData.data![index].id.toString()),
                              title: Text(apiData.data![index].name.toString()),
                              subtitle:
                                  Text(apiData.data![index].year.toString()),
                            ),
                          );
                        }),
                  )
                ],
              ));
  }
}
