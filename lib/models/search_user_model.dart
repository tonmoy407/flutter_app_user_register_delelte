class SearchUserModel {
  User? user;

  SearchUserModel({this.user});

  SearchUserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? mobileNo;
  String? address;
  String? createdOn;
  int? iV;

  User(
      {this.sId,
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.mobileNo,
        this.address,
        this.createdOn,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    mobileNo = json['mobileNo'];
    address = json['address'];
    createdOn = json['createdOn'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['mobileNo'] = this.mobileNo;
    data['address'] = this.address;
    data['createdOn'] = this.createdOn;
    data['__v'] = this.iV;
    return data;
  }
}
