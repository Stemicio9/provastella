



import 'general_client.dart';

class EmployesRepository {

  static final EmployesRepository _instance = EmployesRepository._internal();

  String baseUrl = 'https://dummyjson.com/';


  factory EmployesRepository() {
    return _instance;
  }

  EmployesRepository._internal() {
    // initialization logic
  }


  Future<List<dynamic>> fetchAllEmployes() async {
    try {
      var response = await Client().dio.get('${baseUrl}products');
      print(response.data);
      return response.data["products"];
    }catch(e){
      print("ERRORE");
      print(e);
      return [];
    }
  }



}