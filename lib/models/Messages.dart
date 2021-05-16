class Messages {
  final int messagesID;
  final int companyID;
  final int messageType;
  final String titleUZ;
  final String titleRU;
  final String descriptionRU;
  final String descriptionUZ;
  final String activationCode;

  Messages(this.messagesID, this.companyID, this.messageType, this.titleUZ, this.titleRU, this.descriptionRU, this.descriptionUZ, this.activationCode); 
  Messages.fromJson(Map<String, dynamic> json)
      : messagesID = json['MessagesId'],
        companyID = json['CompanyId'],
        messageType = json['MessageType'],
        titleUZ = json['TitleUZ'],
        titleRU = json['TitleRU'],
        descriptionRU = json['DescriptionRU'],
        descriptionUZ = json['DescriptionUZ'],
        activationCode = json['ActivationCode'];

  Map<String, dynamic> toJson() => {
        'MessagesId': messagesID,
        'CompanyId': companyID,
        'MessageType': messageType,
        'TitleUZ': titleUZ,
        'TitleRU': titleRU,
        'DescriptionUZ': descriptionUZ,
        'DescriptionRU': descriptionRU,
        'ActivationCode': activationCode
      };
}