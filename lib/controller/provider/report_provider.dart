import 'package:water_quality/model/experiment_model.dart';
import 'package:water_quality/model/repost_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReportProvider extends ChangeNotifier{
  void addExperimentToReport(ExperimentReoprt er){
    ReportModel.reportModelList.add(er);
    notifyListeners();

  }
  int lengthofExperimentReoprt(){
    return ReportModel.reportModelList.length;
  }
}