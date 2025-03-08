import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFrozen = StateProvider<bool>((ref) => true);

final eye = StateProvider<bool>((ref) => false);

final visibility = StateProvider<bool>((ref) => true);
