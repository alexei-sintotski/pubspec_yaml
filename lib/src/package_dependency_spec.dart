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

import 'package:meta/meta.dart';
import 'package:sum_types/sum_types.dart';

import 'dependency_specs/hosted_package_dependency_spec.dart';
import 'dependency_specs/path_package_dependency_spec.dart';
import 'dependency_specs/sdk_package_dependency_spec.dart';
import 'git_package_dependency_spec/git_package_dependency_spec.dart';

part 'package_dependency_spec.g.dart';

/// Package dependency specification (https://dart.dev/tools/pub/dependencies)
@immutable
@SumType()
class PackageDependencySpec extends _$PackageDependencySpec {
  const PackageDependencySpec.sdk(SdkPackageDependencySpec package) : super(sdk: package);
  const PackageDependencySpec.git(GitPackageDependencySpec package) : super(git: package);
  const PackageDependencySpec.path(PathPackageDependencySpec package) : super(path: package);
  const PackageDependencySpec.hosted(HostedPackageDependencySpec package) : super(hosted: package);

  /// Returns package name
  String package() => iswitch(
        sdk: (p) => p.package,
        git: (p) => p.package,
        path: (p) => p.package,
        hosted: (p) => p.package,
      );
}
