class Vendor {
  String? firstName;
  String? lastName;
  String? email;

  Vendor({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Vendor.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'] as String?;
    email = json['email'] as String?;
    lastName = json['secondName'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'email': email,
      'secondName': lastName,
    };
  }
}
