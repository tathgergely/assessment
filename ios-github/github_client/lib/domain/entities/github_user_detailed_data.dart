import 'package:github_client/domain/entities/github_user_data.dart';

class GithubUserDetailedData extends GithubUserData {
  const GithubUserDetailedData(
      {required String loginName, required this.avatar})
      : super(loginName);
  final String avatar;
}
