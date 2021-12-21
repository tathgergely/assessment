import 'package:github_client/domain/entities/github_user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_user_detailed_data.g.dart';

@JsonSerializable()
class GithubUserDetailedData extends GithubUserData {
  GithubUserDetailedData({required String loginName, required this.avatar})
      : super(loginName);
  @JsonKey(name: 'avatar_url')
  String avatar;

  factory GithubUserDetailedData.fromJson(Map<String, dynamic> json) =>
      _$GithubUserDetailedDataFromJson(json);
  Map<String, dynamic> toJson() => _$GithubUserDetailedDataToJson(this);
}
