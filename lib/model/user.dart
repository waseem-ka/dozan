class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String phoneNumber;
  final DateTime birthDate;
  final String password;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate.toIso8601String(),
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      birthDate: DateTime.parse(json['birthDate']),
      password: json['password'],
    );
  }
}

class Provider extends User {
  final String career;
  final List<String> skills;

  Provider({
    required int id,
    required String firstName,
    required String lastName,
    required String username,
    required String phoneNumber,
    required DateTime birthDate,
    required String password,
    required this.career,
    required this.skills,
  }) : super(
         id: id,
         firstName: firstName,
         lastName: lastName,
         username: username,
         phoneNumber: phoneNumber,
         birthDate: birthDate,
         password: password,
       );

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['career'] = career;
    json['skills'] = skills;
    return json;
  }

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      birthDate: DateTime.parse(json['birthDate']),
      password: json['password'],
      career: json['career'],
      skills: List<String>.from(json['skills']),
    );
  }
}
