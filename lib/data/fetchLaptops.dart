import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/standartized_laptop_data.dart';

Future<List<LaptopData>> fetchLaptops() async {
  final url = Uri.parse('https://kind.io.tudelft.nl/replanit/api/AllLaptopDPPs');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Parse the response body into a dynamic list
    List test = jsonDecode(response.body);
    List<LaptopData> data = [];
    test.forEach((element) {
     data.add(standardizedLaptopData(element));
    });
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<LaptopData>fetchNewLaptop(id) async {
  final baseURL = 'https://kind.io.tudelft.nl/replanit/api';
  final endpoint = '/LaptopDPP/$id';
  final url = Uri.parse('$baseURL$endpoint');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return standardizedLaptopData(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Map<String, dynamic>> fetchLaptopByUri(String uri) async {
  final url = Uri.parse(uri);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}
