import 'package:dio/dio.dart';
import 'package:get_charge/core/api/api.dart';
import 'package:get_charge/data/models/User/profile_model.dart';

abstract class RemoteProfileDataSources{
  Future<ProfileModel> getProfile();
  Future<void> deleteProfile();
  Future<void> changeProfile(String email);
}

class RemoteProfileDataSourcesImpl implements RemoteProfileDataSources{
  final Api api = Api();
  
  @override
  Future<void> changeProfile(String email) async {
    await api.post(query: 'profile/ChangeEmail', data: {'email': email});
  }

  @override
  Future<void> deleteProfile() async {
    await api.get(query: 'profile/DeleteProfile');
  }

  @override
  Future<ProfileModel> getProfile() async {
    Response response = await api.get(query: 'profile/GetProfile');
    return ProfileModel.fromJson(response.data);
  }

}