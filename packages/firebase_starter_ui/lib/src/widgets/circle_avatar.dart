import 'package:flutter/material.dart';

/// {@template FSCircleAvatar}
/// A Firebase Starter UI Circle Avatar.
///
/// A circle that represents a user.
///
/// Typically used with a user's profile image, or, in the absence of
/// such an image, the user's initials.
///
/// The [onBackgroundImageError] parameter must be null if the [backgroundImage]
/// is null.
///
/// ```dart
/// FSCircleAvatar(
///   backgroundImage: NetworkImage(userAvatarUrl),
/// )
/// ```
///
/// The image will be cropped to have a circle shape.
///
/// If the avatar is to just have the user's initials, they are typically
/// provided using a [Text] widget as the [child] and a [backgroundColor]:
///
/// {@endtemplate}
class FSCircleAvatar extends CircleAvatar {
  /// {@macro FSCircleAvatar}
  const FSCircleAvatar({
    Key? key,
    Widget? child,
    Color? backgroundColor,
    Color? foregroundColor,
    ImageProvider? backgroundImage,
    ImageErrorListener? onBackgroundImageError,
    double? radius,
  })  : assert(backgroundImage != null || onBackgroundImageError == null),
        super(
          key: key,
          child: child,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          backgroundImage: backgroundImage,
          onBackgroundImageError: onBackgroundImageError,
          radius: radius,
        );
}
