import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/loading_widget.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadDataStoreSuccess) {
          final records = state.records;

          if (records.isEmpty) {
            return const Center(
              child: Text('Data Empty'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            itemBuilder: (context, index) => Card(
              key: ValueKey('home_card_$index'),
              color: records[index].decrease
                  ? Colors.white
                  : Colors.red.withAlpha(100),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(records[index].volumeOfMobileData.toString()),
                    if (!records[index].decrease)
                      const Icon(
                        Icons.format_indent_decrease_sharp,
                        color: Colors.red,
                      ),
                  ],
                ),
              ),
            ),
            itemCount: records.length,
          );
        }
        return const LoadingWidget();
      },
    );
  }
}
