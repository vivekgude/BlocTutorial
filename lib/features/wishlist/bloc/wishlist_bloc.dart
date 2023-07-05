import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctutorial/features/cart/bloc/cart_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_items.dart';
import '../../home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemovefromWishlistEvent>(wishlistRemovefromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WhishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemovefromWishlistEvent(
      WishlistRemovefromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistRemovefromWishlistState());
    emit(WhishlistSuccessState(wishlistItems: wishlistItems));
  }
}
