import 'comic_state.dart';

class AppState {
  final ComicState comicState;
  final bool isLoading;

  AppState({
    this.comicState,
    this.isLoading,
  });

  AppState copy({ComicState comicState, bool isLoading}) {
    return AppState(
      comicState: comicState ?? this.comicState,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory AppState.initial() => AppState(
        comicState: ComicState.initial(),
        isLoading: false,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          comicState == other.comicState &&
          isLoading == other.isLoading;

  @override
  int get hashCode => comicState.hashCode;
}
