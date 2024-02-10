library epubreadertest;

import 'dart:math';

import 'package:epubx/src/schema/navigation/epub_navigation_doc_title.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';

main() async {
  final generator = RandomDataGenerator(Random(7898), 10);
  final EpubNavigationDocTitle reference = generator.randomNavigationDocTitle();

  late EpubNavigationDocTitle testNavigationDocTitle;
  setUp(() async {
    testNavigationDocTitle = EpubNavigationDocTitle()
      ..Titles = List.from(reference.Titles ?? []);
  });

  group("EpubNavigationDocTitle", () {
    group(".equals", () {
      test("is true for equivalent objects", () async {
        expect(testNavigationDocTitle, equals(reference));
      });

      test("is false when Titles changes", () async {
        testNavigationDocTitle.Titles?.add(generator.randomString());
        expect(testNavigationDocTitle, isNot(reference));
      });
    });

    group(".hashCode", () {
      test("is true for equivalent objects", () async {
        expect(testNavigationDocTitle.hashCode, equals(reference.hashCode));
      });

      test("is false when Titles changes", () async {
        testNavigationDocTitle.Titles?.add(generator.randomString());
        expect(testNavigationDocTitle.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
