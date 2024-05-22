import 'package:careflix/layers/data/data_provider/auth_provider.dart';
import 'package:careflix/layers/data/model/user_model.dart';
import 'package:careflix/layers/data/repository/auth_repository.dart';
import 'package:careflix/layers/data/repository/profile_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../injection_container.dart';
import '../../../layers/logic/show_lists/show_lists_cubit.dart';

class AppState extends ChangeNotifier {
  final _profileRpo = sl<ProfileRepository>();

  UserModel? userModel;

  Future init() async {
    await getUserProfile();
  }

  Future getUserProfile() async {
    userModel = await _profileRpo.getUserProfile();
  }

  addShowToUserList(String id) {
    userModel!.userListIds.add(id);
    notifyListeners();
    sl<ShowListsCubit>().changeUserLists(userModel!.userListIds);
    _profileRpo.changeUserList(userModel!.userListIds);
  }

  removeShowFromList(String id) {
    userModel!.userListIds!.remove(id);
    notifyListeners();
    sl<ShowListsCubit>().changeUserLists(userModel!.userListIds);
    _profileRpo.changeUserList(userModel!.userListIds);
  }
}
