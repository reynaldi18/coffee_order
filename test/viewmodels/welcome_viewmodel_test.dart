import 'package:flutter_test/flutter_test.dart';
import 'package:coffee_order_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('WelcomeViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
