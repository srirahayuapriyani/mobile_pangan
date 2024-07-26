class ChartModel {
  final String xAxis;
  final double yAxis;

  ChartModel({required this.xAxis, required this.yAxis});
}

final List<ChartModel> data = [
    ChartModel(xAxis: 'Jan', yAxis: 1.5),
    ChartModel(xAxis: 'Feb', yAxis: 4.0),
    ChartModel(xAxis: 'Mar', yAxis: 2.5),
    ChartModel(xAxis: 'Apr', yAxis: 4.8),
    ChartModel(xAxis: 'May', yAxis: 4.2),
    ChartModel(xAxis: 'Jun', yAxis: 3.9),
    ChartModel(xAxis: 'Jul', yAxis: 4.6),
    ChartModel(xAxis: 'Aug', yAxis: 4.1),
    ChartModel(xAxis: 'Sep', yAxis: 3.8),
    ChartModel(xAxis: 'Oct', yAxis: 2.7),
    ChartModel(xAxis: 'Nov', yAxis: 4.3),
    ChartModel(xAxis: 'Dec', yAxis: 3.0),
];