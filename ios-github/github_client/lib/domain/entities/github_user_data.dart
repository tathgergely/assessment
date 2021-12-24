import 'package:json_annotation/json_annotation.dart';

part 'github_user_data.g.dart';

@JsonSerializable()
class GithubUserData {
  GithubUserData(this.loginName);

  @JsonKey(name: 'login')
  String loginName;

  factory GithubUserData.fromJson(Map<String, dynamic> json) =>
      _$GithubUserDataFromJson(json);
  Map<String, dynamic> toJson() => _$GithubUserDataToJson(this);
}
