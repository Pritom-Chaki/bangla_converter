## 2.0.0

* **BREAKING:** `banglaDate()` parameters `day`, `month`, `year` now accept `int?` instead of `dynamic`.
* **BREAKING:** `englishDate()` parameters `banglaDay`, `banglaMonth`, `banglaYear` are now `required int`.
* Fixed Bangla date calculation to use actual month lengths (31/30 days) instead of uniform 30-day approximation.
* Fixed `monthDigit` in `BanglaDateReturn` to be 1-based instead of 0-based.
* Removed unnecessary `flutter/material.dart` dependency from core converter.
* Replaced verbose switch statements with efficient Map lookups.
* Added `toString()`, `==`, and `hashCode` to `BanglaDateReturn` model.
* Exported all public types (`BanglaData`, `BanglaDateReturn`) from barrel file.
* Added comprehensive unit tests.
* Added `topics` and `issue_tracker` to pubspec for better pub.dev discoverability.
* Fixed README installation instructions and usage examples.

## 1.1.0

* Bangla to English Date Converter 
* English to Bangla Date Converter

## 1.0.0

* Flutter version updated.

## 0.0.2

* Some property updated.

## 0.0.1

* Initial release.

