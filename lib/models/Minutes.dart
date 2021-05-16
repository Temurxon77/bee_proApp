class Minutes {
  final int minutesID;
  final int companyID;
  final String titleUZ;
  final String titleRU;
  final String descriptionRU;
  final String descriptionUZ;
  final String activationCode;

  Minutes(this.minutesID, this.companyID, this.titleUZ, this.titleRU, this.descriptionRU, this.descriptionUZ, this.activationCode); 
  Minutes.fromJson(Map<String, dynamic> json)
      : minutesID = json['MinutesId'],
        companyID = json['CompanyId'],
        titleUZ = json['TitleUZ'],
        titleRU = json['TitleRU'],
        descriptionRU = json['DescriptionRU'],
        descriptionUZ = json['DescriptionUZ'],
        activationCode = json['ActivationCode'];

  Map<String, dynamic> toJson() => {
        'MinutesId': minutesID,
        'CompanyId': companyID,
        'TitleUZ': titleUZ,
        'TitleRU': titleRU,
        'DescriptionUZ': descriptionUZ,
        'DescriptionRU': descriptionRU,
        'ActivationCode': activationCode
      };
}