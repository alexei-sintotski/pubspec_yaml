// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubspec_yaml.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $PubspecYaml {
  String get name;
  Optional<String> get version;
  Optional<String> get description;
  Map<String, dynamic> get customFields;
  const $PubspecYaml();
  PubspecYaml copyWith(
          {String name, Optional<String> version, Optional<String> description, Map<String, dynamic> customFields}) =>
      PubspecYaml(
          name: name ?? this.name,
          version: version ?? this.version,
          description: description ?? this.description,
          customFields: customFields ?? this.customFields);
  String toString() =>
      "PubspecYaml(name: $name, version: $version, description: $description, customFields: $customFields)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      name == other.name &&
      version == other.version &&
      description == other.description &&
      customFields == other.customFields;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + name.hashCode;
    result = 37 * result + version.hashCode;
    result = 37 * result + description.hashCode;
    result = 37 * result + customFields.hashCode;
    return result;
  }
}

class PubspecYaml$ {
  static final name = Lens<PubspecYaml, String>((s_) => s_.name, (s_, name) => s_.copyWith(name: name));
  static final version =
      Lens<PubspecYaml, Optional<String>>((s_) => s_.version, (s_, version) => s_.copyWith(version: version));
  static final description = Lens<PubspecYaml, Optional<String>>(
      (s_) => s_.description, (s_, description) => s_.copyWith(description: description));
  static final customFields = Lens<PubspecYaml, Map<String, dynamic>>(
      (s_) => s_.customFields, (s_, customFields) => s_.copyWith(customFields: customFields));
}

// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: join_return_with_assignment
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_single_quotes
// ignore_for_file: sort_constructors_first
// ignore_for_file: type_annotate_public_apis
