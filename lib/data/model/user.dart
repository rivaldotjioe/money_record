class User {
  User({
      this.idUser, 
      this.name, 
      this.email, 
      this.password, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    idUser = json['id_user'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? idUser;
  String? name;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_user'] = idUser;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}