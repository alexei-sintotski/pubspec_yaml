// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_dependency_spec.dart';

// **************************************************************************
// SumTypesGenerator
// **************************************************************************

abstract class _$PackageDependencySpec {
  const _$PackageDependencySpec({
    this.sdk,
  }) : assert(sdk != null);
  static PackageDependencySpec load<$T extends PackageDependencySpecRecordBase<$T>>(
    $T rec,
  ) {
    if (rec.sdk != null) {
      return PackageDependencySpec.sdk(rec.sdk);
    } else {
      throw Exception("Cannot select a $PackageDependencySpec case given $rec");
    }
  }

  $T dump<$T>(
    $T Function({
      SdkPackageDependencySpec sdk,
    })
        make,
  ) {
    return iswitch(
      sdk: (sdk) => make(sdk: sdk),
    );
  }

  $T iswitch<$T>({
    @required $T Function(SdkPackageDependencySpec) sdk,
  }) {
    if (this.sdk != null) {
      return sdk(this.sdk);
    } else {
      throw StateError("an instance of $PackageDependencySpec has no case selected");
    }
  }

  $T iswitcho<$T>({
    $T Function(SdkPackageDependencySpec) sdk,
    @required $T Function() otherwise,
  }) {
    $T _otherwise(Object _) => otherwise();
    return iswitch(
      sdk: sdk ?? _otherwise,
    );
  }

  @override
  bool operator ==(
    dynamic other,
  ) {
    return other.runtimeType == runtimeType && other.sdk == sdk;
  }

  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + sdk.hashCode;
    return result;
  }

  @override
  String toString() {
    final ctor = iswitch(
      sdk: (value) => "sdk($value)",
    );
    return "$runtimeType.$ctor";
  }

  @protected
  final SdkPackageDependencySpec sdk;
}

abstract class PackageDependencySpecRecordBase<Self> {
  SdkPackageDependencySpec get sdk;
}

// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: always_require_non_null_named_parameters
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: join_return_with_assignment
// ignore_for_file: prefer_asserts_with_message
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_single_quotes
// ignore_for_file: sort_constructors_first
// ignore_for_file: type_annotate_public_apis
