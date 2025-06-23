import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pie_chart/pie_chart.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:  Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              PieChart(
                  chartLegendSpacing: 48,
                  ringStrokeWidth: 20,
                  dataMap: {
                    "Total Cases": 25,
                    "Recovered": 21,
                    "Deaths": 10

                  },
              animationDuration: Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions: LegendOptions(
                  showLegends: true,

                  legendPosition: LegendPosition.left,
                ),
                colorList: [
                  Colors.blue,
                  Colors.green,
                  Colors.red
                ],
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,

              ),),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.06),
                child: Card(

                  child: Column(

                    children: [
                      ReusableRow(title: "Total ", value: "200"),
                      ReusableRow(title: "Total ", value: "200"),
                      ReusableRow(title: "Total ", value: "200"),
                    ],
                  ),
                ),
               
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(10)

                ),
                child: Center(child: Text("Track Countries")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title,value;
   ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)
            ],
          ),
          SizedBox(height: 5,),
          Divider()
        ],
      ),
    );
  }
}

