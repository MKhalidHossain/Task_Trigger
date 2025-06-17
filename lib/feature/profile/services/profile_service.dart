import '../repositories/profile_repository_interface.dart';
import 'profile_service_interface.dart';

class ProfileService implements ProfileServiceInterface {
  final ProfileRepositoryInterface profileRepositoryInterface;

  ProfileService(this.profileRepositoryInterface);
  
  @override
  Future changeAvatar(String image) async{
    return await profileRepositoryInterface.changeAvatar(image);
  }
  
  @override
  Future deleteAvatar() async{
    return await profileRepositoryInterface.deleteAvatar();
  }
  
  @override
  Future getUserById() async{
    return await profileRepositoryInterface.getUserById();
  }

 
}

