// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_package_dependency_spec.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SdkPackageDependencySpec {
  const $SdkPackageDependencySpec();

  String get package;
  String get sdk;
  Optional<String> get version;

  SdkPackageDependencySpec copyWith({
    String? package,
    String? sdk,
    Optional<String>? version,
  }) =>
      SdkPackageDependencySpec(
        package: package ?? this.package,
        sdk: sdk ?? this.sdk,
        version: version ?? this.version,
      );

  SdkPackageDependencySpec copyUsing(
      void Function(SdkPackageDependencySpec$Change change) mutator) {
    final change = SdkPackageDependencySpec$Change._(
      this.package,
      this.sdk,
      this.version,
    );
    mutator(change);
    return SdkPackageDependencySpec(
      package: change.package,
      sdk: change.sdk,
      version: change.version,
    );
  }

  @override
  String toString() =>
      "SdkPackageDependencySpec(package: $package, sdk: $sdk, version: $version)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SdkPackageDependencySpec &&
      other.runtimeType == runtimeType &&
      package == other.package &&
      sdk == other.sdk &&
      version == other.version;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + package.hashCode;
    result = 37 * result + sdk.hashCode;
    result = 37 * result + version.hashCode;
    return result;
  }
}

class SdkPackageDependencySpec$Change {
  SdkPackageDependencySpec$Change._(
    this.package,
    this.sdk,
    this.version,
  );

  String package;
  String sdk;
  Optional<String> version;
}

// ignore: avoid_classes_with_only_static_members
class SdkPackageDependencySpec$ {
  static final package = Lens<SdkPackageDependencySpec, String>(
    (packageContainer) => packageContainer.package,
    (packageContainer, package) => packageContainer.copyWith(package: package),
  );

  static final sdk = Lens<SdkPackageDependencySpec, String>(
    (sdkContainer) => sdkContainer.sdk,
    (sdkContainer, sdk) => sdkContainer.copyWith(sdk: sdk),
  );

  static final version = Lens<SdkPackageDependencySpec, Optional<String>>(
    (versionContainer) => versionContainer.version,
    (versionContainer, version) => versionContainer.copyWith(version: version),
  );
}
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
// ignore_for_file: duplicate_ignore
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: prefer_asserts_with_message
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_single_quotes
// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_this
// ignore_for_file: unused_element
