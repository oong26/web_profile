import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_menu_state.dart';

class SelectMenuCubit extends Cubit<int> {
  SelectMenuCubit() : super(0);

  void selectMenu(int selectedMenu) {
    emit(selectedMenu);
  }
}
