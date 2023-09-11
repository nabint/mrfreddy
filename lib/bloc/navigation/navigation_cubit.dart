import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit(int initialNavigatorPage) : super(initialNavigatorPage);

  void setPage(int number) {
    emit(number);
  }
}
