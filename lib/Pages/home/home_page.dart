// ignore_for_file: unnecessary_this

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  bool loading = true;

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  List data = [];

  Future makeRequest() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata;
    });

    //print(data[i]["name"]);
  }

  @override
  // ignore: must_call_super
  void initState() {
    this.makeRequest();
    // ignore: unused_local_variable
    var loading = false;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var loading;
    return Scaffold(
      appBar: AppBar(
        primary: false,
        toolbarHeight: 75,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "History",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(width: 170),
            const Icon(
              CupertinoIcons.chart_bar,
              size: 20,
              color: Colors.black,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Sort/Filter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: loading == true
                ? const Center(
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator()))
                : ListView.builder(
                    // ignore: unnecessary_null_comparison
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, i) {
                      var coinPercentChange =
                          data[i]["price_change_percentage_24h"].toString();

                      var coinPriceChangeAmount =
                          data[i]["ath_change_percentage"].toStringAsFixed(2);
                      // ignore: unused_local_variable
                      var coinLastUpdated =
                          data[i]["last_updated"].toString().substring(0, 10);
                      var coinImage = data[i]["image"];

                      var coinData = data[i]["name"];

                      return ListTile(
                          title: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: const [
                                  Center(child: Text("Received")),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    coinPercentChange,
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    coinData,
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Text(DateFormat("MMM d,  y  ")
                              .add_jm()
                              .format(DateTime.now())),
                          trailing: Text(
                            coinPriceChangeAmount,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 22,
                            ),
                          ),
                          leading: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 200.0,
                            width: 70.0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: CircleAvatar(
                                radius: 55.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(coinImage),
                              ),
                            ),
                          ));
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
