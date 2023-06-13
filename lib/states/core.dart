import 'package:hooks_riverpod/hooks_riverpod.dart';

class BooleanNotifier extends StateNotifier<bool> {
  BooleanNotifier(this.initialState) : super(initialState);

  final bool initialState;

  void set() {
    state = true;
  }

  void reset() {
    state = false;
  }

  void toggle() {
    state = state ? false : true;
  }

  void update(bool st) {
    state = st;
  }
}

StateNotifierProvider<BooleanNotifier, bool> getBoolStateNotifier(
    {bool initialValue = false}) {
  return StateNotifierProvider<BooleanNotifier, bool>(
      (ref) => BooleanNotifier(initialValue));
}

class ListNotifier<T> extends StateNotifier<List<T>> {
  ListNotifier({this.initialState}) : super(initialState ?? []);

  final List<T>? initialState;
  void add(T item) {
    state = [...state, item];
  }

  void addAll(List<T> items) {
    state = [...state, ...items];
  }

  void removeAt(int index) {
    var temp = state;
    temp.removeAt(index);
    state = [...temp];
  }

  void flush() {
    state = [];
  }
}

StateNotifierProvider<ListNotifier<T>, List<T>> getListStateNotifier<T>(
    {List<T>? initialState}) {
  return StateNotifierProvider<ListNotifier<T>, List<T>>(
      (ref) => ListNotifier<T>(initialState: initialState));
}

class MapNotifier<K, V> extends StateNotifier<Map<K, V>> {
  MapNotifier({this.initialState}) : super(initialState ?? {});

  final Map<K, V>? initialState;

  add(K key, V value) {
    state = {...state, key: value};
  }

  remove(K key) {
    final temp = state;
    temp.remove(key);
    state = {...temp};
  }

  flush() {
    state = {};
  }
}

StateNotifierProvider<MapNotifier<K, V>, Map<K, V>> getMapStateNotifier<K, V>(
    {Map<K, V>? initialState}) {
  return StateNotifierProvider<MapNotifier<K, V>, Map<K, V>>(
      (ref) => MapNotifier<K, V>(initialState: initialState));
}
