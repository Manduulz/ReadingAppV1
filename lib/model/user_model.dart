class User {
  final String firstName;
  final String lastName;
  final String email;
  final int phoneNumber;
  final String passWord;

  const User(this.passWord,
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber});
}
