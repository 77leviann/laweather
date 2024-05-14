part of 'forecast_home_content_widget.dart';

class ForecastHomeButtonWidget extends StatelessWidget {
  const ForecastHomeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastWidgetBloc, ForecastWidgetState>(
      builder: (context, state) {
        return ToggleSwitch(
          minWidth: 60.0,
          minHeight: 36.0,
          borderColor: [Theme.of(context).colorScheme.primary],
          cornerRadius: 16.0,
          fontSize: Theme.of(context).textTheme.labelLarge?.fontSize ?? 14,
          centerText: true,
          initialLabelIndex: state is Forecast24HoursState ? 0 : 1,
          activeFgColor: Theme.of(context).colorScheme.onPrimary,
          inactiveBgColor: Theme.of(context).colorScheme.outlineVariant,
          inactiveFgColor: Theme.of(context).colorScheme.outline,
          activeBgColor: [
            Theme.of(context).colorScheme.primary,
          ],
          totalSwitches: 2,
          labels: const ['24 H', '7 D'],
          activeBgColors: [
            [Theme.of(context).colorScheme.primary],
            [Theme.of(context).colorScheme.primary],
          ],
          onToggle: (index) {
            BlocProvider.of<ForecastWidgetBloc>(context).add(
              index == 0 ? Forecast24HoursEvent() : Forecast7DaysEvent(),
            );
          },
        );
      },
    );
  }
}
