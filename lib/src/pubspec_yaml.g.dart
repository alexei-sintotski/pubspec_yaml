// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubspec_yaml.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $PubspecYaml {
  const $PubspecYaml();
  String get name;
  Optional<String> get version;
  Optional<String> get description;
  List<String> get authors;
  Optional<String> get homepage;
  Optional<String> get repository;
  Optional<String> get issueTracker;
  Optional<String> get documentation;
  Optional<String> get publishTo;
  Iterable<PackageDependencySpec> get dependencies;
  Iterable<PackageDependencySpec> get devDependencies;
  Iterable<PackageDependencySpec> get dependencyOverrides;
  Map<String, String> get environment;
  Map<String, Optional<String>> get executables;
  Map<String, dynamic> get customFields;
  PubspecYaml copyWith(
          {String name,
          Optional<String> version,
          Optional<String> description,
          List<String> authors,
          Optional<String> homepage,
          Optional<String> repository,
          Optional<String> issueTracker,
          Optional<String> documentation,
          Optional<String> publishTo,
          Iterable<PackageDependencySpec> dependencies,
          Iterable<PackageDependencySpec> devDependencies,
          Iterable<PackageDependencySpec> dependencyOverrides,
          Map<String, String> environment,
          Map<String, Optional<String>> executables,
          Map<String, dynamic> customFields}) =>
      PubspecYaml(
          name: name ?? this.name,
          version: version ?? this.version,
          description: description ?? this.description,
          authors: authors ?? this.authors,
          homepage: homepage ?? this.homepage,
          repository: repository ?? this.repository,
          issueTracker: issueTracker ?? this.issueTracker,
          documentation: documentation ?? this.documentation,
          publishTo: publishTo ?? this.publishTo,
          dependencies: dependencies ?? this.dependencies,
          devDependencies: devDependencies ?? this.devDependencies,
          dependencyOverrides: dependencyOverrides ?? this.dependencyOverrides,
          environment: environment ?? this.environment,
          executables: executables ?? this.executables,
          customFields: customFields ?? this.customFields);
  @override
  String toString() =>
      "PubspecYaml(name: $name, version: $version, description: $description, authors: $authors, homepage: $homepage, repository: $repository, issueTracker: $issueTracker, documentation: $documentation, publishTo: $publishTo, dependencies: $dependencies, devDependencies: $devDependencies, dependencyOverrides: $dependencyOverrides, environment: $environment, executables: $executables, customFields: $customFields)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      name == other.name &&
      version == other.version &&
      description == other.description &&
      const DeepCollectionEquality().equals(authors, other.authors) &&
      homepage == other.homepage &&
      repository == other.repository &&
      issueTracker == other.issueTracker &&
      documentation == other.documentation &&
      publishTo == other.publishTo &&
      const DeepCollectionEquality().equals(dependencies, other.dependencies) &&
      const DeepCollectionEquality()
          .equals(devDependencies, other.devDependencies) &&
      const DeepCollectionEquality()
          .equals(dependencyOverrides, other.dependencyOverrides) &&
      const DeepCollectionEquality().equals(environment, other.environment) &&
      const DeepCollectionEquality().equals(executables, other.executables) &&
      const DeepCollectionEquality().equals(customFields, other.customFields);
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + name.hashCode;
    result = 37 * result + version.hashCode;
    result = 37 * result + description.hashCode;
    result = 37 * result + const DeepCollectionEquality().hash(authors);
    result = 37 * result + homepage.hashCode;
    result = 37 * result + repository.hashCode;
    result = 37 * result + issueTracker.hashCode;
    result = 37 * result + documentation.hashCode;
    result = 37 * result + publishTo.hashCode;
    result = 37 * result + const DeepCollectionEquality().hash(dependencies);
    result = 37 * result + const DeepCollectionEquality().hash(devDependencies);
    result =
        37 * result + const DeepCollectionEquality().hash(dependencyOverrides);
    result = 37 * result + const DeepCollectionEquality().hash(environment);
    result = 37 * result + const DeepCollectionEquality().hash(executables);
    result = 37 * result + const DeepCollectionEquality().hash(customFields);
    return result;
  }
}

class PubspecYaml$ {
  static final name = Lens<PubspecYaml, String>(
      (s_) => s_.name, (s_, name) => s_.copyWith(name: name));
  static final version = Lens<PubspecYaml, Optional<String>>(
      (s_) => s_.version, (s_, version) => s_.copyWith(version: version));
  static final description = Lens<PubspecYaml, Optional<String>>(
      (s_) => s_.description,
      (s_, description) => s_.copyWith(description: description));
  static final authors = Lens<PubspecYaml, List<String>>(
      (s_) => s_.authors, (s_, authors) => s_.copyWith(authors: authors));
  static final homepage = Lens<PubspecYaml, Optional<String>>(
      (s_) => s_.homepage, (s_, homepage) => s_.copyWith(homepage: homepage));
  static final repository = Lens<PubspecYaml, Optional<String>>(
      (s_) => s_.repository,
      (s_, repository) => s_.copyWith(repository: repository));
  static final issueTracker = Lens<PubspecYaml, Optional<String>>(
      (s_) => s_.issueTracker,
      (s_, issueTracker) => s_.copyWith(issueTracker: issueTracker));
  static final documentation = Lens<PubspecYaml, Optional<String>>(
      (s_) => s_.documentation,
      (s_, documentation) => s_.copyWith(documentation: documentation));
  static final publishTo = Lens<PubspecYaml, Optional<String>>(
      (s_) => s_.publishTo,
      (s_, publishTo) => s_.copyWith(publishTo: publishTo));
  static final dependencies =
      Lens<PubspecYaml, Iterable<PackageDependencySpec>>(
          (s_) => s_.dependencies,
          (s_, dependencies) => s_.copyWith(dependencies: dependencies));
  static final devDependencies =
      Lens<PubspecYaml, Iterable<PackageDependencySpec>>(
          (s_) => s_.devDependencies,
          (s_, devDependencies) =>
              s_.copyWith(devDependencies: devDependencies));
  static final dependencyOverrides =
      Lens<PubspecYaml, Iterable<PackageDependencySpec>>(
          (s_) => s_.dependencyOverrides,
          (s_, dependencyOverrides) =>
              s_.copyWith(dependencyOverrides: dependencyOverrides));
  static final environment = Lens<PubspecYaml, Map<String, String>>(
      (s_) => s_.environment,
      (s_, environment) => s_.copyWith(environment: environment));
  static final executables = Lens<PubspecYaml, Map<String, Optional<String>>>(
      (s_) => s_.executables,
      (s_, executables) => s_.copyWith(executables: executables));
  static final customFields = Lens<PubspecYaml, Map<String, dynamic>>(
      (s_) => s_.customFields,
      (s_, customFields) => s_.copyWith(customFields: customFields));
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
