part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemovefromWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemovefromWishlistEvent({required this.productDataModel});
}
