import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../commonWidget/appbar.dart';
import '../../../commonWidget/custom_image.dart';
import '../../../core/utils/app_colors.dart';
import '../../../di/service_locator.dart';
import '../../../gen/assets/generated_assets.dart';
import '../controller/controller.dart';
import '../controller/event.dart';
import '../controller/state.dart';
import '../widgets/custom_bottom_nav_item.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final bloc = sl<NavigationBloc>()..add(NavigateToPage(0));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      bloc: bloc,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
            ),
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(48.h),
                child: AppBarWidget(
                  isSearch: true,
                  svgIcon: Assets.icons.search,
                  onTap: () {
                    // push(NamedRoutes.i.error);
                  },
                ),
              ),
              key: widget.key,
              extendBody: true,
              floatingActionButton: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  // color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(52.r),
                  onTap: () {
                    state.currentIndex == 2;
                    sl<NavigationBloc>().add(NavigateToPage(2));
                  },
                  child: Container(
                    height: 56.r,
                    width: 56.r,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(56.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.34),
                            blurRadius: 10.r,
                            offset: Offset(0, 6),
                          )
                        ]),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 60.h,
                          width: 60.w,
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryTextColor,
                            child: CustomImage(
                              Assets.icons.home,
                              width: 24.w,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12.h,
                          right: 10.w,
                          child: Container(
                            height: 10.r,
                            width: 10.r,
                            decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: bloc.currentPage,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                height: 70.h,
                elevation: 5,
                notchMargin: 10,
                clipBehavior: Clip.antiAlias,
                shape: const CircularNotchedRectangle(),
                child: buildCustomBottomNavigationBar(context, state),
              ),
            ),
          ),
        );
      },
    );
  }
}
