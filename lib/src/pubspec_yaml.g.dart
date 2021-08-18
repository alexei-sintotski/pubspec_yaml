// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubspec_yaml.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

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

  PubspecYaml copyWith({
    String? name,
    Optional<String>? version,
    Optional<String>? description,
    List<String>? authors,
    Optional<String>? homepage,
    Optional<String>? repository,
    Optional<String>? issueTracker,
    Optional<String>? documentation,
    Optional<String>? publishTo,
    Iterable<PackageDependencySpec>? dependencies,
    Iterable<PackageDependencySpec>? devDependencies,
    Iterable<PackageDependencySpec>? dependencyOverrides,
    Map<String, String>? environment,
    Map<String, Optional<String>>? executables,
    Map<String, dynamic>? customFields,
  }) =>
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
        customFields: customFields ?? this.customFields,
      );

  PubspecYaml copyUsing(void Function(PubspecYaml$Change change) mutator) {
    final change = PubspecYaml$Change._(
      this.name,
      this.version,
      this.description,
      this.authors,
      this.homepage,
      this.repository,
      this.issueTracker,
      this.documentation,
      this.publishTo,
      this.dependencies,
      this.devDependencies,
      this.dependencyOverrides,
      this.environment,
      this.executables,
      this.customFields,
    );
    mutator(change);
    return PubspecYaml(
      name: change.name,
      version: change.version,
      description: change.description,
      authors: change.authors,
      homepage: change.homepage,
      repository: change.repository,
      issueTracker: change.issueTracker,
      documentation: change.documentation,
      publishTo: change.publishTo,
      dependencies: change.dependencies,
      devDependencies: change.devDependencies,
      dependencyOverrides: change.dependencyOverrides,
      environment: change.environment,
      executables: change.executables,
      customFields: change.customFields,
    );
  }

  @override
  String toString() =>
      "PubspecYaml(name: $name, version: $version, description: $description, authors: $authors, homepage: $homepage, repository: $repository, issueTracker: $issueTracker, documentation: $documentation, publishTo: $publishTo, dependencies: $dependencies, devDependencies: $devDependencies, dependencyOverrides: $dependencyOverrides, environment: $environment, executables: $executables, customFields: $customFields)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is PubspecYaml &&
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
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
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

class PubspecYaml$Change {
  PubspecYaml$Change._(
    this.name,
    this.version,
    this.description,
    this.authors,
    this.homepage,
    this.repository,
    this.issueTracker,
    this.documentation,
    this.publishTo,
    this.dependencies,
    this.devDependencies,
    this.dependencyOverrides,
    this.environment,
    this.executables,
    this.customFields,
  );

  String name;
  Optional<String> version;
  Optional<String> description;
  List<String> authors;
  Optional<String> homepage;
  Optional<String> repository;
  Optional<String> issueTracker;
  Optional<String> documentation;
  Optional<String> publishTo;
  Iterable<PackageDependencySpec> dependencies;
  Iterable<PackageDependencySpec> devDependencies;
  Iterable<PackageDependencySpec> dependencyOverrides;
  Map<String, String> environment;
  Map<String, Optional<String>> executables;
  Map<String, dynamic> customFields;
}

// ignore: avoid_classes_with_only_static_members
class PubspecYaml$ {
  static final name = Lens<PubspecYaml, String>(
    (nameContainer) => nameContainer.name,
    (nameContainer, name) => nameContainer.copyWith(name: name),
  );

  static final version = Lens<PubspecYaml, Optional<String>>(
    (versionContainer) => versionContainer.version,
    (versionContainer, version) => versionContainer.copyWith(version: version),
  );

  static final description = Lens<PubspecYaml, Optional<String>>(
    (descriptionContainer) => descriptionContainer.description,
    (descriptionContainer, description) =>
        descriptionContainer.copyWith(description: description),
  );

  static final authors = Lens<PubspecYaml, List<String>>(
    (authorsContainer) => authorsContainer.authors,
    (authorsContainer, authors) => authorsContainer.copyWith(authors: authors),
  );

  static final homepage = Lens<PubspecYaml, Optional<String>>(
    (homepageContainer) => homepageContainer.homepage,
    (homepageContainer, homepage) =>
        homepageContainer.copyWith(homepage: homepage),
  );

  static final repository = Lens<PubspecYaml, Optional<String>>(
    (repositoryContainer) => repositoryContainer.repository,
    (repositoryContainer, repository) =>
        repositoryContainer.copyWith(repository: repository),
  );

  static final issueTracker = Lens<PubspecYaml, Optional<String>>(
    (issueTrackerContainer) => issueTrackerContainer.issueTracker,
    (issueTrackerContainer, issueTracker) =>
        issueTrackerContainer.copyWith(issueTracker: issueTracker),
  );

  static final documentation = Lens<PubspecYaml, Optional<String>>(
    (documentationContainer) => documentationContainer.documentation,
    (documentationContainer, documentation) =>
        documentationContainer.copyWith(documentation: documentation),
  );

  static final publishTo = Lens<PubspecYaml, Optional<String>>(
    (publishToContainer) => publishToContainer.publishTo,
    (publishToContainer, publishTo) =>
        publishToContainer.copyWith(publishTo: publishTo),
  );

  static final dependencies =
      Lens<PubspecYaml, Iterable<PackageDependencySpec>>(
    (dependenciesContainer) => dependenciesContainer.dependencies,
    (dependenciesContainer, dependencies) =>
        dependenciesContainer.copyWith(dependencies: dependencies),
  );

  static final devDependencies =
      Lens<PubspecYaml, Iterable<PackageDependencySpec>>(
    (devDependenciesContainer) => devDependenciesContainer.devDependencies,
    (devDependenciesContainer, devDependencies) =>
        devDependenciesContainer.copyWith(devDependencies: devDependencies),
  );

  static final dependencyOverrides =
      Lens<PubspecYaml, Iterable<PackageDependencySpec>>(
    (dependencyOverridesContainer) =>
        dependencyOverridesContainer.dependencyOverrides,
    (dependencyOverridesContainer, dependencyOverrides) =>
        dependencyOverridesContainer.copyWith(
            dependencyOverrides: dependencyOverrides),
  );

  static final environment = Lens<PubspecYaml, Map<String, String>>(
    (environmentContainer) => environmentContainer.environment,
    (environmentContainer, environment) =>
        environmentContainer.copyWith(environment: environment),
  );

  static final executables = Lens<PubspecYaml, Map<String, Optional<String>>>(
    (executablesContainer) => executablesContainer.executables,
    (executablesContainer, executables) =>
        executablesContainer.copyWith(executables: executables),
  );

  static final customFields = Lens<PubspecYaml, Map<String, dynamic>>(
    (customFieldsContainer) => customFieldsContainer.customFields,
    (customFieldsContainer, customFields) =>
        customFieldsContainer.copyWith(customFields: customFields),
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
