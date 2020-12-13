// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosted_package_dependency_spec.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $HostedPackageDependencySpec {
  const $HostedPackageDependencySpec();
  String get package;
  Optional<String> get version;
  Optional<String> get name;
  Optional<String> get url;
  HostedPackageDependencySpec copyWith(
          {String package, Optional<String> version, Optional<String> name, Optional<String> url}) =>
      HostedPackageDependencySpec(
          package: package ?? this.package,
          version: version ?? this.version,
          name: name ?? this.name,
          url: url ?? this.url);
  @override
  String toString() => "HostedPackageDependencySpec(package: $package, version: $version, name: $name, url: $url)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      package == other.package &&
      version == other.version &&
      name == other.name &&
      url == other.url;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + package.hashCode;
    result = 37 * result + version.hashCode;
    result = 37 * result + name.hashCode;
    result = 37 * result + url.hashCode;
    return result;
  }
}

class HostedPackageDependencySpec$ {
  static final package =
      Lens<HostedPackageDependencySpec, String>((s_) => s_.package, (s_, package) => s_.copyWith(package: package));
  static final version = Lens<HostedPackageDependencySpec, Optional<String>>(
      (s_) => s_.version, (s_, version) => s_.copyWith(version: version));
  static final name =
      Lens<HostedPackageDependencySpec, Optional<String>>((s_) => s_.name, (s_, name) => s_.copyWith(name: name));
  static final url =
      Lens<HostedPackageDependencySpec, Optional<String>>((s_) => s_.url, (s_, url) => s_.copyWith(url: url));
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
