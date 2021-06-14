import 'package:flutter/services.dart';

import 'package:design/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_button.dart';

class HistoryItem extends StatefulWidget {
  final Map<String, dynamic> item;

  const HistoryItem({Key key, @required this.item}) : super(key: key);

  @override
  _HistoryItemState createState ()=> _HistoryItemState();
}
class _HistoryItemState extends State<HistoryItem> {
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    Widget deleteIcon = SvgPicture.asset('assets/del.svg');
    Text url = Text(
      widget.item['url'],
      maxLines: 1,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodyText1,
    );

    Text shortenUrl = Text(
      widget.item['shorten_url'],
      maxLines: 1,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Theme.of(context).buttonColor,
          ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: url,
            ),
            Flexible(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  context.read<ShortlyBloc>()..add(DeleteItem(id:  widget.item['_id']));
                },
                child: deleteIcon,
              ),
            ),
          ],
        ),
        SizedBox(height: 32, child: Divider()),
        shortenUrl,
        SizedBox(height: 16),
        CustomButton(
          label: isCopied ? 'Copied!' : 'Copy',
          isCopied: isCopied,
          onPressed: () {
            Clipboard.setData(ClipboardData(text:  widget.item['shorten_url']));
            setState(() {
              isCopied = true;
            });
          },
        ),
        SizedBox(height: 16),
      ],
    ).roundedCorner();
  }
}

extension ItemDesign on Widget {
  Container roundedCorner() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: this,
    );
  }
}
