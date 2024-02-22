import 'package:supabase_flutter/supabase_flutter.dart';

class StorageServie {
  static const avatarsBucketId = 'avatars';
}

class BasicException {
  static const imageWithNoData =
      StorageException('File has no data!', statusCode: '4001');
}
