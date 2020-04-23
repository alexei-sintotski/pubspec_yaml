// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_package_dependency_spec.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $GitPackageDependencySpec {
  const $GitPackageDependencySpec();
  String get package;
  String get url;
  Optional<String> get ref;
  Optional<String> get path;
  GitPackageDependencySpec copyWith({String package, String url, Optional<String> ref, Optional<String> path}) =>
      GitPackageDependencySpec(
          package: package ?? this.package, url: url ?? this.url, ref: ref ?? this.ref, path: path ?? this.path);
  @override
  String toString() => "GitPackageDependencySpec(package: $package, url: $url, ref: $ref, path: $path)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      package == other.package &&
      url == other.url &&
      ref == other.ref &&
      path == other.path;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + package.hashCode;
    result = 37 * result + url.hashCode;
    result = 37 * result + ref.hashCode;
    result = 37 * result + path.hashCode;
    return result;
  }
}

class GitPackageDependencySpec$ {
  static final package =
      Lens<GitPackageDependencySpec, String>((s_) => s_.package, (s_, package) => s_.copyWith(package: package));
  static final url = Lens<GitPackageDependencySpec, String>((s_) => s_.url, (s_, url) => s_.copyWith(url: url));
  static final ref =
      Lens<GitPackageDependencySpec, Optional<String>>((s_) => s_.ref, (s_, ref) => s_.copyWith(ref: ref));
  static final path =
      Lens<GitPackageDependencySpec, Optional<String>>((s_) => s_.path, (s_, path) => s_.copyWith(path: path));
}

// ignore_for_file: ARGUMENT_TYPE_NOT_ASSIGNABLE
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: always_require_non_null_named_parameters
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
// ignore_for_file: implicit_dynamic_parameter
// ignore_for_file: join_return_with_assignment
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_asserts_with_message
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_single_quotes
// ignore_for_file: public_member_api_docs
// ignore_for_file: sort_constructors_first
// ignore_for_file: type_annotate_public_apis
