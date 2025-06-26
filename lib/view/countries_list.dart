import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Services/states_services.dart';
import 'detail_screen.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search With Country Name",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),

            // FutureBuilder inside Expanded to give ListView a height
            Expanded(
              child: FutureBuilder(
                future: stateServices.fetchCountries(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              color: Colors.white,
                            ),
                            title: Container(
                              height: 10,
                              width: 60,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 60,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var country = snapshot.data![index];
                        var name = snapshot.data![index]['country'];
                        if (searchController.text.isEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    name: name,
                                    image: country['countryInfo']['flag'],
                                    totalCases: country['cases'],
                                    totalDeaths: country['deaths'],
                                    totalRecovered: country['recovered'],
                                    active: country['active'],
                                    critical: country['critical'],
                                    todayRecovered: country['todayRecovered'],
                                    todayDeaths: country['todayDeaths'],
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Image.network(
                                country['countryInfo']['flag'],
                                height: 40,
                                width: 40,
                              ),
                              title: Text(country['country']),
                              subtitle: Text(country['cases'].toString()),
                            ),
                          );
                        } else if (name.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        )) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    name: name,
                                    image: country['countryInfo']['flag'],
                                    totalCases: country['cases'],
                                    totalDeaths: country['deaths'],
                                    totalRecovered: country['recovered'],
                                    active: country['active'],
                                    critical: country['critical'],
                                    todayRecovered: country['todayRecovered'],
                                    todayDeaths: country['todayDeaths'],
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Image.network(
                                country['countryInfo']['flag'],
                                height: 40,
                                width: 40,
                              ),
                              title: Text(country['country']),
                              subtitle: Text(country['cases'].toString()),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
