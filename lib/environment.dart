import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:bnf/core/functions/extentions.dart';
import 'package:bnf/core/ioc.dart';

class Environment {
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  static const String persistSessionKey = 'PERSIST_SESSION_KEY';
  static const String isIntroCheckedKey = 'isIntroCheckedKey';
  static const String selectedGroupKey = 'selectedGroupKey';
}

testInvoke() async {
  const location = {
    'full_address': 'body.full_address',
    'geo_location': {
      'type': "Point",
      'coordinates': [40, 5]
    }
  };

  final wishItem = {
    'name': 'body.name',
    'brand': 'body.brand',
    'quantity': 'body.quantity',
    'pay_amount': 12,
    'note': 'body.note',
    'expired_at': DateTime.now().toString(),
  };
  try {
    final res = await Supabase.instance.client.functions
        .tenancyInvoke('create_wish_item', body: {
      ...location,
      ...wishItem,
    });
    locator.logger.info(res.data);
  } on FunctionException catch (e) {
    locator.logger.error("eeee -> ${e.details}");
  }
}
