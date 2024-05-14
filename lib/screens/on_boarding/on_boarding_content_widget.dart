part of 'on_boarding_screen.dart';

class OnBoardingContentWidget extends StatelessWidget {
  const OnBoardingContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final introKey = GlobalKey<IntroductionScreenState>();

    final PageDecoration pageDecoration = PageDecoration(
      titleTextStyle:
          TextStyleConstant.titleOnboarding(context) ?? const TextStyle(),
      bodyTextStyle:
          TextStyleConstant.bodyOnboarding(context) ?? const TextStyle(),
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Theme.of(context).colorScheme.background,
      imagePadding: EdgeInsets.zero,
      bodyFlex: 2,
      imageFlex: 4,
      bodyAlignment: Alignment.topCenter,
      imageAlignment: Alignment.bottomCenter,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Theme.of(context).colorScheme.background,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: false,
      pages: [
        PageViewModel(
          title: "Weather Now",
          body: "Stay Up-to-Date with Real-Time Conditions.",
          image: _buildImage('assets/images/on_boarding/page_1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Forecast Ahead",
          body: "Plan Your Days with Tomorrow's Weather.",
          image: _buildImage('assets/images/on_boarding/page_2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Find Your Weather",
          body: "Discover Weather Anywhere, Anytime.",
          image: _buildImage('assets/images/on_boarding/page_3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Weather Wise",
          body: "Smart Suggestions for Every Forecast",
          image: _buildImage('assets/images/on_boarding/page_4.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Deep Dive into Weather",
          body: "Explore Comprehensive Weather Insights",
          image: _buildImage('assets/images/on_boarding/page_5.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome to Laweather",
          body: "Stay Informed,Stay Ahead.",
          image: _buildImage('assets/images/on_boarding/page_6.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        context.read<OnBoardingBloc>().add(OnBoardingCompleteEvent());
      },
      onSkip: () {
        context.read<OnBoardingBloc>().add(OnBoardingCompleteEvent());
      },
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      back:
          Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.outline),
      skip: Text(
        'Skip',
        style: TextStyleConstant.footerOnboarding(context),
      ),
      next: Icon(Icons.arrow_forward_ios,
          color: Theme.of(context).colorScheme.outline),
      done: Text(
        'Done',
        style: TextStyleConstant.footerOnboarding(context),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: Theme.of(context).colorScheme.outline,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      assetName,
      width: width,
    );
  }
}
