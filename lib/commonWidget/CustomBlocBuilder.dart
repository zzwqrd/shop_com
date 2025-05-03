import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/extensions.dart';
import '../core/dialogs/progress_dialog.dart';
import '../core/dialogs/retry_dialog.dart';
import '../core/utils/enums.dart';
import '../core/utils/spinkit_indicator.dart';

class CustomBlocBuilder<A extends BlocBase<S>, S> extends StatelessWidget {
  const CustomBlocBuilder({
    super.key,
    this.bloc,
    this.emptyWidget,
    this.successWidget,
    this.progressStatusTitle,
    this.successStatusTitle,
    required this.onRetryPressed,
    this.buildWhen,
    required this.stateSelector,
    this.loadingWidget,
  });

  final A? bloc;
  final Widget? emptyWidget;
  final VoidCallback onRetryPressed;
  final String? successStatusTitle;
  final String? progressStatusTitle;
  final BlocBuilderCondition<S>? buildWhen;
  final Widget Function(S state)? successWidget;
  final Widget Function(S state)? loadingWidget;

  // دالة لاختيار حالة الطلب (RequestState) من الحالة العامة (state)
  final RequestState Function(S state) stateSelector;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<A, S>(
      bloc: bloc,
      buildWhen: buildWhen,
      builder: (BuildContext context, S state) {
        // استخراج حالة الطلب باستخدام stateSelector
        final RequestState requestState = stateSelector(state);

        switch (requestState) {
          case RequestState.initial:
            return const SizedBox();
          case RequestState.loading:
            return loadingWidget != null
                ? loadingWidget!(state)
                : const SpinKitIndicator(type: SpinKitType.circle).center;
          // ? const SpinKitIndicator(type: SpinKitType.circle).center
          // : ProgressDialog(
          //     title: progressStatusTitle!,
          //     isProgressed: true,
          //   ).center;
          case RequestState.empty:
            return emptyWidget ?? const SizedBox();
          case RequestState.error:
            return RetryDialog(
              title: "An error occurred",
              onRetryPressed: onRetryPressed,
            );
          case RequestState.done:
            return successWidget != null
                ? successWidget!(state)
                : ProgressDialog(
                    title: successStatusTitle ?? "",
                    onPressed: null,
                    isProgressed: false,
                  );
        }
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../core/dialogs/progress_dialog.dart';
// import '../core/dialogs/retry_dialog.dart';
// import '../core/utils/enums.dart';
// import '../core/utils/spinkit_indicator.dart';

// // GenericBlocBuilder class
// class CustomBlocBuilder<A extends BlocBase<S>, S> extends StatelessWidget {
//   const CustomBlocBuilder({
//     super.key,
//     this.bloc,
//     this.emptyWidget,
//     this.successWidget,
//     this.progressStatusTitle,
//     this.successStatusTitle,
//     required this.onRetryPressed,
//     this.buildWhen,
//   });
//   final A? bloc;
//   final Widget? emptyWidget;
//   final VoidCallback onRetryPressed;
//   final String? successStatusTitle;
//   final String? progressStatusTitle;
//   final BlocBuilderCondition<S>? buildWhen;
//   final Widget Function(S state)? successWidget;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<A, S>(
//       bloc: bloc,
//       buildWhen: buildWhen,
//       builder: (BuildContext context, S state) {
//         // Extract requestState from the state
//         final RequestState requestState = _getRequestState(state);

//         switch (requestState) {
//           case RequestState.initial:
//             return const SizedBox();
//           case RequestState.loading:
//             return progressStatusTitle == null
//                 ? const SpinKitIndicator(type: SpinKitType.circle)
//                 : ProgressDialog(
//                     title: progressStatusTitle!,
//                     isProgressed: true,
//                   );
//           case RequestState.empty:
//             return emptyWidget ?? const SizedBox();
//           case RequestState.error:
//             return RetryDialog(
//               title: "An error occurred",
//               onRetryPressed: onRetryPressed,
//             );
//           case RequestState.done:
//             return successWidget != null
//                 ? successWidget!(state)
//                 : ProgressDialog(
//                     title: successStatusTitle ?? "",
//                     onPressed: null,
//                     isProgressed: false,
//                   );
//         }
//       },
//     );
//   }

//   // Helper method to extract RequestState from the state
//   RequestState _getRequestState(S state) {
//     if (state is RequestStateProvider) {
//       return state.requestState;
//     }
//     throw ArgumentError('State must implement RequestStateProvider');
//   }
// }

// // Interface for states that provide RequestState
// abstract class RequestStateProvider {
//   RequestState get requestState;
// }
