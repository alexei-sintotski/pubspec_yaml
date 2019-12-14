// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_dependency_spec.dart';

// **************************************************************************
// SumTypesGenerator
// **************************************************************************

abstract class _$PackageDependencySpec {
  const _$PackageDependencySpec({
    this.sdk,
    this.git,
  }) : assert(sdk != null && git == null || sdk == null && git != null);
  static PackageDependencySpec load<$T extends PackageDependencySpecRecordBase<$T>>(
    $T rec,
  ) {
    if (rec.sdk != null && rec.git == null) {
      return PackageDependencySpec.sdk(rec.sdk);
    } else if (rec.sdk == null && rec.git != null) {
      return PackageDependencySpec.git(rec.git);
    } else {
      throw Exception("Cannot select a $PackageDependencySpec case given $rec");
    }
  }

  $T dump<$T>(
    $T Function({
      SdkPackageDependencySpec sdk,
      GitPackageDependencySpec git,
    })
        make,
  ) {
    return iswitch(
      sdk: (sdk) => make(sdk: sdk),
      git: (git) => make(git: git),
    );
  }

  $T iswitch<$T>({
    @required $T Function(SdkPackageDependencySpec) sdk,
    @required $T Function(GitPackageDependencySpec) git,
  }) {
    if (this.sdk != null) {
      return sdk(this.sdk);
    } else if (this.git != null) {
      return git(this.git);
    } else {
      throw StateError("an instance of $PackageDependencySpec has no case selected");
    }
  }

  $T iswitcho<$T>({
    $T Function(SdkPackageDependencySpec) sdk,
    $T Function(GitPackageDependencySpec) git,
    @required $T Function() otherwise,
  }) {
    $T _otherwise(Object _) => otherwise();
    return iswitch(
      sdk: sdk ?? _otherwise,
      git: git ?? _otherwise,
    );
  }

  @override
  bool operator ==(
    dynamic other,
  ) {
    return other.runtimeType == runtimeType && other.sdk == sdk && other.git == git;
  }

  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + sdk.hashCode;
    result = 37 * result + git.hashCode;
    return result;
  }

  @override
  String toString() {
    final ctor = iswitch(
      sdk: (value) => "sdk($value)",
      git: (value) => "git($value)",
    );
    return "$runtimeType.$ctor";
  }

  @protected
  final SdkPackageDependencySpec sdk;
  @protected
  final GitPackageDependencySpec git;
}

abstract class PackageDependencySpecRecordBase<Self> {
  SdkPackageDependencySpec get sdk;
  GitPackageDependencySpec get git;
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
