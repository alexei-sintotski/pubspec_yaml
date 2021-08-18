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

// ignore_for_file: avoid_as
// ignore_for_file: public_member_api_docs

import 'package:plain_optional/plain_optional.dart';

import 'hosted_package_dependency_spec.dart';

extension HostedPackageDependencySpecToJson on HostedPackageDependencySpec {
  Map<String, dynamic> toJson() => <String, dynamic>{
        package: url.hasValue
            ? <String, dynamic>{
                _Tokens.hosted: <String, dynamic>{
                  if (name.hasValue) _Tokens.name: name.valueOr(() => ''),
                  if (url.hasValue) _Tokens.url: url.valueOr(() => ''),
                },
                if (version.hasValue)
                  _Tokens.version: version.valueOr(() => ''),
              }
            : _nullIfEmpty(version.valueOr(() => '')),
      };
}

HostedPackageDependencySpec loadHostedPackageDependencySpec(
  MapEntry<String, dynamic> entry,
) {
  final package = entry.key;
  final dynamic definition = entry.value;
  if (definition is Map<String, dynamic>) {
    if (definition.containsKey(_Tokens.hosted)) {
      return _loadGenericHostedDependency(package, definition);
    }
  }
  return _loadPubDevHostedDependency(package, definition as String?);
}

HostedPackageDependencySpec _loadPubDevHostedDependency(
  String package,
  String? definition,
) =>
    HostedPackageDependencySpec(
      package: package,
      version: Optional(definition),
    );

HostedPackageDependencySpec _loadGenericHostedDependency(
  String package,
  Map<String, dynamic> definition,
) {
  final definitionBody = definition[_Tokens.hosted] as Map<String, dynamic>;
  return HostedPackageDependencySpec(
    package: package,
    version: Optional(definition[_Tokens.version] as String?),
    name: Optional(definitionBody[_Tokens.name] as String?),
    url: Optional(definitionBody[_Tokens.url] as String?),
  );
}

class _Tokens {
  static const name = 'name';
  static const version = 'version';
  static const url = 'url';
  static const hosted = 'hosted';
}

String? _nullIfEmpty(String s) => s.isEmpty ? null : s;
