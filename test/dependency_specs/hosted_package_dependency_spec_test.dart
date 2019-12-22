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
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with hosted package dependency', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithHostedPackageDependency);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with single dependency', () {
        expect(pubspecYaml.dependencies.length, 1);
      });
      test('produces object with GitPackageDependencySpec', () {
        expect(pubspecYaml.dependencies.first.iswitcho(hosted: (p) => p, otherwise: () => null), isNotNull);
      });
      test('produces object with correct dependency name', () {
        expect(pubspecYaml.dependencies.first.package(), dependency);
      });
      test('produces object without version specification', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            hosted: (p) => p.version.hasValue,
            otherwise: () => true,
          ),
          isFalse,
        );
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithHostedPackageDependency);
      });
    });
  });

  group('given pubspec.yaml with hosted package dependency with version specification', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithVersionSpec);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct dependency name', () {
        expect(pubspecYaml.dependencies.first.package(), dependency);
      });
      test('produces object with defined version', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            hosted: (p) => p.version.hasValue,
            otherwise: () => false,
          ),
          isTrue,
        );
      });
      test('produces object with correct version', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            hosted: (p) => p.version.valueOr(() => ''),
            otherwise: () => '',
          ),
          version,
        );
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithVersionSpec);
      });
    });
  });

  group('given pubspec.yaml with dependency hosted elsewhere', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithPackageHostedElsewhere);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct dependency name', () {
        expect(pubspecYaml.dependencies.first.package(), dependency);
      });
      test('produces object with correct dependency name on server', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            hosted: (p) => p.name.valueOr(() => ''),
            otherwise: () => '',
          ),
          name,
        );
      });
      test('produces object with correct server url', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            hosted: (p) => p.url.valueOr(() => ''),
            otherwise: () => '',
          ),
          url,
        );
      });
      test('produces object without version specification', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            hosted: (p) => p.version.hasValue,
            otherwise: () => true,
          ),
          isFalse,
        );
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithPackageHostedElsewhere);
      });
    });
  });

  group('given pubspec.yaml with dependency hosted elsewhere with version spec', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithPackageHostedElsewhereWithVersionSpec);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with defined version', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            hosted: (p) => p.version.hasValue,
            otherwise: () => false,
          ),
          isTrue,
        );
      });

      test('produces object with correct version specification', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            hosted: (p) => p.version.valueOr(() => ''),
            otherwise: () => '',
          ),
          version,
        );
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithPackageHostedElsewhereWithVersionSpec);
      });
    });
  });
}

const dependency = 'transmogrify';
const pubspecYamlWithHostedPackageDependency = '''
name: pubspec_yaml

dependencies:
  $dependency:
''';

const version = '^1.4.0';
const pubspecYamlWithVersionSpec = '''
name: pubspec_yaml

dependencies:
  $dependency: $version
''';

const name = 'transmogrify';
const url = 'http://your-package-server.com';
const pubspecYamlWithPackageHostedElsewhere = '''
name: pubspec_yaml

dependencies:
  $dependency:
    hosted:
      name: $name
      url: "$url"
''';

const pubspecYamlWithPackageHostedElsewhereWithVersionSpec = '''
name: pubspec_yaml

dependencies:
  $dependency:
    hosted:
      name: $name
      url: "$url"
    version: $version
''';
