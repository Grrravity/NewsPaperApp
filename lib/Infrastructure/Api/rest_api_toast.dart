import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';

const Duration _snackBarDisplayDuration = Duration(seconds: 4);

Widget _iconError = Padding(
  padding: const EdgeInsets.only(right: 20),
  child: Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: UiConstants.secondaryRed,
      borderRadius: BorderRadius.circular(50),
    ),
    child: const Icon(
      LineAwesomeIcons.bug,
      size: 18,
      color: UiConstants.outline,
    ),
  ),
);

Widget _iconWarning = Padding(
  padding: const EdgeInsets.only(right: 20),
  child: Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: UiConstants.secondaryYellow,
      borderRadius: BorderRadius.circular(50),
    ),
    child: const Icon(
      LineAwesomeIcons.exclamation_circle,
      size: 18,
      color: UiConstants.outline,
    ),
  ),
);

Widget _iconSucces = Padding(
  padding: const EdgeInsets.only(right: 20),
  child: Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: UiConstants.secondaryGreen,
      borderRadius: BorderRadius.circular(50),
    ),
    child: const Icon(
      LineAwesomeIcons.check_circle,
      size: 18,
      color: UiConstants.outline,
    ),
  ),
);

class Toast extends SnackBar {
  ///Make a customizable contextless toast with factory.
  Toast._({
    required Widget content,
    required Duration duration,
    SnackBarAction? action,
    double? width,
    SnackBarBehavior? behavior,
    double? elevation,
    Color backgroundColor = UiConstants.primaryBlack,
  }) : super(
            elevation: elevation,
            content: content,
            duration: duration,
            action: action,
            width: width,
            behavior: behavior,
            backgroundColor: backgroundColor);

  factory Toast.success({
    required String message,
    Duration duration = _snackBarDisplayDuration,
    SnackBarAction? action,
    double? elevation,
  }) {
    return Toast._(
      content: Row(
        children: [
          _iconSucces,
          Expanded(
            child: Text(
              message,
              style: UiConstants.regularText14White,
            ),
          ),
        ],
      ),
      elevation: elevation,
      duration: duration,
      action: action,
      behavior: SnackBarBehavior.floating,
      backgroundColor: UiConstants.primaryBlack,
    );
  }

  /// ```
  /// Toast.error(
  ///   message: 'Request data not found',
  ///   action: SnackBarAction(
  ///     label: 'Retry ?',
  ///     onPressed: () {
  ///       print('retrying');
  ///     },
  ///   ),
  /// ),
  /// ``
  factory Toast.error({
    required String message,
    Duration duration = _snackBarDisplayDuration,
    SnackBarAction? action,
    double? elevation,
  }) {
    return Toast._(
      content: Row(
        children: [
          _iconError,
          Expanded(
            child: Text(
              message,
              style: UiConstants.regularText14White,
            ),
          ),
        ],
      ),
      elevation: elevation,
      duration: duration,
      action: action,
      width: null,
      behavior: SnackBarBehavior.floating,
      backgroundColor: UiConstants.primaryBlack,
    );
  }

  /// ```
  /// Toast.error(
  ///   message: 'Request data not found',
  ///   action: SnackBarAction(
  ///     label: 'Retry ?',
  ///     onPressed: () {
  ///       print('retrying');
  ///     },
  ///   ),
  /// ),
  /// ``
  factory Toast.warning({
    required String message,
    Duration duration = _snackBarDisplayDuration,
    SnackBarAction? action,
    double? elevation,
  }) {
    return Toast._(
      content: Row(
        children: [
          _iconWarning,
          Expanded(
            child: Text(
              message,
              style: UiConstants.regularText14White,
            ),
          ),
        ],
      ),
      elevation: elevation,
      duration: duration,
      action: action,
      width: null,
      behavior: SnackBarBehavior.floating,
      backgroundColor: UiConstants.primaryBlack,
    );
  }

  /// ```
  /// Toast.simple(
  ///   message: 'action done',
  ///   action: SnackBarAction(
  ///     label: 'CANCEL',
  ///     onPressed: () {
  ///       print('canceling');
  ///     },
  ///   ),
  /// ),
  /// ```
  factory Toast.simple({
    required String message,
    Duration duration = _snackBarDisplayDuration,
    SnackBarAction? action,
    double? elevation,
  }) {
    return Toast._(
      content: Text(
        message,
        style: UiConstants.regularText14White,
      ),
      elevation: elevation,
      duration: duration,
      action: action,
      width: null,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: UiConstants.primaryBlack,
    );
  }

  /// ```
  /// Toast.showSnackBar(
  ///   context: context,
  ///   snackBar: Toast.simple(
  ///     message: 'Logged in',
  ///   ),
  /// );
  /// ```
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBar({
    required BuildContext context,
    required SnackBar snackBar,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
