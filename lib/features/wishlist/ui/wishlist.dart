import 'package:bloctutorial/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloctutorial/features/wishlist/ui/wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: ((previous, current) => current is WishlistActionState),
      buildWhen: ((previous, current) => current is! WishlistActionState),
      listener: (context, state) {
        if (state is WishlistRemovefromWishlistState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item Removed")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WhishlistSuccessState:
            final successState = state as WhishlistSuccessState;
            return Scaffold(
              appBar: AppBar(title: Text("Wishlisted Items")),
              body: ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: ((context, index) {
                    return WishlistTile(
                        productDataModel: successState.wishlistItems[index],
                        wishlistBloc: wishlistBloc);
                  })),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
