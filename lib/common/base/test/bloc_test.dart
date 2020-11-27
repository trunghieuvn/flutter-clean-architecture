import 'package:meta/meta.dart';

import 'package:bloc_test/bloc_test.dart' as bloc_test;
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBlocTest<B extends Bloc<E, S>, E, S> {
  BaseBlocTest();
  void test(
    String description, {
    B Function() build,
    Future<void> Function(B bloc) act,
    Duration wait,
    Future<void> Function(B bloc) verify,
    @required Iterable expect,
  }) {
    return bloc_test.blocTest<B, S>(
      description,
      build: build,
      wait: wait,
      verify: verify,
      act: act,
      expect: expect,
    );
  }
}
