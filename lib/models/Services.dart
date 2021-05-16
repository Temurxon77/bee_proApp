class Services {
  final int servicesID;
  final int companyID;
  final int serviceType;
  final String titleUZ;
  final String titleRU;
  final String descriptionRU;
  final String descriptionUZ;
  final String activationCode;

  Services(this.servicesID, this.companyID, this.serviceType, this.titleUZ, this.titleRU, this.descriptionRU, this.descriptionUZ, this.activationCode); 
  Services.fromJson(Map<String, dynamic> json)
      : servicesID = json['ServicesId'],
        companyID = json['CompanyId'],
        serviceType = json['ServiceType'],
        titleUZ = json['TitleUZ'],
        titleRU = json['TitleRU'],
        descriptionRU = json['DescriptionRU'],
        descriptionUZ = json['DescriptionUZ'],
        activationCode = json['ActivationCode'];

  Map<String, dynamic> toJson() => {
        'ServicesId': servicesID,
        'CompanyId': companyID,
        'ServiceType': serviceType,
        'TitleUZ': titleUZ,
        'TitleRU': titleRU,
        'DescriptionUZ': descriptionUZ,
        'DescriptionRU': descriptionRU,
        'ActivationCode': activationCode
      };
}