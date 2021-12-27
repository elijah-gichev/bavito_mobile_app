import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'name': name,
      'surname': surname,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
