import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/auth_hide_keyboard.dart';
import '../../../widgets/button_widget.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc get homeBloc => BlocProvider.of<HomeBloc>(context);
  @override
  Widget build(BuildContext context) {
    return AutoHideKeyboard(
      child: Column(
        children: [
          ButtonWidget.primary(
            context,
            title: 'OKE',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
