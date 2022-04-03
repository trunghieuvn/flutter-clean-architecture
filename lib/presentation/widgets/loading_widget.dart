import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: ValueKey('home_LoadingWidget'),
      child: CupertinoActivityIndicator(),
    );
  }
}
