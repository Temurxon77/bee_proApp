class Tariffs {
  final int tariffID;
  final int companyID;
  final String titleUZ;
  final String titleRU;
  final String descriptionRU;
  final String descriptionUZ;
  final String annualPrice;
  final String internetTraffic;
  final String calls;
  final int isArchieved;
  final String activationCode;

  Tariffs(this.tariffID, this.companyID,this.annualPrice,this.calls,this.internetTraffic,this.isArchieved, this.titleUZ, this.titleRU, this.descriptionRU, this.descriptionUZ, this.activationCode); 
  Tariffs.fromJson(Map<String, dynamic> json)
      : tariffID = json['TariffId'],
        companyID = json['CompanyId'],
        titleUZ = json['TitleUZ'],
        titleRU = json['TitleRU'],
        descriptionRU = json['DescriptionRU'],
        descriptionUZ = json['DescriptionUZ'],
        annualPrice = json['AnnualPrice'],
        internetTraffic = json['InternetTraffic'],
        calls = json['Calls'],
        isArchieved = json['isArchieved'],
        activationCode = json['ActivationCode'];

  Map<String, dynamic> toJson() => {
        'TariffId': tariffID,
        'CompanyId': companyID,
        'TitleUZ': titleUZ,
        'TitleRU': titleRU,
        'DescriptionUZ': descriptionUZ,
        'DescriptionRU': descriptionRU,
        'ActivationCode': activationCode
      };
}