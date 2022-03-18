import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';

/// {@template circular_badge}
/// A floating circular colored badge usually placed in a corner.
///
/// It contains a [child] and has options for setting the [elevation] and
/// [color]. None of the arguments can be `null`.
///
/// See also [FSCircularBadge.empty].
/// {@endtemplate}
class FSCircularBadge extends StatelessWidget {
  /// {@macro circular_badge}
  const FSCircularBadge({
    Key? key,
    this.elevation = FSSpacing.s2,
    this.color = FSColors.deepOrange,
    this.clipBehavior = Clip.hardEdge,
    this.radius = FSSpacing.s12,
    required this.child,
  }) : super(key: key);

  /// A floating circular colored badge of a certain [radius] without any
  /// content, usually used to indicate the status of some part of the UI has
  /// updated.
  ///
  /// None of the arguments can be `null`.
  ///
  /// If a child needs to be provided, use the default [FSCircularBadge]
  /// constructor instead.
  const FSCircularBadge.empty({
    Key? key,
    this.elevation = FSSpacing.s2,
    this.color = FSColors.deepOrange,
    this.radius = FSSpacing.s4,
  })  : clipBehavior = Clip.none,
        child = null,
        super(key: key);

  /// The elevation of the badge.
  ///
  /// Defaults to [FSSpacing.s2] and cannot be `null`.
  final double elevation;

  /// The background color of the badge.
  ///
  /// Defaults to [FSColors.deepOrange] and cannot be `null`.
  final Color color;

  /// The clip behavior for the badge.
  ///
  /// Defaults to [Clip.hardEdge] and cannot be `null`. Only set when the
  /// default [FSCircularBadge] constructor is used.
  final Clip clipBehavior;

  /// The inner radius of the badge.
  ///
  /// Defaults to `FSSpacing.s12` for regular badges and `FSSpacing.s4` for
  /// empty ones. Cannot be `null`.
  final double radius;

  /// The child shown in the center of the badge.
  ///
  /// A default text style of [TextTheme.subtitle2] is applied.
  ///
  /// Cannot be `null`. Only set when the default [FSCircularBadge] constructor
  /// is used.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colorBrightness = child == null
        ? null
        : (color.computeLuminance()) > 0.5
            ? Brightness.light
            : Brightness.dark;

    return Material(
      shape: const CircleBorder(),
      elevation: elevation,
      clipBehavior: clipBehavior,
      child: CircleAvatar(
        backgroundColor: color,
        radius: radius,
        child: child == null
            ? null
            : DefaultTextStyle(
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: colorBrightness == Brightness.light
                          ? FSColors.black
                          : FSColors.white,
                    ),
                textAlign: TextAlign.center,
                child: child!,
              ),
      ),
    );
  }
}
