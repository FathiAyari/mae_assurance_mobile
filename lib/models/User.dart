class User {
  final int? id;
  final String? email;
  final String? name;
  final String? lastName;
  final String? region;
  final String? phoneNumber;
  final String? gender;
  String? token;

  User({
    this.id,
    this.email,
    this.name,
    this.lastName,
    this.region,
    this.phoneNumber,
    this.gender,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      lastName: json['last_name'] as String?,
      region: json['region'] as String?,
      phoneNumber: json['phone_number'] as String?,
      gender: json['gender'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['last_name'] = lastName;
    data['region'] = region;
    data['phone_number'] = phoneNumber;
    data['gender'] = gender;
    data['token'] = token;
    return data;
  }
}
