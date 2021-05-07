import 'package:rxdart/rxdart.dart';

class NavigationChange {
  final int _index;
  int get currentIndex => _index;
  final BehaviorSubject<int> navSubscription;
  NavigationChange(this._index) : this.navSubscription = BehaviorSubject<int>.seeded(_index);
  Future<void> changeNav(int i) async {
    navSubscription.add(i);
  }
}