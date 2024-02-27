import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

extension BuildContextGoRouter on BuildContext {
  void neglect(String location, {Object? extra}) =>
      Router.neglect(this, () => go(location, extra: extra));

  void neglectNamed(String name) => Router.neglect(this, () => goNamed(name));
}
