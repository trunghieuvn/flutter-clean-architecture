import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/auth_hide_keyboard.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc get homeBloc => BlocProvider.of<HomeBloc>(context);

  @override
  void initState() {
    homeBloc.add(LoadDataStoreEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoHideKeyboard(
      child: BlocBuilder<HomeBloc, HomeState>(
        cubit: homeBloc,
        builder: (context, state) {
          if (state is LoadDataStoreSuccess) {
            final records = state.dataStoreModel.result.records;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(records[index].volume_of_mobile_data.toString()),
                ),
              ),
              itemCount: records.length,
            );
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
