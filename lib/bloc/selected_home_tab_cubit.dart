import 'package:bloc/bloc.dart';

enum SelectedHomeTab {
  radio,
  library,
  search,
}

class SelectedHomeTabCubit extends Cubit<SelectedHomeTab> {
  SelectedHomeTabCubit() : super(SelectedHomeTab.radio);

  void update(SelectedHomeTab selectedHomeTab) {
    emit(selectedHomeTab);
  }
}
