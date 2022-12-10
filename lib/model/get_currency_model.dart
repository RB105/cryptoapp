// To parse this JSON data, do
//
//     final getCurrencyModel = getCurrencyModelFromJson(jsonString);

// ignore_for_file: prefer_conditional_assignment, unnecessary_new

import 'dart:convert';

List<GetCurrencyModel> getCurrencyModelFromJson(String str) => List<GetCurrencyModel>.from(json.decode(str).map((x) => GetCurrencyModel.fromJson(x)));

String getCurrencyModelToJson(List<GetCurrencyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCurrencyModel {
    GetCurrencyModel({
        this.title,
        this.code,
        this.cbPrice,
        this.nbuBuyPrice,
        this.nbuCellPrice,
        this.date,
    });

    String? title;
    String? code;
    String? cbPrice;
    String? nbuBuyPrice;
    String? nbuCellPrice;
    Date? date;

    factory GetCurrencyModel.fromJson(Map<String, dynamic> json) => GetCurrencyModel(
        title: json["title"],
        code: json["code"],
        cbPrice: json["cb_price"],
        nbuBuyPrice: json["nbu_buy_price"],
        nbuCellPrice: json["nbu_cell_price"],
        date: dateValues.map[json["date"]],
    );

  get length => null;

    Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
        "cb_price": cbPrice,
        "nbu_buy_price": nbuBuyPrice,
        "nbu_cell_price": nbuCellPrice,
        "date": dateValues.reverse![date],
    };
}

enum Date { THE_07122022 }

final dateValues = EnumValues({
    "07.12.2022": Date.THE_07122022
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
