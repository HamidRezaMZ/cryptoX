import 'package:cryptox/data/Models/crypto_model/AllCryptoModel.dart';
import 'package:cryptox/data/Models/crypto_model/response_model.dart';
import 'package:cryptox/domain/Network/crypto_api_wrapper.dart';
import 'package:flutter/cupertino.dart';

class CryptoApiProvider extends ChangeNotifier {
  CryptoApiWrapper cryptoApiWrapper = CryptoApiWrapper();
  late AllCryptoModel topGainerDataFuture;
  late AllCryptoModel topMarketDataFuture;
  late AllCryptoModel topLooserDataFuture;
  late AllCryptoModel allCryptoDataFuture;
  late ResponseModel state;
  var topGainerDataresponse;
  var allCryptoDataResponse;
  var topLooserDataResponse;
  var topMarketCapDataResponse;
  CryptoApiProvider() {
    getTopLooserData();
    getAllCryptoData();
    getTopMarketCapData();
    getTopGainerData();
  }



  Future getTopMarketCapData() async {
    state = ResponseModel.loading("Loading Data...");
    try {
      topMarketCapDataResponse = await cryptoApiWrapper.getTopMarketCapData();
      if (topMarketCapDataResponse.statusCode == 200) {
        topMarketDataFuture =
            AllCryptoModel.fromJson(topMarketCapDataResponse.data);
        state = ResponseModel.completed(topMarketDataFuture);
      } else {
        state = ResponseModel.error("Something Wrong....");
      }
      notifyListeners();
    } catch (error) {
      state = ResponseModel.error("Something Wrong....");
      notifyListeners();
    }
  }

  Future getTopLooserData() async {
    state = ResponseModel.loading("Loading Data...");
    try {
      topLooserDataResponse = await cryptoApiWrapper.getTopLosersData();
      if (topLooserDataResponse.statusCode == 200) {
        topLooserDataFuture =
            AllCryptoModel.fromJson(topLooserDataResponse.data);
        state = ResponseModel.completed(topLooserDataFuture);
      } else {
        state = ResponseModel.error("Something Wrong....");
      }
      notifyListeners();
    } catch (error) {
      state = ResponseModel.error("Something Wrong....");
      notifyListeners();
    }
  }

  Future getTopGainerData() async {
    state = ResponseModel.loading("Loading Data...");
    try {
      topGainerDataresponse = await cryptoApiWrapper.getTopGainerData();
      if (topGainerDataresponse.statusCode == 200) {
        topGainerDataFuture =
            AllCryptoModel.fromJson(topGainerDataresponse.data);
        state = ResponseModel.completed(topGainerDataFuture);
      } else {
        state = ResponseModel.error("Something Wrong....");
      }
      notifyListeners();
    } catch (error) {
      state = ResponseModel.error("Something Wrong....");
      notifyListeners();
    }
  }

  Future getAllCryptoData() async {
    state = ResponseModel.loading("Loading Data...");
    try {
      allCryptoDataResponse = await cryptoApiWrapper.getAllCryptoData();
      if (allCryptoDataResponse.statusCode == 200) {
        allCryptoDataFuture =
            AllCryptoModel.fromJson(allCryptoDataResponse.data);
        state = ResponseModel.completed(allCryptoDataFuture);
      } else {
        state = ResponseModel.error("Something Wrong....");
      }
      notifyListeners();
    } catch (error) {
      state = ResponseModel.error("Something Wrong....");
      notifyListeners();
    }


  }


  reBuildUiTryAgain() {
    notifyListeners();
  }
}
