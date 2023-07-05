import 'package:bloctutorial/features/cart/bloc/cart_bloc.dart';
import 'package:bloctutorial/features/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: ((previous, current) => current is CartActionState),
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is CartRemovedFromCartState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Removed')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartSuccessState:
            final successState = state as CartSuccessState;
            return Scaffold(
              appBar: AppBar(title: const Text('Cart Items')),
              body: ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                        productDataModel: successState.cartItems[index],
                        cartBloc: cartBloc);
                  }),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
