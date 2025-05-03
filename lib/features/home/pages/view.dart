import 'package:ali_com/commonWidget/CustomBlocBuilder.dart';
import 'package:ali_com/core/utils/extensions.dart';
import 'package:ali_com/features/home/controller/bloc.dart';
import 'package:ali_com/features/home/controller/state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../commonWidget/custom_image.dart';
import '../../../core/general_bloc/generic_cubit.dart';
import '../../../di/service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = sl<HomeController>()..getData();
    GenericBloc<int> currentPage = GenericBloc(0);

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
            Column(
              children: [
                SizedBox(
                  height: 150.h,
                  width: MediaQuery.sizeOf(context).width,
                  child: CarouselSlider.builder(
                    itemCount: bloc.model!.data!.banners.length,
                    itemBuilder: (context, index, realIndex) {
                      return CustomImage(
                        bloc.model!.data!.banners[index].thumbnail,
                        height: 185.h,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.fill,
                        backgroundColor: '#D9D9D9'.color,
                        borderRadius: BorderRadius.circular(20.r),
                      ).withPadding(horizontal: 20.w);
                    },
                    options: CarouselOptions(
                      aspectRatio: 5 / 2,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      enlargeCenterPage: true,
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        currentPage.onUpdateData(index);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                BlocBuilder<GenericBloc<int>, GenericState<int>>(
                  bloc: currentPage,
                  buildWhen: (previous, current) =>
                      previous.data != current.data,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        bloc.model!.data!.banners.length,
                        (index) => Container(
                          width: currentPage.state.data == index ? 8.w : 6.w,
                          height: 8.h,
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPage.state.data == index
                                ? Colors.green
                                : Colors.brown.withOpacity(0.5),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
