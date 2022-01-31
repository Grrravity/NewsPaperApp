import 'package:flutter/material.dart';
import 'package:newspaperapp/Core/Constants/ui_constants.dart';

class AppButton extends StatelessWidget {
  /// Diplay buttons
  ///
  /// [value] =>  Text to display
  ///
  /// ```
  ///   AppButton.redOutlined(
  ///       required String value,
  ///       required void Function() onPressed,
  ///       double? width,
  ///       double? height,
  ///   ),
  /// ```
  ///
  final String value;
  final void Function() onPressed;
  final Color? background;
  final Color? borderColor;
  final double? width;
  final double? height;
  final Color? textColor;
  final bool enabled;
  final BorderRadius? borderRadius;

  AppButton._({
    required this.value,
    required this.onPressed,
    this.background,
    this.borderColor,
    this.width,
    this.height,
    this.textColor,
    this.enabled = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });
  //grey soft button
  factory AppButton.grey({
    required String value,
    required void Function() onPressed,
    double? width,
    double? height,
    bool enabled = true,
  }) {
    return AppButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: Colors.transparent,
      textColor: UiConstants.backgroundWhite,
      background: UiConstants.primaryGrey.withOpacity(0.4),
      height: height,
      width: width,
      enabled: enabled,
    );
  }
  //Rounded primary blue button
  factory AppButton.blueOutlined({
    required String value,
    required void Function() onPressed,
    double? width,
    double? height,
    bool enabled = true,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20)),
  }) {
    return AppButton._(
      value: value.toUpperCase(),
      onPressed: onPressed,
      borderColor: UiConstants.primaryBlue,
      textColor: UiConstants.primaryBlue,
      background: UiConstants.backgroundWhite,
      height: height,
      width: width,
      enabled: enabled,
      borderRadius: borderRadius,
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: enabled ? onPressed : null,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1.2,
          ),
          borderRadius: borderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: UiConstants.buttonLabel12.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
