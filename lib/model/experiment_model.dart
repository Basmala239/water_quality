class ExperimentModel{
  String name;
  int temp;
  int duration;
  String equipment;
  String instructions;
  ExperimentModel(this.name,this.duration,this.equipment,this.temp,this.instructions);
  static List<ExperimentModel>experimentList=[];
}
class RecentExperiment{
  String name;
  String by;
  String time;
  String date;
  RecentExperiment( this.name, this.by, this.time, this.date );
  static List<RecentExperiment>recentExperimentList=[];
}
class ExperimentReoprt{
  String name;
  int duration;
  int inf;
  int eff;
  ExperimentReoprt( this.name,this.duration, this.inf, this.eff );
}