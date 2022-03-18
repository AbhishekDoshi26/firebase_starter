import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template FSTextField}
/// A Firebase Starter UI Text Field.
///
/// An FSTextField can be integrated into a [Form] widget. By default,
/// there is no border. Pass `true` into `showBorder` to display a text
/// field with an [OutlineInputBorder]. You can customize the text field's
/// input decoration by creating an [InputDecoration] and passing it into
/// the `decoration` parameter.
///
/// ```dart
///     FSTextField(
///       textInputAction: TextInputAction.search,
///       decoration: const InputDecoration(
///         prefixIcon: Icon(Icons.search),
///         hintText: 'Player Search',
///       ),
///     ),
/// ```
///
/// {@endtemplate}
class FSTextField extends TextFormField {
  /// {@macro FSTextField}
  FSTextField({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    InputDecoration decoration = const InputDecoration(),
    String? initialValue,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization textCapitalization = TextCapitalization.none,
    List<TextInputFormatter>? inputFormatters,
    bool autofocus = false,
    bool obscureText = false,
    bool autocorrect = true,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    bool? enabled,
    GestureTapCallback? onTap,
    ValueChanged<String>? onFieldSubmitted,
  }) : super(
          key: key,
          controller: controller,
          focusNode: focusNode,
          decoration: decoration,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          autofocus: autofocus,
          obscureText: obscureText,
          autocorrect: autocorrect,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          enabled: enabled,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
        );
}
