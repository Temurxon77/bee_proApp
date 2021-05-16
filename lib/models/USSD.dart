class USSD {
  final int ussdID;
  final String titleUZ;
  final String titleRU;
  final int companyID;
  final String activationCode;

  USSD(this.ussdID, this.titleUZ, this.titleRU, this.companyID, this.activationCode); 

  USSD.fromJson(Map<String, dynamic> json)
      : ussdID = json['UssdId'],
        titleUZ = json['TitleUZ'],
        titleRU = json['TitleRU'],
        companyID = json['CompanyId'],
        activationCode = json['ActivationCode'];

  Map<String, dynamic> toJson() => {
        'UssdId': ussdID,
        'TitleUZ': titleUZ,
        'TitleRU': titleRU,
        'CompanyID': companyID,
        'ActivationCode': activationCode
      };
}