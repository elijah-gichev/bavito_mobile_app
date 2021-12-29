part of 'my_goods_cubit.dart';

@immutable
abstract class MyGoodsState {}

class MyGoodsInitial extends MyGoodsState {}

class MyGoodsLoading extends MyGoodsState {}

class MyGoodsLoadingDone extends MyGoodsState {
  final List<Good> goods;

  MyGoodsLoadingDone(this.goods);
}

class MyGoodsLoadingFailure extends MyGoodsState {}
