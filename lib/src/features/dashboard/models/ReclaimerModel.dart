import 'child.dart';

class ReclaimerModel {
  final String? id;
  String? fullName;
  String? primaryMobileNumber;
  String? emailId;
  int familyCount;
  List<Map<String, String>>? children;
  int capacityPerDay;
  String? smallScrapDealerName;
  String? collectionCenter;
  String? country;
  String? state;
  String? district;
  String? city;
  String? pin;
  String? materialProvided;
  String? bankName;
  String? accountNumber;
  String? ifscCode;
  String? rationCardNo;
  String? voterIdCardNo;
  String? eShramCardNo;
  String? ayushCardNo;
  String? aadharCardNo;
  String? aadharCardFrontImage;
  String? aadharCardBackImage;
  String? profilePicImage;
  String? eventPicImage;
  String? loginUserEmail;
  String? loginUserName;
  String? loginUid;
  String? creationDate;

  ReclaimerModel(
  {
    this.id,
    this.fullName,
    this.primaryMobileNumber,
    this.emailId,
    this.familyCount=0,
    this.children,
    this.capacityPerDay=0,
    this.smallScrapDealerName,
    this.collectionCenter,
    this.country,
    this.state,
    this.district,
    this.city,
    this.pin,
    this.materialProvided,
    this.bankName,
    this.accountNumber,
    this.ifscCode,
    this.rationCardNo,
    this.voterIdCardNo,
    this.eShramCardNo,
    this.ayushCardNo,
    this.aadharCardNo,
    this.aadharCardFrontImage,
    this.aadharCardBackImage,
    this.profilePicImage,
    this.eventPicImage,
    this.loginUserEmail,
    this.loginUserName,
    this.loginUid,
    this.creationDate
});

  toJson() {
    return {
      "fullName": fullName,
      "primaryMobileNumber": primaryMobileNumber,
      "emailId": emailId,
      "familyCount": familyCount,
      "children": children,
      "country": country,
      "state": state,
      "district": district,
      "city": city,
      "pin": pin,
      "materialProvided": materialProvided,
      "bankName": bankName,
      "accountNumber": accountNumber,
      "ifscCode": ifscCode,
      "rationCardNo": rationCardNo,
      "voterIdCardNo": voterIdCardNo,
      "eShramCardNo": eShramCardNo,
      "ayushCardNo": ayushCardNo,
      "aadharCardNo": aadharCardNo,
      "aadharCardFrontImage": aadharCardFrontImage,
      "aadharCardBackImage": aadharCardBackImage,
      "profilePicImage": profilePicImage,
      "eventPicImage": eventPicImage,
      "loginUserEmail": loginUserEmail,
      "loginUserName": loginUserName,
      "loginUid": loginUid,
      "creationDate": creationDate,
    };
  }
}
