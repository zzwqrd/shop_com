class NavigationState {
  final int currentIndex;

  NavigationState(this.currentIndex);

  factory NavigationState.initial() => NavigationState(0);
}
