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

  factory User.sample1() {
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

  factory User.sample2() {
    const id = 2;

    const email = "notemail@notemail.ru";
    const phone = "89086789046";
    const name = "Alexey";
    const surname = "Fedotov";

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
