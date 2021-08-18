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
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

import 'package:plain_optional/plain_optional.dart';

import 'git_package_dependency_spec.dart';

// ignore_for_file: avoid_as
// ignore_for_file: public_member_api_docs

GitPackageDependencySpec loadGitPackageDependencySpec(
  MapEntry<String, dynamic> entry,
) {
  final package = entry.key;
  final dynamic definition = (entry.value as Map<String, dynamic>)[_Tokens.git];
  if (definition is String) {
    return _loadFromSimpleGitDependencyDefinition(package, definition);
  } else {
    return _loadFromDetailedGitDependencyDefinition(
        package, definition as Map<String, dynamic>);
  }
}

extension GitPackageDependencySpecToJson on GitPackageDependencySpec {
  Map<String, dynamic> toJson() => <String, dynamic>{
        package: <String, dynamic>{
          _Tokens.git: ref.hasValue || path.hasValue
              ? <String, dynamic>{
                  _Tokens.url: url,
                  if (ref.hasValue) _Tokens.ref: ref.valueOr(() => ''),
                  if (path.hasValue) _Tokens.path: path.valueOr(() => ''),
                }
              : url,
        },
      };
}

GitPackageDependencySpec _loadFromSimpleGitDependencyDefinition(
  String package,
  String url,
) =>
    GitPackageDependencySpec(package: package, url: url);

GitPackageDependencySpec _loadFromDetailedGitDependencyDefinition(
  String package,
  Map<String, dynamic> definition,
) =>
    GitPackageDependencySpec(
      package: package,
      url: definition[_Tokens.url] as String,
      ref: Optional(definition[_Tokens.ref] as String?),
      path: Optional(definition[_Tokens.path] as String?),
    );

class _Tokens {
  static const git = 'git';
  static const url = 'url';
  static const ref = 'ref';
  static const path = 'path';
}
