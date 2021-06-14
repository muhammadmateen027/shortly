class OnBoardingModel {
  final String title;
  final String description;
  final String localImageSrc;

  OnBoardingModel(
      {this.title, this.description, this.localImageSrc});
}
final List<OnBoardingModel> splashData = [
  OnBoardingModel(
    description:
    'Boost your brand recognition with each click. generic links don\'t '
        'mean a thing. Branded links help instil confidence in your '
        'content.',
    title: 'Brand Recognition',
    localImageSrc: 'assets/diagram.svg',
  ),
  OnBoardingModel(
    description:
    'Gain insight into who is clicking your links. Knowing when and where'
        ' people engage with your content helps inform better decisions.',
    title: 'Detailed Records',
    localImageSrc: 'assets/gauge.svg',
  ),
  OnBoardingModel(
    description:
    'Improve brand awareness and content discoverability through '
        'customizable links, supercharging audience engagement.',
    title: 'Fully Customizable',
    localImageSrc: 'assets/tools.svg',
  ),
];