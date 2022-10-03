import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut_4/provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final favouriteItemProvider = Provider.of<FavouriteItemProvider>(context);
    print("build widget tree");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        actions: [
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
            child: Consumer<FavouriteItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.selectedItem.length,
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
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
