import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_list_tile.dart';

final counterProvider = StateProvider<List<int>>((ref) {
  return [];
});

final counterListProvider = StateProvider<List<CounterListTile>>((ref) {
  return [];
});

