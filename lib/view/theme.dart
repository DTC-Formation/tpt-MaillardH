import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsitsio/model/theme.dart';

class ColorTheme extends StatelessWidget {
  ColorTheme({super.key});
  List<MaterialColor> ListColor = Colors.primaries;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: ListColor.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(8),
          child: FloatingActionButton(
              backgroundColor: ListColor[index],
              onPressed: () {
                context.read<ColorProvider>().changeColor(ListColor[index]);
                Navigator.pop(context);
              }),
        );
      },
    );
  }
}
