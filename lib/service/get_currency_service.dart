// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:cryptoapp/model/get_currency_model.dart';
import 'package:dio/dio.dart';

class GetCurrencyService {
    static Future<dynamic> getCurrency() async {
    try {
      Response response = await Dio().get(
          "https://nbu.uz/uz/exchange-rates/json/");

      if (response.statusCode == 200) {
        return (response.data);
      } else {
        return (response.data);
      }
    } catch (e) {
      return [];
    }
  }
}
