import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<NavigateToPage>(_onNavigateToPage);
  }

  void _onNavigateToPage(NavigateToPage event, Emitter<NavigationState> emit) {
    emit(NavigationState(event.index));
  }

  Widget get currentPage => getSelectedPage(state.currentIndex);

  Widget getSelectedPage(int index) {
    switch (index) {
      case 0:
        return Center(child: Text("0"));
      case 1:
        return Center(child: Text("1"));
      case 2:
        return Center(child: Text("2"));
      case 3:
        return Center(child: Text("3"));
      case 4:
        return Center(child: Text("4"));
      default:
        return Center(child: Text("0"));
    }
  }
}
