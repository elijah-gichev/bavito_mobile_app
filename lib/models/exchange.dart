import 'package:bavito/models/good.dart';

class Exchange {
  final Good fromGood;
  final Good toGood;
  final bool myExchange;

  final String comment;

  Exchange({
    required this.fromGood,
    required this.toGood,
    required this.myExchange,
    required this.comment,
  });

  factory Exchange.sample1() {
    final comment = 'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment';

    return Exchange(
        fromGood: Good.sample1(),
        toGood: Good.sample2(),
        myExchange: false,
        comment: comment);
  }

  factory Exchange.sample2() {
    final comment = 'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment'
        'so long comment...so long comment...so long comment';

    return Exchange(
        fromGood: Good.sample2(),
        toGood: Good.sample1(),
        myExchange: true,
        comment: comment);
  }
}
