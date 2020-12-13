// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_package_dependency_spec.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $SdkPackageDependencySpec {
  const $SdkPackageDependencySpec();
  String get package;
  String get sdk;
  Optional<String> get version;
  SdkPackageDependencySpec copyWith(
          {String package, String sdk, Optional<String> version}) =>
      SdkPackageDependencySpec(
          package: package ?? this.package,
          sdk: sdk ?? this.sdk,
          version: version ?? this.version);
  @override
  String toString() =>
      "SdkPackageDependencySpec(package: $package, sdk: $sdk, version: $version)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      package == other.package &&
      sdk == other.sdk &&
      version == other.version;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + package.hashCode;
    result = 37 * result + sdk.hashCode;
    result = 37 * result + version.hashCode;
    return result;
  }
}

class SdkPackageDependencySpec$ {
  static final package = Lens<SdkPackageDependencySpec, String>(
      (s_) => s_.package, (s_, package) => s_.copyWith(package: package));
  static final sdk = Lens<SdkPackageDependencySpec, String>(
      (s_) => s_.sdk, (s_, sdk) => s_.copyWith(sdk: sdk));
  static final version = Lens<SdkPackageDependencySpec, Optional<String>>(
      (s_) => s_.version, (s_, version) => s_.copyWith(version: version));
}
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: prefer_asserts_with_message
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_single_quotes
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_element
