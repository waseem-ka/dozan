class ProviderModel {
  final String firstName;
  final String lastName;
  final String username;
  final String phoneNumber;
  final DateTime birthDate;
  final String password;
  final String address;
  final String mainCareer;
  final List<String> skills;

  ProviderModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
    required this.address,
    required this.mainCareer,
    required this.skills,
  });

  ProviderModel copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? phoneNumber,
    DateTime? birthDate,
    String? password,
    String? address,
    String? mainCareer,
    List<String>? skills,
  }) {
    return ProviderModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
      password: password ?? this.password,
      address: address ?? this.address,
      mainCareer: mainCareer ?? this.mainCareer,
      skills: skills ?? this.skills,
    );
  }

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      birthDate: DateTime.parse(json['birthDate']),
      password: json['password'],
      address: json['address'],
      mainCareer: json['mainCareer'],
      skills: List<String>.from(json['skills']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate.toIso8601String(),
      'password': password,
      'address': address,
      'mainCareer': mainCareer,
      'skills': skills,
    };
  }
}
