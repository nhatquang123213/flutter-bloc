import 'dart:async';
import 'dart:math';

class Logic {
  final StreamController controller = StreamController();
  Sink get sink => controller.sink;
  Stream get stream => controller.stream;

  int count = 0;
  increaseCount() {
    count++;
    sink.add(count);
  }
}

main() {}
