// To parse this JSON data, do
//
//     final talent = talentFromJson(jsonString);

import 'dart:convert';

Talent talentFromJson(String str) => Talent.fromJson(json.decode(str));

String talentToJson(Talent data) => json.encode(data.toJson());

class Talent {
  Talent({
    this.pkTalent,
    this.talentId,
    this.talentName,
    this.jobRoleName,
    // this.talentHpp,
    this.talentHp,
    this.expLevel,
    this.talentSummaryName,
    this.talentSummaryHash,
    // this.isChecked,
    this.talentImageHash,
    this.talentExperience,
  });

  String? pkTalent;
  String? talentId;
  String? talentName;
  String? jobRoleName;
  // int? talentHpp;
  int? talentHp;
  String? expLevel;
  String? talentSummaryName;
  String? talentSummaryHash;
  // String? isChecked;
  String? talentImageHash;
  int? talentExperience;

  factory Talent.fromJson(Map<String, dynamic> json) => Talent(
        pkTalent: json["PK_Talent"],
        talentId: json["Talent_ID"],
        talentName: json["Talent_Name"],
        jobRoleName: json["JobRole_Name"],
        // talentHpp: json["Talent_HPP"],
        talentHp: json["Talent_HP"],
        expLevel: json["Exp_Level"],
        talentSummaryName: json["Talent_SummaryName"],
        talentSummaryHash: json["Talent_SummaryHash"],
        // isChecked: json["isChecked"],
        talentImageHash: json["Talent_ImageHash"],
        talentExperience: json["Talent_Experience"],
      );

  Map<String, dynamic> toJson() => {
        "PK_Talent": pkTalent,
        "Talent_ID": talentId,
        "Talent_Name": talentName,
        "JobRole_Name": jobRoleName,
        // "Talent_HPP": talentHpp,
        "Talent_HP": talentHp,
        "Exp_Level": expLevel,
        "Talent_SummaryName": talentSummaryName,
        "Talent_SummaryHash": talentSummaryHash,
        // "isChecked": isChecked,
        "Talent_ImageHash": talentImageHash,
        "Talent_Experience": talentExperience,
      };
}
