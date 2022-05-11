class UserModel {
  String? name;
  String? role;
  String? place;
  String? city;
  String? branch;

  UserModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    place = json['place'];
    role = json['role'];
    name = json['name'];
    branch = json['branch'];
  }
}
