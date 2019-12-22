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

import 'package:plain_optional/plain_optional.dart';
import 'package:pubspec_yaml/src/dependency_specs/git_package_dependency_spec.dart';
import 'package:pubspec_yaml/src/dependency_specs/hosted_package_dependency_spec.dart';
import 'package:pubspec_yaml/src/dependency_specs/path_package_dependency_spec.dart';
import 'package:pubspec_yaml/src/dependency_specs/sdk_package_dependency_spec.dart';
import 'package:pubspec_yaml/src/package_dependency_spec.dart';
import 'package:yaml/yaml.dart';

import '../pubspec_yaml.dart';
import 'tokens.dart';

// ignore_for_file: avoid_as
// ignore_for_file: avoid_annotating_with_dynamic

PubspecYaml loadFromYaml(String content) {
  final jsonMap = json.decode(json.encode(loadYaml(content))) as Map<String, dynamic>;
  return PubspecYaml(
    name: jsonMap[Tokens.name] as String,
    version: Optional(jsonMap[Tokens.version] as String),
    description: Optional(jsonMap[Tokens.description] as String),
    authors: [
      if (jsonMap[Tokens.author] != null) jsonMap[Tokens.author] as String,
      if (jsonMap[Tokens.authors] != null)
        ...(jsonMap[Tokens.authors] as List<dynamic>).map((dynamic author) => author as String)
    ],
    homepage: Optional(jsonMap[Tokens.homepage] as String),
    repository: Optional(jsonMap[Tokens.repository] as String),
    issueTracker: Optional(jsonMap[Tokens.issueTracker] as String),
    documentation: Optional(jsonMap[Tokens.documentation] as String),
    dependencies: _loadDependenciesIfRequired(jsonMap, Tokens.dependencies),
    devDependencies: _loadDependenciesIfRequired(jsonMap, Tokens.devDependencies),
    dependencyOverrides: _loadDependenciesIfRequired(jsonMap, Tokens.dependencyOverrides),
    executables: jsonMap.containsKey(Tokens.executables) && jsonMap[Tokens.executables] != null
        ? _loadExecutables(jsonMap[Tokens.executables] as Map<String, dynamic>)
        : {},
    customFields: Map<String, dynamic>.fromEntries(jsonMap.entries.where((entry) => !_knownTokens.contains(entry.key))),
  );
}

Iterable<PackageDependencySpec> _loadDependenciesIfRequired(Map<String, dynamic> jsonMap, String key) =>
    jsonMap.containsKey(key) && jsonMap[key] != null ? _loadDependencies(jsonMap[key] as Map<String, dynamic>) : [];

Iterable<PackageDependencySpec> _loadDependencies(Map<String, dynamic> dependencies) =>
    dependencies.entries.map((entry) {
      final dynamic value = entry.value;
      if (value is Map<String, dynamic>) {
        if (value.containsKey(Tokens.sdk)) {
          return PackageDependencySpec.sdk(_loadSdkDependency(entry.key, value));
        } else if (value.containsKey(Tokens.git)) {
          return PackageDependencySpec.git(_loadGitDependency(entry.key, value[Tokens.git]));
        } else if (value.containsKey(Tokens.path)) {
          return PackageDependencySpec.path(PathPackageDependencySpec(
            package: entry.key,
            path: value[Tokens.path] as String,
          ));
        } else if (value.containsKey(Tokens.hosted)) {
          return PackageDependencySpec.hosted(_loadGenericHostedDependency(entry.key, value));
        }
      }
      return PackageDependencySpec.hosted(_loadPubDevHostedDependency(entry.key, value));
    });

SdkPackageDependencySpec _loadSdkDependency(String package, Map<String, dynamic> definition) =>
    SdkPackageDependencySpec(
      package: package,
      sdk: definition[Tokens.sdk] as String,
      version: Optional(definition[Tokens.version] as String),
    );

GitPackageDependencySpec _loadGitDependency(String package, dynamic definition) {
  if (definition is String) {
    return _loadFromSimpleGitDependencyDefinition(package, definition);
  } else {
    return _loadFromDetailedGitDependencyDefinition(package, definition as Map<String, dynamic>);
  }
}

GitPackageDependencySpec _loadFromSimpleGitDependencyDefinition(String package, String url) =>
    GitPackageDependencySpec(package: package, url: url);

GitPackageDependencySpec _loadFromDetailedGitDependencyDefinition(String package, Map<String, dynamic> definition) =>
    GitPackageDependencySpec(
      package: package,
      url: definition[Tokens.url] as String,
      ref: Optional(definition[Tokens.ref] as String),
      path: Optional(definition[Tokens.path] as String),
    );

HostedPackageDependencySpec _loadPubDevHostedDependency(String package, dynamic definition) =>
    HostedPackageDependencySpec(
      package: package,
      version: Optional(definition as String),
    );

HostedPackageDependencySpec _loadGenericHostedDependency(String package, Map<String, dynamic> definition) {
  final definitionBody = definition[Tokens.hosted] as Map<String, dynamic>;
  return HostedPackageDependencySpec(
    package: package,
    version: Optional(definition[Tokens.version] as String),
    name: Optional(definitionBody[Tokens.name] as String),
    url: Optional(definitionBody[Tokens.url] as String),
  );
}

Map<String, Optional<String>> _loadExecutables(Map<String, dynamic> executables) =>
    executables.map((key, dynamic value) => MapEntry(
          key,
          Optional(value as String),
        ));

const _knownTokens = [
  Tokens.name,
  Tokens.version,
  Tokens.description,
  Tokens.author,
  Tokens.authors,
  Tokens.homepage,
  Tokens.repository,
  Tokens.issueTracker,
  Tokens.documentation,
  Tokens.dependencies,
  Tokens.executables,
  Tokens.devDependencies,
  Tokens.dependencyOverrides,
];
