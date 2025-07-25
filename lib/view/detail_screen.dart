
import 'package:covid/view/state_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered, todayDeaths;
   DetailScreen({required this.name, required this.image, required this.totalCases, required this.totalDeaths, required this.totalRecovered, required this.active, required this.critical, required this.todayRecovered, required this.todayDeaths});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                child: Card(
                  child: Column(
                   children: [

                     SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                     ReusableRow(title: "Total Cases", value: widget.totalCases.toString()),
                     ReusableRow(title: "Active", value: widget.active.toString()),
                     ReusableRow(title: "Today Recovered", value: widget.todayRecovered.toString()),
                     ReusableRow(title: "Today Deaths", value: widget.todayDeaths.toString()),
                     ReusableRow(title: "Total Deaths", value: widget.totalDeaths.toString()),
                     ReusableRow(title: "Critical ", value: widget.critical.toString()),
                     ReusableRow(title: "Total Recovered", value: widget.totalRecovered.toString()),

                   ],
                  ),
                ),
              ),
              CircleAvatar(
                // minRadius: 50,
                radius: 50,
                backgroundImage: NetworkImage(widget.image,

                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
