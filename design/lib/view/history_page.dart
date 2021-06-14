import 'package:design/bloc/bloc.dart';
import 'package:design/components/history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {

  @override
  _HistoryPageState createState ()=> _HistoryPageState();
}
class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {

    Text heading = Text(
      'Your Link History',
      style: Theme.of(context).textTheme.headline6,
    );

    return BlocBuilder<ShortlyBloc, ShortlyState>(
      builder: (_, state) {
        if (state is AvailableLinks) {
          return Column(
            children: [
              SizedBox(height: 32),
              heading,
              Expanded(
                child: ListView.builder(
                  itemCount: state.rows.length,
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 40),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return HistoryItem(item: state.rows[index]);
                  },
                ),
              ),
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
