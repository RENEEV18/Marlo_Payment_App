// class GetTransactionModel {
//   List<Datum> data;

//   GetTransactionModel({
//     required this.data,
//   });

//   factory GetTransactionModel.fromJson(Map<String, dynamic> json) =>
//       GetTransactionModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

class GetTransactionModel {
  String id;
  String amount;
  String status;
  String sourceId;
  String sourceType;
  String transactionType;
  String currency;
  DateTime createdAt;
  int fee;
  String description;
  DateTime settledAt;
  String estimatedSettledAt;
  String currency1;

  GetTransactionModel({
    required this.id,
    required this.amount,
    required this.status,
    required this.sourceId,
    required this.sourceType,
    required this.transactionType,
    required this.currency,
    required this.createdAt,
    required this.fee,
    required this.description,
    required this.settledAt,
    required this.estimatedSettledAt,
    required this.currency1,
  });

  factory GetTransactionModel.fromJson(Map<String, dynamic> json) =>
      GetTransactionModel(
        id: json["id"],
        amount: json["amount"],
        status: json["status"],
        sourceId: json["sourceId"],
        sourceType: json["sourceType"],
        transactionType: json["transactionType"],
        currency: json["currency"],
        createdAt: DateTime.parse(json["createdAt"]),
        fee: json["fee"],
        description: json["description"],
        settledAt: DateTime.parse(json["settledAt"]),
        estimatedSettledAt: json["estimatedSettledAt"],
        currency1: json["currency1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "status": status,
        "sourceId": sourceId,
        "sourceType": sourceType,
        "transactionType": transactionType,
        "currency": currency,
        "createdAt": createdAt.toIso8601String(),
        "fee": fee,
        "description": description,
        "settledAt": settledAt.toIso8601String(),
        "estimatedSettledAt": estimatedSettledAt,
        "currency1": currency1,
      };
}





















// class GetTransactionModel {
//     String errorFlag;
//     String message;
//     bool hasMore;
//     List<GetTransactionModel> data;

//     GetTransactionModel({
//         required this.errorFlag,
//         required this.message,
//         required this.hasMore,
//         required this.data,
//     });

//     factory GetTransactionModel.fromJson(Map<String, dynamic> json) => GetTransactionModel(
//         errorFlag: json["error_flag"],
//         message: json["message"],
//         hasMore: json["has_more"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "error_flag": errorFlag,
//         "message": message,
//         "has_more": hasMore,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     String id;
//     String amount;
//     Status status;
//     String sourceId;
//     SourceType sourceType;
//     String transactionType;
//     Currency currency;
//     DateTime createdAt;
//     int fee;
//     String description;
//     DateTime settledAt;
//     String estimatedSettledAt;
//     String currency1;

//     Datum({
//         required this.id,
//         required this.amount,
//         required this.status,
//         required this.sourceId,
//         required this.sourceType,
//         required this.transactionType,
//         required this.currency,
//         required this.createdAt,
//         required this.fee,
//         required this.description,
//         required this.settledAt,
//         required this.estimatedSettledAt,
//         required this.currency1,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         amount: json["amount"],
//         status: statusValues.map[json["status"]]!,
//         sourceId: json["sourceId"],
//         sourceType: sourceTypeValues.map[json["sourceType"]]!,
//         transactionType: json["transactionType"],
//         currency: currencyValues.map[json["currency"]]!,
//         createdAt: DateTime.parse(json["createdAt"]),
//         fee: json["fee"],
//         description: json["description"],
//         settledAt: DateTime.parse(json["settledAt"]),
//         estimatedSettledAt: json["estimatedSettledAt"],
//         currency1: json["currency1"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "amount": amount,
//         "status": statusValues.reverse[status],
//         "sourceId": sourceId,
//         "sourceType": sourceTypeValues.reverse[sourceType],
//         "transactionType": transactionType,
//         "currency": currencyValues.reverse[currency],
//         "createdAt": createdAt.toIso8601String(),
//         "fee": fee,
//         "description": description,
//         "settledAt": settledAt.toIso8601String(),
//         "estimatedSettledAt": estimatedSettledAt,
//         "currency1": currency1,
//     };
// }

// enum Currency { EMPTY, CURRENCY }

// final currencyValues = EnumValues({
//     "£": Currency.CURRENCY,
//     "\u0024": Currency.EMPTY
// });

// enum SourceType { DEPOSIT, CONVERSION, PAYOUT }

// final sourceTypeValues = EnumValues({
//     "CONVERSION": SourceType.CONVERSION,
//     "DEPOSIT": SourceType.DEPOSIT,
//     "PAYOUT": SourceType.PAYOUT
// });

// enum Status { SETTLED }

// final statusValues = EnumValues({
//     "SETTLED": Status.SETTLED
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
