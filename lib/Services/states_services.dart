import 'dart:convert';

import 'package:covid/Model/WorldStatesModel.dart';
import 'package:covid/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices{

  Future<WorldStatesModel> fetchWorldStateRecord()async{

    final respones = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(respones.statusCode ==200){
      var data = jsonDecode(respones.body);
      return WorldStatesModel.fromJson(data);

    }
    else{
     throw Exception('Error');
    }

  }

  Future<List<dynamic>> fetchCountries()async{
     var data;
    final respones = await http.get(Uri.parse(AppUrl.countriesList));
    if(respones.statusCode ==200){
       data = jsonDecode(respones.body) ;
       print('api hitted');
      return data;
    }
    else{
      print('api not hitted');
      throw Exception('Error');
    }

  }


}