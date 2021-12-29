import 'package:bavito/main.dart';
import 'package:bavito/models/good.dart';
import 'package:bavito/network/goods_network.dart';
import 'package:bavito/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_goods_state.dart';

class MyGoodsCubit extends Cubit<MyGoodsState> {
  final GoodsNetwork _myGoodsNetwork;

  MyGoodsCubit(this._myGoodsNetwork) : super(MyGoodsInitial());

  void loadMyGoods() async {
    try {
      emit(MyGoodsLoading());

      final goods =
          await _myGoodsNetwork.getMyGoods(getIt<UserService>().user!.id);

      emit(MyGoodsLoadingDone(goods));
    } catch (e) {
      emit(MyGoodsLoadingFailure());
    }
  }
}
