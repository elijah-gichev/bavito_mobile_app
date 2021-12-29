import 'dart:convert';

import 'package:bavito/models/user.dart';

class Good {
  final int id;
  final User owner;

  final String title;
  final String description;
  final String imgSrc;

  final bool isMy;
  final int pricePoints;

  Good(
      {required this.id,
      required this.owner,
      required this.title,
      required this.description,
      required this.imgSrc,
      required this.pricePoints,
      bool? isMy})
      : isMy = isMy ?? false;

  factory Good.sample1() {
    const id = 1;

    const title = 'yandex logo';
    const description = 'yandex logo is beautiful';
    const imgSrc =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Yandex_Browser_logo.svg/1200px-Yandex_Browser_logo.svg.png';
    const pricePoints = 100;

    const isMy = true;

    final user = User.sample1();

    final good = Good(
      id: id,
      owner: user,
      title: title,
      description: description,
      imgSrc: imgSrc,
      pricePoints: pricePoints,
      isMy: isMy,
    );

    return good;
  }

  factory Good.sample2() {
    const id = 2;

    const title = 'google logo';
    const description = 'google logo is beautiful but yandex not';
    const imgSrc =
        'https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1';
    const pricePoints = 200;

    final user = User.sample2();

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'owner': owner.toMap(),
      'title': title,
      'description': description,
      'imgSrc': imgSrc,
      'isMy': isMy,
      'pricePoints': pricePoints,
    };
  }

  factory Good.fromMap(Map<String, dynamic> map, User owner) {
    return Good(
      id: map['id']?.toInt() ?? 0,
      owner: owner,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imgSrc: map['image_url'] ?? '',
      pricePoints: map['points']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Good.fromJson(String source, User owner) => Good.fromMap(
        json.decode(source),
        owner,
      );
}
