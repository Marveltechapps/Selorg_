abstract class AppState {}

class ScreenLoaded extends AppState {
  final int screenIndex;

  ScreenLoaded(this.screenIndex);
}
