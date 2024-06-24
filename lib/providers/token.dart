import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<String> {
  FavoriteNotifier() : super("");

  void addToken(String token) {
    state = token;
  }
}

final tokenProvider =
StateNotifierProvider<FavoriteNotifier, String>((ref) {
  return FavoriteNotifier();
});
