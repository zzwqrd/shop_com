abstract class NavigationEvent {}

class NavigateToPage extends NavigationEvent {
  final int index;
  NavigateToPage(this.index);
}
