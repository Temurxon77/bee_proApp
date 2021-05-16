class Internet {
  final int internetID;
  final String titleUZ;
  final String titleRU;
  final int companyID;
  final String descriptionUZ;
  final String descriptionRU;
  final String activationCode;

  Internet(this.internetID, this.titleUZ, this.titleRU, this.companyID, this.descriptionUZ, this.descriptionRU, this.activationCode); 

  Internet.fromJson(Map<String, dynamic> json)
      : internetID = json['InternetId'],
        titleUZ = json['TitleUZ'],
        titleRU = json['TitleRU'],
        companyID = json['CompanyId'],
        descriptionUZ = json['DescriptionUZ'],
        descriptionRU = json['DescriptionRU'],
        activationCode = json['ActivationCode'];

  Map<String, dynamic> toJson() => {
        'InternetId': internetID,
        'TitleUZ': titleUZ,
        'TitleRU': titleRU,
        'CompanyId': companyID,
        'DescriptionUZ': descriptionUZ,
        'DescriptionRU': descriptionRU,
        'ActivationCode': activationCode
      };
}