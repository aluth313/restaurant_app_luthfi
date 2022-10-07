import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/provider/page_provider.dart';

void main() {
  test(
    'should change the page to 1',
    () {
      var pageProvider = PageProvider();
      pageProvider.setPage(1);

      expect(pageProvider.page, 1);
    },
  );
}
