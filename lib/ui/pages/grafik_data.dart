import 'package:apk/service/preferencesService.dart';
import 'package:apk/shared/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrafikData extends StatefulWidget {
  const GrafikData({Key? key}) : super(key: key);

  @override
  State<GrafikData> createState() => _GrafikDataState();
}

class _GrafikDataState extends State<GrafikData> {
  int? selectedMonth;
  List<ChartModel> data = [
    ChartModel('Jan', 1),
    ChartModel('Feb', 2),
    ChartModel('Mar', 3),
    ChartModel('Apr', 4),
    ChartModel('May', 5),
  ];


  Future<List<ChartModel>> fetchData() async {
    try {
      final dio = Dio();
      final userId = await PreferencesService().getId();
      final response = await dio.get(
        'https://sintrenayu.com/api/pangan/grafik-data/$userId',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      // Cek status code dari response
       if (response.statusCode == 200) {
        var data = response.data;

        print(data);

        // Cek format data apakah sesuai
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          List<dynamic> dataList = data['data'];

          // Parse setiap item dalam dataList menjadi ChartModel
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
        future: fetchData(),
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
              margin: const EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
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
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropdownButtonMonth(),
                  const SizedBox(width: 10,),
                      _buildDropdownButtonYear(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildChartContainer(data),
                ],
              ),
            );
          }
        }
      ),
    );
  }

  Widget _buildDropdownButtonMonth() {
    return Expanded(
      child: DropdownSearch<int>(
                        dropdownBuilder: (context, selectedItem) =>
                            selectedItem != null
                                ? Text(
                                    DateFormatter.monthFromNumber(
                                        selectedItem,
                                        locale: 'id'),
                                  )
                                : Text(
                                    "Pilih bulan...",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                        clearButtonProps: const ClearButtonProps(
                          isVisible: true,
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.centerRight,
                          icon: Icon(
                            Icons.clear,
                            size: 18,
                          ),
                        ),
                        popupProps: PopupProps.menu(
                          showSelectedItems: false,
                          itemBuilder: (context, item, isSelected) =>
                              ListTile(
                            title: Text(
                              DateFormatter.monthFromNumber(item,
                                  locale: 'id'),
                            ),
                          ),
                        ),
                        items: const [
                          1,
                          2,
                          3,
                          4,
                          5,
                          6,
                          7,
                          8,
                          9,
                          10,
                          11,
                          12,
                        ],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            hintText: "Pilih Bulan",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        // selectedItem: controller.month.value,
                        onChanged: (value) {
                          // controller.month.value = value ?? 0;
      
                          // controller.getReportData(
                          //     controller.year.value,
                          //     controller.month.value == 0
                          //         ? null
                          //         : controller.month.value);
                        },
        ),
    );
  }
  Widget _buildDropdownButtonYear() {
    return Expanded(
      child: DropdownSearch<int>(
                        dropdownBuilder: (context, selectedItem) =>
                            selectedItem != null
                                ? Text(

                                        selectedItem.toString(),
                                  )
                                : const Text(
                                    "Pilih tahun...",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                        clearButtonProps: const ClearButtonProps(
                          isVisible: true,
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.centerRight,
                          icon: Icon(
                            Icons.clear,
                            size: 18,
                          ),
                        ),
                        popupProps: PopupProps.menu(
                          showSelectedItems: false,
                          itemBuilder: (context, item, isSelected) =>
                              ListTile(
                            title: Text(
                              item.toString()
                            ),
                          ),
                        ),
                        items: const [
                          2020,
                          2021,
                          2022,
                          2023,
                          2024,
                        ],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            hintText: "Pilih Tahun",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        // selectedItem: controller.month.value,
                        onChanged: (value) {
                          // controller.month.value = value ?? 0;
      
                          // controller.getReportData(
                          //     controller.year.value,
                          //     controller.month.value == 0
                          //         ? null
                          //         : controller.month.value);
                        },
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
        // primaryYAxis: const NumericAxis(
        //   maximum: 5,
        //   interval: 1,
        // ),
        enableAxisAnimation: true,
        borderWidth: 0,
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          SplineSeries<ChartModel, String>(
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
          ),
        ],
      ),
    );
  }
}

class DateFormatter {
  static String monthFromNumber(int month, {String locale = 'en'}) {
    const monthNames = {
      'id': [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
      ],
      'en': [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ],
    };

    return monthNames[locale]?[month - 1] ?? '';
  }
}

class ChartModel {
  ChartModel(this.xAxis, this.yAxis);

  final String xAxis;
  final int yAxis;

   factory ChartModel.fromJson(Map<String, dynamic> json) {
    return ChartModel(
      json['x'] as String,
      int.parse(json['y']), // Konversi ke double
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
