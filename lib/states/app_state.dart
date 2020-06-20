import 'comic_state.dart';

class AppState {
  final ComicState comicState;

  AppState({
    this.comicState,
  });

  AppState copy({ComicState comicState}) {
    return AppState(
      comicState: comicState ?? this.comicState,
    );
  }

  factory AppState.initial() => AppState(
        comicState: ComicState.initial(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          comicState == other.comicState;

  @override
  int get hashCode => comicState.hashCode;
}
