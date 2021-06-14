import 'package:design/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components.dart';

class CustomEditor extends StatefulWidget {
  @override
  _CustomEditorState createState() => _CustomEditorState();
}

class _CustomEditorState extends State<CustomEditor> {
  TextEditingController controller = TextEditingController();
  bool _validate = false;

  TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return BlocListener<ShortlyBloc, ShortlyState>(
      listener: (_, state) {
        if (state is LinkShortened) {
          setState(() {
            controller.clear();
          });
        }
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Color(0xFF232127),
          padding: EdgeInsets.only(top: 8),
          child: Wrap(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 28, left: 32, right: 32, bottom: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: TextFormField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    autofocus: false,
                    style: textTheme.headline6,
                    decoration: InputDecoration(
                      border: _validate ? InputBorder.none : OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade200),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintStyle: textTheme.headline6.copyWith(
                        color: _validate ? Colors.red.shade200 : Colors.grey,
                      ),
                      hintText: _validate
                          ? 'Please add a link here'
                          : 'shorten a link here',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: CustomButton(
                  label: 'Shorten it!',
                  onPressed: () {
                    setState(() {
                      controller.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });

                    if(controller.text.isEmpty) {
                      return;
                    }

                    context.read<ShortlyBloc>()
                      ..add(ShortenLink(url: controller.text));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
