import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

export 'package:sliding_up_panel/sliding_up_panel.dart' show PanelController;

/// {@template sliding_up_panel}
/// A sliding panel that can be expanded and collapsed from the bottom of the
/// screen.
/// {@endtemplate}
class FSSlidingUpPanel extends StatefulWidget {
  /// {@macro sliding_up_panel}
  const FSSlidingUpPanel({
    Key? key,
    this.panelController,
    this.onPanelPositionChanged,
    this.panelHeaderHeight = FSSpacing.s60,
    this.panelMinHeight,
    this.panelHeader,
    this.panel,
    this.child,
  }) : super(key: key);

  /// An optional [PanelController] that can be used to control the panel.
  final PanelController? panelController;

  /// An optional callback that's triggered whenever the panel's vertical
  /// position is changed.
  final ValueChanged<double>? onPanelPositionChanged;

  /// The height of the sliding panel's header.
  ///
  /// Defaults to [FSSpacing.s60] and cannot be `null`.
  final double? panelHeaderHeight;

  /// The minimum height of the sliding panel
  final double? panelMinHeight;

  /// The sliding panel's header that's always shown.
  final Widget? panelHeader;

  /// The sliding panel's content that's only shown when the panel is opened.
  final Widget? panel;

  /// The child widget that's rendered behind the sliding panel at all times.
  final Widget? child;

  @override
  _FSSlidingUpPanelState createState() => _FSSlidingUpPanelState();
}

class _FSSlidingUpPanelState extends State<FSSlidingUpPanel> {
  PanelController? _panelController;

  static const _borderRadius = BorderRadius.vertical(
    top: Radius.circular(30),
  );

  @override
  void initState() {
    super.initState();
    _panelController = widget.panelController ?? PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final minHeight =
            widget.panelHeaderHeight ?? constraints.maxHeight * 0.1;
        return SlidingUpPanel(
          controller: _panelController,
          onPanelSlide: widget.onPanelPositionChanged,
          maxHeight: constraints.maxHeight * 0.9,
          minHeight: minHeight,
          borderRadius: _borderRadius,
          backdropEnabled: true,
          collapsed: _SlidingPanelHeader(
            panelController: _panelController,
            borderRadius: _borderRadius,
            child: widget.panelHeader,
          ),
          header: SizedBox(
            height: widget.panelHeaderHeight,
            width: constraints.maxWidth,
            child: _SlidingPanelHeader(
              panelController: _panelController,
              borderRadius: _borderRadius,
              child: widget.panelHeader,
            ),
          ),
          panel: Padding(
            padding: EdgeInsets.only(top: widget.panelHeaderHeight!),
            child: widget.panel,
          ),
          body: widget.child,
        );
      },
    );
  }
}

class _SlidingPanelHeader extends StatelessWidget {
  const _SlidingPanelHeader({
    Key? key,
    this.panelController,
    this.child,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  final PanelController? panelController;
  final Widget? child;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          panelController!.isPanelOpen
              ? panelController!.close()
              : panelController!.open();
        },
        child: child,
      ),
    );
  }
}
