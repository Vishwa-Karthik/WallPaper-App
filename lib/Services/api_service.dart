import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../Models/wallpaper.dart';

String apiKey = dotenv.env['apiKey'] ?? '';

class ApiService {
  //* fetch images
  static Future<List> getImage() async {
    List<Wallpaper> listOfImages = [];

    String url = 'https://api.pexels.com/v1/curated?per_page=75&page=1';
    var responseData = await http.get(
      Uri.parse(url),
      headers: {
        "authorization": apiKey,
      },
    );

    if (responseData.statusCode == 200) {
      var jsonData = jsonDecode(responseData.body);
      var data = jsonData['photos'];

      for (var item in data.toList()) {
        listOfImages.add(Wallpaper.fromJson(item));
      }
    } else {
      debugPrint("Error: ${responseData.statusCode}");
    }
    return listOfImages;
  }
}
