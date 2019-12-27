// Copyright 2019 Allan Caine. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

///
/// This code defines convenient extensions on the String class
///
extension StringExt on String {
  get isNullOrEmpty => this == null || this.isEmpty;
}
