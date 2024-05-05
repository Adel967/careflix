import 'package:careflix/layers/data/data_provider/profile_provider.dart';
import 'package:dartz/dartz.dart';

import '../../../core/enum.dart';
import '../../../core/exception/app_exceptions.dart';

class ProfileRepository {
  ProfileProvider _profileProvider;

  ProfileRepository(this._profileProvider);

  Future<void> createUserProfile(
      String fName, lName, birthDate, Gender gender) async {
    await _profileProvider.createUserProfile(fName, lName, birthDate, gender);
  }
}
