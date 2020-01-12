/*
 * MIT License
 *
 * Copyright (c) 2019 Alexei Sintotski
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:functional_data/functional_data.dart' hide Optional;
import 'package:json2yaml/json2yaml.dart';
import 'package:meta/meta.dart';
import 'package:plain_optional/plain_optional.dart';
import 'package:yaml/yaml.dart';

import 'package_dependency_spec/package_dependency_spec.dart';
import 'package_dependency_spec/serializers.dart';

part 'pubspec_yaml.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_as

/// PubspecYaml is a data type representing data stored in pubspec.yaml files.
/// See https://dart.dev/tools/pub/pubspec for details
/// It provides the following facilities:
/// - Parser from pubspec.yaml YAML string
/// - Formatter to pubspec.yaml YAML string
/// - https://pub.dev/packages/functional_data is used to provide data type facilities
@immutable
@FunctionalData()
class PubspecYaml extends $PubspecYaml {
  /// Default constructor
  const PubspecYaml({
    @required this.name,
    this.version = const Optional.none(),
    this.description = const Optional.none(),
    this.authors = const [],
    this.homepage = const Optional.none(),
    this.repository = const Optional.none(),
    this.issueTracker = const Optional.none(),
    this.documentation = const Optional.none(),
    this.publishTo = const Optional.none(),
    this.dependencies = const [],
    this.devDependencies = const [],
    this.dependencyOverrides = const [],
    this.environment = const {},
    this.executables = const {},
    this.customFields = const <String, dynamic>{},
  });

  /// Imports PubspecYaml from a YAML string
  factory PubspecYaml.loadFromYamlString(String content) {
    assert(content != null, 'content must not be null');
    assert(content.trim().isNotEmpty, 'content must not be empty');
    return _loadFromYaml(content);
  }

  /// Package name (https://dart.dev/tools/pub/pubspec#name)
  final String name;

  /// Package version (https://dart.dev/tools/pub/pubspec#version)
  final Optional<String> version;

  /// Package description (https://dart.dev/tools/pub/pubspec#description)
  final Optional<String> description;

  /// Package authors (https://dart.dev/tools/pub/pubspec)
  @CustomEquality(DeepCollectionEquality())
  final List<String> authors;

  /// URL pointing to the package website (https://dart.dev/tools/pub/pubspec#homepage)
  final Optional<String> homepage;

  /// URL for package’s source code repository (https://dart.dev/tools/pub/pubspec#repository)
  final Optional<String> repository;

  ///URL for the package’s issue tracker, where existing bugs can be viewed and new bugs can be filed
  ///https://dart.dev/tools/pub/pubspec#issue-tracker
  final Optional<String> issueTracker;

  /// Site that hosts documentation, separate from the main homepage and from the Pub-generated API reference
  ///https://dart.dev/tools/pub/pubspec#documentation
  final Optional<String> documentation;

  /// This setting can be used to specify a custom pub package server to publish.
  /// The default uses the pub.dev site.
  /// Specify none to prevent a package from being published.
  /// https://dart.dev/tools/pub/pubspec#publish_to
  final Optional<String> publishTo;

  /// Regular dependencies that anyone using the package will also need
  /// https://dart.dev/tools/pub/pubspec#dependencies
  /// https://dart.dev/tools/pub/dependencies
  @CustomEquality(DeepCollectionEquality())
  final Iterable<PackageDependencySpec> dependencies;

  /// Dependencies that are only needed in the development phase of the package
  /// https://dart.dev/tools/pub/pubspec#dependencies
  /// https://dart.dev/tools/pub/dependencies
  @CustomEquality(DeepCollectionEquality())
  final Iterable<PackageDependencySpec> devDependencies;

  /// Temporarily override all references to a dependency
  /// https://dart.dev/tools/pub/pubspec#dependencies
  /// https://dart.dev/tools/pub/dependencies
  @CustomEquality(DeepCollectionEquality())
  final Iterable<PackageDependencySpec> dependencyOverrides;

  /// SDK constraints
  /// https://dart.dev/tools/pub/pubspec#sdk-constraints
  @CustomEquality(DeepCollectionEquality())
  final Map<String, String> environment;

  /// Executables that can be run directly from the command line
  /// https://dart.dev/tools/pub/pubspec#executables
  @CustomEquality(DeepCollectionEquality())
  final Map<String, Optional<String>> executables;

  /// JSON representation of other pubspec.yaml fields
  @CustomEquality(DeepCollectionEquality())
  final Map<String, dynamic> customFields;

  /// Exports PubspecYaml instance as a YAML string
  String toYamlString() => _formatToYaml(this);
}

/// Extension class on String to import PubspecYaml from a YAML string
extension PubspecYamlFromYamlString on String {
  /// Creates PubspecYaml from a YAML string
  PubspecYaml toPubspecYaml() => PubspecYaml.loadFromYamlString(this);
}

// =====================================================================================================================
// Implementation details
// =====================================================================================================================

String _formatToYaml(PubspecYaml pubspecYaml) => '${[
      _packageMetadataToYaml(pubspecYaml),
      if (pubspecYaml.dependencies.isNotEmpty) _dependenciesToYaml(pubspecYaml.dependencies, _Tokens.dependencies),
      if (pubspecYaml.devDependencies.isNotEmpty)
        _dependenciesToYaml(pubspecYaml.devDependencies, _Tokens.devDependencies),
      if (pubspecYaml.dependencyOverrides.isNotEmpty)
        _dependenciesToYaml(pubspecYaml.dependencyOverrides, _Tokens.dependencyOverrides),
      if (pubspecYaml.environment.isNotEmpty) _environmentToYaml(pubspecYaml.environment),
      if (pubspecYaml.executables.isNotEmpty) _executablesToYaml(pubspecYaml.executables),
      for (final customField in pubspecYaml.customFields.entries)
        json2yaml(Map<String, dynamic>.fromEntries({customField}), yamlStyle: YamlStyle.pubspecYaml),
    ].join("\n\n")}\n';

String _packageMetadataToYaml(PubspecYaml pubspecYaml) => json2yaml(<String, dynamic>{
      _Tokens.name: pubspecYaml.name,
      if (pubspecYaml.version.hasValue) _Tokens.version: pubspecYaml.version.valueOr(() => ''),
      if (pubspecYaml.description.hasValue) _Tokens.description: pubspecYaml.description.valueOr(() => ''),
      if (pubspecYaml.authors.length == 1) _Tokens.author: pubspecYaml.authors.first,
      if (pubspecYaml.authors.length > 1) _Tokens.authors: pubspecYaml.authors,
      if (pubspecYaml.homepage.hasValue) _Tokens.homepage: pubspecYaml.homepage.valueOr(() => ''),
      if (pubspecYaml.repository.hasValue) _Tokens.repository: pubspecYaml.repository.valueOr(() => ''),
      if (pubspecYaml.issueTracker.hasValue) _Tokens.issueTracker: pubspecYaml.issueTracker.valueOr(() => ''),
      if (pubspecYaml.documentation.hasValue) _Tokens.documentation: pubspecYaml.documentation.valueOr(() => ''),
      if (pubspecYaml.publishTo.hasValue) _Tokens.publishTo: pubspecYaml.publishTo.valueOr(() => ''),
    }, yamlStyle: YamlStyle.pubspecYaml);

String _dependenciesToYaml(
  Iterable<PackageDependencySpec> dependencies,
  String key,
) =>
    json2yaml(_dependenciesToJson(dependencies, key), yamlStyle: YamlStyle.pubspecYaml);

Map<String, dynamic> _dependenciesToJson(
  Iterable<PackageDependencySpec> dependencies,
  String key,
) =>
    <String, dynamic>{
      key: <String, dynamic>{
        for (final dep in dependencies.toList()..sort((a, b) => a.package().compareTo(b.package()))) ...dep.toJson()
      }
    };

String _environmentToYaml(Map<String, String> environment) => json2yaml(
      <String, dynamic>{_Tokens.environment: environment},
      yamlStyle: YamlStyle.pubspecYaml,
    );

String _executablesToYaml(Map<String, Optional<String>> executables) => json2yaml(
      <String, dynamic>{
        _Tokens.executables: <String, dynamic>{
          for (final entry in executables.entries) entry.key: entry.value.valueOr(() => null),
        }
      },
      yamlStyle: YamlStyle.pubspecYaml,
    );

PubspecYaml _loadFromYaml(String content) {
  final jsonMap = json.decode(json.encode(loadYaml(content))) as Map<String, dynamic>;
  return PubspecYaml(
    name: jsonMap[_Tokens.name] as String,
    version: Optional(jsonMap[_Tokens.version] as String),
    description: Optional(jsonMap[_Tokens.description] as String),
    authors: [
      if (jsonMap[_Tokens.author] != null) jsonMap[_Tokens.author] as String,
      if (jsonMap[_Tokens.authors] != null)
        ...(jsonMap[_Tokens.authors] as List<dynamic>).map((dynamic author) => author as String)
    ],
    homepage: Optional(jsonMap[_Tokens.homepage] as String),
    repository: Optional(jsonMap[_Tokens.repository] as String),
    issueTracker: Optional(jsonMap[_Tokens.issueTracker] as String),
    documentation: Optional(jsonMap[_Tokens.documentation] as String),
    dependencies: _loadDependencies(jsonMap, _Tokens.dependencies),
    devDependencies: _loadDependencies(jsonMap, _Tokens.devDependencies),
    dependencyOverrides: _loadDependencies(jsonMap, _Tokens.dependencyOverrides),
    environment: jsonMap.containsKey(_Tokens.environment) && jsonMap[_Tokens.environment] != null
        ? _loadEnvironment(jsonMap[_Tokens.environment] as Map<String, dynamic>)
        : {},
    executables: jsonMap.containsKey(_Tokens.executables) && jsonMap[_Tokens.executables] != null
        ? _loadExecutables(jsonMap[_Tokens.executables] as Map<String, dynamic>)
        : {},
    publishTo: Optional(jsonMap[_Tokens.publishTo] as String),
    customFields: Map<String, dynamic>.fromEntries(jsonMap.entries.where((entry) => !_knownTokens.contains(entry.key))),
  );
}

Iterable<PackageDependencySpec> _loadDependencies(Map<String, dynamic> jsonMap, String key) => [
      if (jsonMap.containsKey(key) && jsonMap[key] != null)
        ...(jsonMap[key] as Map<String, dynamic>).entries.map(loadPackageDependencySpec)
    ];

Map<String, String> _loadEnvironment(Map<String, dynamic> environment) =>
    environment.map((key, dynamic value) => MapEntry(key, value as String));

Map<String, Optional<String>> _loadExecutables(Map<String, dynamic> executables) =>
    executables.map((key, dynamic value) => MapEntry(key, Optional(value as String)));

const _knownTokens = [
  _Tokens.name,
  _Tokens.version,
  _Tokens.description,
  _Tokens.author,
  _Tokens.authors,
  _Tokens.homepage,
  _Tokens.repository,
  _Tokens.issueTracker,
  _Tokens.documentation,
  _Tokens.dependencies,
  _Tokens.executables,
  _Tokens.devDependencies,
  _Tokens.dependencyOverrides,
  _Tokens.environment,
  _Tokens.publishTo,
];

class _Tokens {
  static const name = 'name';
  static const version = 'version';
  static const description = 'description';
  static const author = 'author';
  static const authors = 'authors';
  static const homepage = 'homepage';
  static const repository = 'repository';
  static const issueTracker = 'issue_tracker';
  static const documentation = 'documentation';
  static const dependencies = 'dependencies';
  static const executables = 'executables';
  static const devDependencies = 'dev_dependencies';
  static const dependencyOverrides = 'dependency_overrides';
  static const environment = 'environment';
  static const publishTo = 'publish_to';
}
