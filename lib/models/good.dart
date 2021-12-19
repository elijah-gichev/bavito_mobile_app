import 'package:bavito/models/user.dart';

class Good {
  final int id;
  final User owner;

  final String title;
  final String description;
  final String imgSrc;

  final int pricePoints;

  Good({
    required this.id,
    required this.owner,
    required this.title,
    required this.description,
    required this.imgSrc,
    required this.pricePoints,
  });

  factory Good.sample() {
    const id = 1;

    const title = 'yandex logo';
    const description = 'yandex logo is beautiful';
    const imgSrc =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Yandex_Browser_logo.svg/1200px-Yandex_Browser_logo.svg.png';
    const pricePoints = 100;

    final user = User.sample();

    final good = Good(
      id: id,
      owner: user,
      title: title,
      description: description,
      imgSrc: imgSrc,
      pricePoints: pricePoints,
    );

    return good;
  }
}
