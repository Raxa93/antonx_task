import 'dart:developer';
import 'package:antonx_task/controller/preferences_provider.dart';
import 'package:antonx_task/model/all_post_model.dart';
import 'package:antonx_task/services/all_post_service.dart';
import 'package:antonx_task/utilities/general_utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AllPostController extends ChangeNotifier {
  List<AllPostBody> allPostList = [];

  Future<List<AllPostBody>?> getAllPost(BuildContext context) async {
    allPostList.clear();
    print(
        'This is access token in all post method ${Provider.of<PreferencesProvider>(context, listen: false).accessToken}');
    Map<String, dynamic>? response =
        await PostService.getAllPostFromApi(Provider.of<PreferencesProvider>(context, listen: false).accessToken);
    log('This is success message ${response!['success']}');

    if (response['success'] == true) {
      List _map = response['body'];
      for (var postMap in _map) {
        AllPostBody _post = AllPostBody();
        _post = AllPostBody.fromJson(postMap);
        allPostList.add(_post);
      }
      return allPostList;
    } else {
      GeneralUtilities().showMessage(context: context, title: 'Something went wrong', text: response['error']);
    }
    return null;
  }
}
