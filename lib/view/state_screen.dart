import 'package:covid/Services/states_services.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Model/WorldStatesModel.dart';
import 'countries_list.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
  )..repeat();

  @override

  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return  Scaffold(
      body: SafeArea(
        child:  Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              FutureBuilder(future: stateServices.fetchWorldStateRecord(),
                  builder: (contex, AsyncSnapshot<WorldStatesModel> snapshot){

                if(!snapshot.hasData){
                  return Expanded(
                    flex: 1,
                      child:SpinKitFadingCircle(
                        size: 50,
                        controller: _controller,
                  color: Colors.white,)
                  );
                }
                else{
                  return Column(
                    children: [
                      PieChart(
                        chartLegendSpacing: 48,
                        ringStrokeWidth: 20,
                        dataMap: {
                          "Total Cases": double.parse(snapshot.data!.cases!.toString()),
                          "Recovered": double.parse(snapshot.data!.recovered!.toString()),
                          "Deaths": double.parse(snapshot.data!.deaths!.toString())
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
                              ReusableRow(title: "Total ", value: snapshot.data!.cases.toString()),
                              ReusableRow(title: "Recovered ", value: snapshot.data!.recovered.toString()),
                              ReusableRow(title: "Death  ", value: snapshot.data!.deaths.toString()),
                              ReusableRow(title: "Active  ", value: snapshot.data!.active.toString()),
                              ReusableRow(title: "Critical ", value: snapshot.data!.critical.toString()),
                              ReusableRow(title: "Today Deaths", value: snapshot.data!.todayDeaths.toString()),
                              ReusableRow(title: "Today Recoverd  ", value: snapshot.data!.todayRecovered.toString()),
                            ],
                          ),
                        ),

                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesList()));
                    },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10)

                          ),
                          child: Center(child: Text("Track Countries")),
                        ),
                      ),
                    ],);
                }
                  }
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

