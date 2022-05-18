import 'dart:developer';
import 'package:antonx_task/controller/preferences_provider.dart';
import 'package:antonx_task/model/all_gig_model.dart';
import 'package:antonx_task/services/all_gig_service.dart';
import 'package:antonx_task/utilities/general_utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AllGigController extends ChangeNotifier {
  List<GigBody> allGigList = [];

  Future<List<GigBody>?> getAllGig(BuildContext context) async {
    allGigList.clear();
    print('This is access token in all GIG method ${Provider.of<PreferencesProvider>(context,listen: false).accessToken}');
    Map<String, dynamic>? response = await GigService.getAllGigFromApi(Provider.of<PreferencesProvider>(context,listen: false).accessToken);
     // log('This is response ${response}');

    if (response!['success'] == true) {
      List _map = response['body'];
      for (var gigMap in _map) {
        GigBody _gigs = GigBody();
        _gigs = GigBody.fromJson(gigMap);
        allGigList.add(_gigs);
      }
      return allGigList;
    } else {
      GeneralUtilities().showMessage(context: context, title: 'Something went wrong', text: response['error']);
    }
    return null;
  }
}
