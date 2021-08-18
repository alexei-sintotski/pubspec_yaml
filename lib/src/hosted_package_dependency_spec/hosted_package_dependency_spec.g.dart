// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosted_package_dependency_spec.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $HostedPackageDependencySpec {
  const $HostedPackageDependencySpec();

  String get package;
  Optional<String> get version;
  Optional<String> get name;
  Optional<String> get url;

  HostedPackageDependencySpec copyWith({
    String? package,
    Optional<String>? version,
    Optional<String>? name,
    Optional<String>? url,
  }) =>
      HostedPackageDependencySpec(
        package: package ?? this.package,
        version: version ?? this.version,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  HostedPackageDependencySpec copyUsing(
      void Function(HostedPackageDependencySpec$Change change) mutator) {
    final change = HostedPackageDependencySpec$Change._(
      this.package,
      this.version,
      this.name,
      this.url,
    );
    mutator(change);
    return HostedPackageDependencySpec(
      package: change.package,
      version: change.version,
      name: change.name,
      url: change.url,
    );
  }

  @override
  String toString() =>
      "HostedPackageDependencySpec(package: $package, version: $version, name: $name, url: $url)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is HostedPackageDependencySpec &&
      other.runtimeType == runtimeType &&
      package == other.package &&
      version == other.version &&
      name == other.name &&
      url == other.url;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + package.hashCode;
    result = 37 * result + version.hashCode;
    result = 37 * result + name.hashCode;
    result = 37 * result + url.hashCode;
    return result;
  }
}

class HostedPackageDependencySpec$Change {
  HostedPackageDependencySpec$Change._(
    this.package,
    this.version,
    this.name,
    this.url,
  );

  String package;
  Optional<String> version;
  Optional<String> name;
  Optional<String> url;
}

// ignore: avoid_classes_with_only_static_members
class HostedPackageDependencySpec$ {
  static final package = Lens<HostedPackageDependencySpec, String>(
    (packageContainer) => packageContainer.package,
    (packageContainer, package) => packageContainer.copyWith(package: package),
  );

  static final version = Lens<HostedPackageDependencySpec, Optional<String>>(
    (versionContainer) => versionContainer.version,
    (versionContainer, version) => versionContainer.copyWith(version: version),
  );

  static final name = Lens<HostedPackageDependencySpec, Optional<String>>(
    (nameContainer) => nameContainer.name,
    (nameContainer, name) => nameContainer.copyWith(name: name),
  );

  static final url = Lens<HostedPackageDependencySpec, Optional<String>>(
    (urlContainer) => urlContainer.url,
    (urlContainer, url) => urlContainer.copyWith(url: url),
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
