import 'package:apk/service/preferencesService.dart';
import 'package:apk/shared/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrafikData extends StatefulWidget {
  const GrafikData({Key? key}) : super(key: key);

  @override
  State<GrafikData> createState() => _GrafikDataState();
}

class _GrafikDataState extends State<GrafikData> {
  DateTime selectedDate = DateTime.now();
  int? selectedMonth;
  List<ChartModel> data = [
    ChartModel('Jan', 1),
    ChartModel('Feb', 2),
    ChartModel('Mar', 3),
    ChartModel('Apr', 4),
    ChartModel('May', 5),
  ];

  Future<List<ChartModel>> fetchData({String? date}) async {
    try {
      final dio = Dio();
      final userId = await PreferencesService().getId();
      final url = date != null
          ? 'https://sintrenayu.com/api/pangan/grafik-data/$userId?date=$date'
          : 'https://sintrenayu.com/api/pangan/grafik-data/$userId';
      final response = await dio.get(
        url,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        var data = response.data;

        print(data);

        if (data is Map<String, dynamic> && data.containsKey('data')) {
          List<dynamic> dataList = data['data'];

          return dataList.map((item) => ChartModel.fromJson(item)).toList();
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Grafik Data',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: FutureBuilder<List<ChartModel>>(
          future: fetchData(date: selectedDate.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No Data Found'));
            } else {
              List<ChartModel> data = snapshot.data!;
              return Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Analisis',
                      style: semiblackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDropdownButtonMonth(),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildChartContainer(data),
                    const SizedBox(height: 10),
                    _buildLabels(data),
                  ],
                ),
              );
            }
          }),
    );
  }

  Widget _buildDropdownButtonMonth() {
    return Expanded(
      child: TextFormField(
        readOnly: true,
        initialValue: DateFormat('dd/MM/yyyy').format(selectedDate),
        decoration: InputDecoration(
          labelText: 'Pilih Tanggal...',
          hintText: DateFormat('dd/MM/yyyy').format(selectedDate),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: _pickDate,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildChartContainer(List<ChartModel>? dataChart) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: MyColor.getCardBgColor(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: MyUtils.getShadow(),
      ),
      child: SfCartesianChart(
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          enablePanning: true,
          enableDoubleTapZooming: true,
          enableSelectionZooming: true,
          enableMouseWheelZooming: true,
          zoomMode: ZoomMode.xy,
        ),
        primaryXAxis: const CategoryAxis(),
        enableAxisAnimation: true,
        borderWidth: 0,
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          ColumnSeries<ChartModel, String>(
            width: 1,
            dataSource: dataChart,
            xValueMapper: (ChartModel data, _) => data.xAxis,
            yValueMapper: (ChartModel data, _) => data.yAxis,
            name: "Harga Pangan",
            color: MyColor.primaryColor,
            enableTooltip: true,
            markerSettings: const MarkerSettings(
              isVisible: true,
            ),
             spacing: 0.3,
          ),
        ],
      ),
    );
  }

  Widget _buildLabels(List<ChartModel> data) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white, // Background putih
        borderRadius: BorderRadius.circular(8), // Sudut membulat
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Bayangan kotak
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.map((data) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5), // Jarak antar label
            child: Text(
              '${data.xAxis}: ${data.yAxis}',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500, // Mengatur gaya font
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ChartModel {
  ChartModel(this.xAxis, this.yAxis);

  final String xAxis;
  final int yAxis;

  factory ChartModel.fromJson(Map<String, dynamic> json) {
    return ChartModel(
      json['x'] as String,
      int.parse(json['y']),
    );
  }
}

class MyColor {
  static Color getCardBgColor() => Colors.white;
  static Color primaryColor = Colors.blue;
}

class MyUtils {
  static List<BoxShadow> getShadow() {
    return [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ];
  }
}
