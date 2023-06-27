import 'package:flutter/material.dart';

/// Extension to access motion tokens using `Theme.of(context)` syntax.
extension MotionThemeData on ThemeData {
  /// A collection of [Curve]s for animations using the [M3 Motion Specs](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs).
  ///
  /// When no custom tokens are defined in the theme extensions,
  /// this returns the default tokens.
  ///
  /// See also:
  /// - [EasingTokens]
  EasingTokens get easing => extension<EasingTokens>() ?? EasingTokens();

  /// A collection of [Duration]s for animations using the [M3 Motion Specs](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs).
  DurationTokens get duration =>
      extension<DurationTokens>() ?? DurationTokens();
}

/// {@template easing_tokens}
/// The [EasingTokens] class defines a set of easing curves used for
/// animations and transitions.
///
/// To access the tokens use: `Theme.of(context).easing`.
///
/// The default values are the tokens used in [M3 Motion](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs).
///
/// It extends the [ThemeExtension] class, allowing it to be easily integrated
/// into a theme.
///
/// {@tool dartpad}
/// Example:
/// ```dart
/// MaterialApp(
///   theme: ThemeData(
///     extensions: [
///       EasingTokens(emphasized: Curves.linear),
///     ],
///   ),
///  ...
/// ),
/// ```
/// {@endtool}
///
/// {@endtemplate}
class EasingTokens extends ThemeExtension<EasingTokens> {
  /// {@macro easing_tokens}
  EasingTokens({
    this.linear = Curves.linear,
    this.emphasized = Curves.easeInOutCubicEmphasized,
    this.emphasizedDecelerate = const Cubic(0.05, 0.7, 0.1, 1),
    this.emphasizedAccelerate = const Cubic(0.3, 0, 0.8, 0.15),
    this.standard = const Cubic(0.2, 0, 0, 1),
    this.standardDecelerate = const Cubic(0, 0, 0, 1),
    this.standardAccelerate = const Cubic(0.3, 0, 1, 1),
  });

  /// {@template easing_emphasized}
  /// An emphasized curve that follows the
  /// [M3 Tokens on easing](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  ///
  /// This set is the most common because it captures the expressive style of M3
  ///
  /// {@endtemplate}
  ///
  /// {@template easing_both}
  /// This is used for transitions that begin and end on screen
  /// {@endtemplate}
  final Curve emphasized;

  /// {@macro easing_emphasized}
  ///
  /// {@template easing_decelerate}
  /// This is used for transitions that enter the screen
  /// {@endtemplate}
  final Curve emphasizedDecelerate;

  /// {@macro easing_emphasized}
  ///
  /// {@template easing_accelerate}
  /// This is used for transitions that exit the screen.
  /// {@endtemplate}
  final Curve emphasizedAccelerate;

  /// {@template easing_standard}
  /// An standard curve that follows the
  /// [M3 Tokens on easing](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  ///
  /// This set is used for simple, small, or utility-focused transitions.
  /// {@endtemplate}
  ///
  /// {@macro easing_both}
  final Curve standard;

  /// {@macro easing_standard}
  ///
  /// {@macro easing_decelerate}
  final Curve standardDecelerate;

  /// {@macro easing_standard}
  ///
  /// {@macro easing_accelerate}
  final Curve standardAccelerate;

  /// A linear curve.
  ///
  /// Same as [Curves.linear].
  final Curve linear;

  @override
  EasingTokens copyWith({
    Curve? emphasized,
    Curve? emphasizedDecelerate,
    Curve? emphasizedAccelerate,
    Curve? standard,
    Curve? standardDecelerate,
    Curve? standardAccelerate,
    Curve? linear,
  }) {
    return EasingTokens(
      emphasized: emphasized ?? this.emphasized,
      emphasizedDecelerate: emphasizedDecelerate ?? this.emphasizedDecelerate,
      emphasizedAccelerate: emphasizedAccelerate ?? this.emphasizedAccelerate,
      standard: standard ?? this.standard,
      standardDecelerate: standardDecelerate ?? this.standardDecelerate,
      standardAccelerate: standardAccelerate ?? this.standardAccelerate,
      linear: linear ?? this.linear,
    );
  }

  @override
  ThemeExtension<EasingTokens> lerp(
    covariant ThemeExtension<EasingTokens>? other,
    double t,
  ) {
    return other ?? this;
  }
}

/// {@template duration_tokens}
/// The [DurationTokens] class defines a set of durations used for
/// animations and transitions.
///
/// To access the tokens use: `Theme.of(context).duration`.
///
/// The default values are the tokens used in [M3 Motion](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs).
///
/// It extends the [ThemeExtension] class, allowing it to be easily integrated
/// into a theme.
///
/// {@tool dartpad}
/// Example:
/// ```dart
/// MaterialApp(
///   theme: ThemeData(
///     extensions: [
///       DurationTokens(short1: Duration(milliseconds: 100)),
///     ],
///   ),
///  ...
/// ),
/// ```
/// {@endtool}
///
/// {@endtemplate}
class DurationTokens extends ThemeExtension<DurationTokens> {
  /// {@macro duration_tokens}
  DurationTokens({
    this.short1 = const Duration(milliseconds: 50),
    this.short2 = const Duration(milliseconds: 100),
    this.short3 = const Duration(milliseconds: 150),
    this.short4 = const Duration(milliseconds: 200),
    this.medium1 = const Duration(milliseconds: 250),
    this.medium2 = const Duration(milliseconds: 300),
    this.medium3 = const Duration(milliseconds: 350),
    this.medium4 = const Duration(milliseconds: 400),
    this.long1 = const Duration(milliseconds: 450),
    this.long2 = const Duration(milliseconds: 500),
    this.long3 = const Duration(milliseconds: 550),
    this.long4 = const Duration(milliseconds: 600),
    this.extraLong1 = const Duration(milliseconds: 700),
    this.extraLong2 = const Duration(milliseconds: 800),
    this.extraLong3 = const Duration(milliseconds: 900),
    this.extraLong4 = const Duration(milliseconds: 1000),
  });

  /// {@template duration_short}
  /// A short duration following the
  ///  [M3 Tokens on duration](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  ///
  /// Short durations are used for small utility-focused transitions.
  /// {@endtemplate}
  ///
  /// Defaults to 50ms.
  final Duration short1;

  /// {@macro duration_short}
  ///
  /// Defaults to 100ms.
  final Duration short2;

  /// {@macro duration_short}
  ///
  /// Defaults to 150ms.
  final Duration short3;

  /// {@macro duration_short}
  ///
  /// Defaults to 200ms.
  final Duration short4;

  /// {@template duration_medium}
  /// A medium duration following the
  ///  [M3 Tokens on duration](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  ///
  /// Medium durations are used for transitions that traverse
  /// a medium area of the screen.
  /// {@endtemplate}
  ///
  /// Defaults to 250ms.
  final Duration medium1;

  /// {@macro duration_medium}
  ///
  /// Defaults to 300ms.
  final Duration medium2;

  /// {@macro duration_medium}
  ///
  /// Defaults to 350ms.
  final Duration medium3;

  /// {@macro duration_medium}
  ///
  /// Defaults to 400ms.
  final Duration medium4;

  /// {@template duration_long}
  /// A long duration following the
  ///  [M3 Tokens on duration](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  ///
  /// Long durations are often paired with Emphasized easing.
  /// They're used for large expressive transitions.
  /// {@endtemplate}
  ///
  /// Defaults to 450ms.
  final Duration long1;

  /// {@macro duration_long}
  ///
  /// Defaults to 500ms.
  final Duration long2;

  /// {@macro duration_long}
  /// Defaults to 550ms.
  final Duration long3;

  /// {@macro duration_long}
  ///
  /// Defaults to 600ms.
  final Duration long4;

  /// {@template duration_extra_long}
  /// A long duration following the
  /// [M3 Tokens on duration](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  ///
  /// Though rare, some transitions use durations above 600ms.
  /// These are usually used for ambient transitions
  /// that don't involve user input.
  /// {@endtemplate}
  ///
  /// Defaults to 700ms.
  final Duration extraLong1;

  /// {@macro duration_extra_long}
  ///
  /// Defaults to 800ms.
  final Duration extraLong2;

  /// {@macro duration_extra_long}
  ///
  /// Defaults to 900ms.
  final Duration extraLong3;

  /// {@macro duration_extra_long}
  ///
  /// Defaults to 1000ms.
  final Duration extraLong4;

  @override
  DurationTokens copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) {
    return DurationTokens(
      short1: short1 ?? this.short1,
      short2: short2 ?? this.short2,
      short3: short3 ?? this.short3,
      short4: short4 ?? this.short4,
      medium1: medium1 ?? this.medium1,
      medium2: medium2 ?? this.medium2,
      medium3: medium3 ?? this.medium3,
      medium4: medium4 ?? this.medium4,
      long1: long1 ?? this.long1,
      long2: long2 ?? this.long2,
      long3: long3 ?? this.long3,
      long4: long4 ?? this.long4,
      extraLong1: extraLong1 ?? this.extraLong1,
      extraLong2: extraLong2 ?? this.extraLong2,
      extraLong3: extraLong3 ?? this.extraLong3,
      extraLong4: extraLong4 ?? this.extraLong4,
    );
  }

  @override
  ThemeExtension<DurationTokens> lerp(
    covariant ThemeExtension<DurationTokens>? other,
    double t,
  ) {
    return other ?? this;
  }
}
