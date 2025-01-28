import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/forecast.dart' as forecast;
import 'package:weatherapp/widgets/forecast_summary_widget.dart';

class ForecastSummaries extends StatelessWidget {
  const ForecastSummaries({
    super.key,
    required List<forecast.Forecast> forecasts,
  }) : _forecasts = forecasts;

  final List<forecast.Forecast> _forecasts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var fc in _forecasts ) ...[
          _forecasts.isNotEmpty ? ForecastSummaryWidget(currentForecast: fc) : Text(""),
          SizedBox(width: 10),
        ]
      ]
    );
  }
}


  // TODO: Create a new widget called ForecastSummaries
  // This should return a row of all forecasts
  // The individual forecasts should be ForecastSummaryWidgets
  // There should be some spacing between each forecast as well
  // use Flutter documentation to help you.
  // This may clip off of the edge of the screen
  // Check forecastSummaryWidget for another TODO