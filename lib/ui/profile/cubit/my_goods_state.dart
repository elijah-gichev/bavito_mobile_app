part of 'my_goods_cubit.dart';

@immutable
abstract class MyGoodsState {}

class MyGoodsInitial extends MyGoodsState {}

class MyGoodsLoading extends MyGoodsState {}

class MyGoodsLoadingDone extends MyGoodsState {}

class MyGoodsLoadingFailure extends MyGoodsState {}
