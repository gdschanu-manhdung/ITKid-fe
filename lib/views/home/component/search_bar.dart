import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,8, 16),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(

              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading:  Icon(Icons.search, color: Colors.blueAccent.shade200,),
              trailing: <Widget>[
                Tooltip(
                  message: 'Change brightness mode',
                  child: IconButton(
                    isSelected: isDark,
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                    icon:  Icon(Icons.wb_sunny_outlined, color: Colors.blueAccent.shade200,),
                    selectedIcon:  Icon(Icons.brightness_2_outlined, color: Colors.blueAccent.shade200,),
                  ),
                )
              ],
            );
          },
          suggestionsBuilder:
          (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'gợi ý $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }
      ),
    );
  }
}