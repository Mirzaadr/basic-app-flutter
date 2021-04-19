import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.pkLoginUser,
    this.userEmail,
    this.userName,
    this.userPosition,
    this.fkRoleUser,
    this.userImageName,
    this.userImageHash,
    this.token,
    this.userInternal,
    this.companyName,
    this.companyEmail,
    this.companyAddress,
    this.fkProvince,
    this.fkCity,
    this.companyPhone,
    this.companyLogoHash,
  });

  int? pkLoginUser;
  String? userEmail;
  String? userName;
  String? userPosition;
  int? fkRoleUser;
  String? userImageName;
  String? userImageHash;
  String? token;
  bool? userInternal;
  String? companyName;
  String? companyEmail;
  String? companyAddress;
  int? fkProvince;
  int? fkCity;
  String? companyPhone;
  String? companyLogoHash;

  factory User.fromJson(Map<String, dynamic> json) => User(
        pkLoginUser: json["PK_Login_User"],
        userEmail: json["User_Email"],
        userName: json["User_Name"],
        userPosition: json["User_Position"],
        fkRoleUser: json["FK_Role_User"],
        userImageName: json["User_ImageName"],
        userImageHash: json["User_ImageHash"],
        token: json["Token"],
        userInternal: json["User_Internal"],
        companyName: json["Company_Name"],
        companyEmail: json["Company_Email"],
        companyAddress: json["Company_Address"],
        fkProvince: json["FK_Province"],
        fkCity: json["FK_City"],
        companyPhone: json["Company_Phone"],
        companyLogoHash: json["Company_LogoHash"],
      );

  Map<String, dynamic> toJson() => {
        "PK_Login_User": pkLoginUser,
        "User_Email": userEmail,
        "User_Name": userName,
        "User_Position": userPosition,
        "FK_Role_User": fkRoleUser,
        "User_ImageName": userImageName,
        "User_ImageHash": userImageHash,
        "Token": token,
        "User_Internal": userInternal,
        "Company_Name": companyName,
        "Company_Email": companyEmail,
        "Company_Address": companyAddress,
        "FK_Province": fkProvince,
        "FK_City": fkCity,
        "Company_Phone": companyPhone,
        "Company_LogoHash": companyLogoHash,
      };
}
