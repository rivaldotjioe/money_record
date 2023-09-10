class History {
  History({
      this.idHistory, 
      this.idUser, 
      this.type, 
      this.date, 
      this.total, 
      this.details, 
      this.createdAt, 
      this.updatedAt,});

  History.fromJson(dynamic json) {
    idHistory = json['id_history'];
    idUser = json['id_user'];
    type = json['type'];
    date = json['date'];
    total = json['total'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? idHistory;
  String? idUser;
  String? type;
  String? date;
  String? total;
  String? details;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_history'] = idHistory;
    map['id_user'] = idUser;
    map['type'] = type;
    map['date'] = date;
    map['total'] = total;
    map['details'] = details;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}