import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_goods_state.dart';

class MyGoodsCubit extends Cubit<MyGoodsState> {
  MyGoodsCubit() : super(MyGoodsInitial());

  void loadMyGoods() async {
    try {
      emit(MyGoodsLoading());
//

      emit(MyGoodsLoadingDone());
    } catch (e) {
      emit(MyGoodsLoadingFailure());
    }
  }
}
