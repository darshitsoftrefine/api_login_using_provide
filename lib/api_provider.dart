import 'dart:developer';

import 'package:api_through_provide/services.dart';
import 'package:flutter/cupertino.dart';

import 'model/model.dart';

class Api_Provider  extends ChangeNotifier {
  final Services _service = Services();
  bool isLoading = false;
  ContactPerson? _contDetails;
  ContactPerson? get contDetail => _contDetails;

  Future<void> getAllDetails() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.postContactDetails();
    _contDetails = response;

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllAdrDetails() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.postContactDetails();
    _contDetails = response;

    isLoading = false;
    notifyListeners();
  }
}