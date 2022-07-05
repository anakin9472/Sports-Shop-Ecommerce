import 'dart:convert';

List<Account> accountFromJson(String str) =>
    List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));

// Account AccountFromJson(String str) =>
//     Account.from(json.decode(str).map((x) => Account.fromJsonOneAccount(x)));

String accountToJson(List<Account> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Account {
  late String accountId, fullName, email, phone, region, pass;

  Account({
    required this.accountId,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.region,
    required this.pass,
    this.body,
  });

  Account.fromAccount({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.region,
    required this.pass,
    this.body,
  });

  String? body;
  factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountId: json["AccountId"].toString(),
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        region: json["region"],
        pass: json["pass"],
        body: json["body"],
      );

  // factory Account.fromJsonOneAccount(Map<String, dynamic> parsedJson) => Account(
  //     accountId: parsedJson["AccountId"].toString(),
  //     fullName: parsedJson["fullName"],
  //     email: parsedJson["email"],
  //     phone: parsedJson["phone"],
  //     region: parsedJson["region"],
  //     pass: parsedJson["pass"],
  //     body: parsedJson["body"],
  //   );

  Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "region": region,
        "pass": pass,
        "body": body,
      };

  Map<String, dynamic> toJsonNonId() => {
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "region": region,
        "pass": pass,
      };
}
