class User {
  final String firstName;
  final String lastName;
  final String email;
  final String idNumber;
  final String? idURL;
  final String? selfieURL;
  final bool isVerified;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.idNumber,
    required this.idURL,
    required this.selfieURL,
    required this.isVerified,
  });
}
