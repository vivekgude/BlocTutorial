part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WhishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WhishlistSuccessState({required this.wishlistItems});
}

class WishlistRemovefromWishlistState extends WishlistActionState {}
