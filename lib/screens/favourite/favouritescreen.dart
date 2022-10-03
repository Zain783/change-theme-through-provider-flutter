import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut_4/provider/favourite_provider.dart';
import 'package:provider_tut_4/provider/theme_changer.dart';
import 'package:provider_tut_4/screens/favourite/myfavouritescreen.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> Selected_item = [];

  @override
  Widget build(BuildContext context) {
    // final favouriteItemProvider = Provider.of<FavouriteItemProvider>(context);
    print("build widget tree");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        actions: [
          Consumer<ThemeChangerProvider>(
            builder: (context, value, child) => Switch(
                value: value.ischangetheme,
                onChanged: (valueKey) {
                  if (valueKey == true) {
                    value.setTheme(ThemeMode.dark);
                    value.setthemebutton(valueKey);
                  } else {
                    value.setTheme(ThemeMode.light);
                    value.setthemebutton(valueKey);
                  }
                }),
          ),
          IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFavouriteScreen(),
                ));
          }, icon: Consumer<FavouriteItemProvider>(
            builder: (context, value, child) {
              return Badge(
                  badgeContent: Text(value.selectedItem.length.toString()),
                  child: const Icon(Icons.favorite));
            },
          ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text("Item" + index.toString()),
                        trailing: value.selectedItem.contains(index) == true
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
