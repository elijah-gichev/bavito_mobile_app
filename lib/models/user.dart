class User {
  final int id;

  final String email;
  final String phone;
  final String name;
  final String surname;

  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.surname,
  });

  factory User.sample() {
    const id = 1;

    const email = "email@email.ru";
    const phone = "89086789045";
    const name = "Vladimir";
    const surname = "Zhavoronkov";

    final user = User(
      id: id,
      email: email,
      phone: phone,
      name: name,
      surname: surname,
    );

    return user;
  }
}
