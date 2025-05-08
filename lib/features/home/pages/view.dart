import 'package:alicom/commonWidget/CustomBlocBuilder.dart';
import 'package:alicom/features/home/controller/bloc.dart';
import 'package:alicom/features/home/controller/state.dart';
import 'package:flutter/material.dart';

import '../../../di/service_locator.dart';
import '../widget/categories.dart';
import '../widget/slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = sl<HomeController>()..getData();

    return CustomBlocBuilder<HomeController, HomeState>(
      bloc: bloc,
      stateSelector: (state) => state.requestState,
      buildWhen: (p, c) => p.requestState != c.requestState,
      emptyWidget: Center(child: Text('No data available ')),
      onRetryPressed: () {
        bloc.getData();
      },
      successWidget: (c) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SliderWidget(bloc: bloc),
            CategoriesWidget(bloc: bloc),
          ],
        );
      },
    );
  }
}
