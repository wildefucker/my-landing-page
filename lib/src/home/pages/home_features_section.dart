part of '../home.dart';

class HomeFeatures extends StatelessWidget {
  const HomeFeatures({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.cards,
  });
  final String id, title, subtitle;
  final List<CardModel> cards;

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Display label
          HomeFeatures.introduction(id: id, title: title, subtitle: subtitle),

          // Display card
          Container(
            padding: const EdgeInsets.all(Constants.spacing).copyWith(top: 0.0),
            alignment: Alignment.center,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: Constants.spacing,
              runSpacing: Constants.spacing,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: cards.to((index, item) => Animate(
                    autoPlay: false,
                    onInit: Env.controller.animate(id),
                    effects: [
                      SlideEffect(
                        begin: const Offset(0.0, -0.25),
                        end: Offset.zero,
                        delay: Constants.duration * (index + 1),
                        duration: const Duration(milliseconds: 750),
                      ),
                      FadeEffect(
                        delay: Constants.duration * (index + 1),
                        duration: const Duration(milliseconds: 750),
                      ),
                    ],
                    child: HomeFeatures.card(item: item),
                  )),
            ),
          ),
        ],
      );
    } else {
      return Container(
        alignment: Alignment.center,
        width: context.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.color.primary,
              context.color.primary.withOpacity(0.0),
            ],
          ),
        ),
        height: context.height - kToolbarHeight,
        constraints:
            BoxConstraints(minHeight: context.width < 560.0 ? 650.0 : 455.0),
        padding: const EdgeInsets.all(Constants.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display label
            HomeFeatures.introduction(id: id, title: title, subtitle: subtitle),

            // Display swiper
            Expanded(
              child: Animate(
                autoPlay: false,
                onInit: Env.controller.animate(id),
                effects: const [
                  ScaleEffect(
                    begin: Offset(0.75, 0.75),
                    end: Offset(1.0, 1.0),
                    delay: Constants.duration,
                    duration: Duration(milliseconds: 750),
                  ),
                  FadeEffect(
                    delay: Constants.duration,
                    duration: Duration(milliseconds: 750),
                  ),
                ],
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) =>
                      SingleChildScrollView(
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                        children: [HomeFeatures.card(item: cards[index])]),
                  ),
                  itemCount: cards.length,
                  autoplay: true,
                  scrollDirection:
                      context.width >= 560.0 ? Axis.horizontal : Axis.vertical,
                  autoplayDelay: 10 * 1000,
                  layout: SwiperLayout.STACK,
                  itemWidth: 300.0,
                  itemHeight: context.height.max(250.0),
                  control: SwiperControl(
                    iconNext: Icons.navigate_next_rounded,
                    iconPrevious: Icons.navigate_before_rounded,
                    color: context.color.surface,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  static Widget introduction({
    required String id,
    required String title,
    required String subtitle,
  }) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.spacing,
            vertical: Constants.spacing * 2.0,
          ),
          child: Animate(
            autoPlay: false,
            onInit: Env.controller.animate(id),
            effects: const [
              SlideEffect(
                begin: Offset(0.0, -0.25),
                end: Offset.zero,
                duration: Duration(milliseconds: 750),
              ),
              FadeEffect(
                duration: Duration(milliseconds: 750),
              ),
            ],
            child: MergeSemantics(
              child: Column(
                children: [
                  // Display title
                  Seo.text(
                    text: title,
                    style: TextTagStyle.h2,
                    child: Text(
                      title,
                      semanticsLabel: title,
                      textAlign: TextAlign.center,
                      style: context.text.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                  ),

                  // Ddisplay subtitle
                  Seo.text(
                    text: subtitle,
                    style: TextTagStyle.p,
                    child: Text(
                      '\n$subtitle',
                      semanticsLabel: subtitle,
                      style: context.text.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget card({required CardModel item}) {
    return Builder(
      builder: (context) {
        return Container(
          width: 300.0,
          height: 250.0,
          padding: const EdgeInsets.all(Constants.spacing),
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(Constants.spacing * 0.5),
            boxShadow: [
              BoxShadow(
                color: context.color.onSurface.withOpacity(0.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: MergeSemantics(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display item image
                Semantics(
                  image: true,
                  label: '${item.title} Icon',
                  child: Seo.image(
                    alt: '${item.title} Icon',
                    src: 'assets/${item.source}',
                    child: DImage(
                      source: item.source,
                      size: const Size.square(Constants.spacing * 1.5),
                      color: context.color.primary,
                    ),
                  ),
                ),

                // Add spacing between image and title
                Padding(
                  padding: const EdgeInsets.only(
                    top: Constants.spacing * 0.5,
                    bottom: Constants.spacing,
                  ),
                  child: Seo.text(
                    text: item.title,
                    style: TextTagStyle.h4,
                    child: Text(
                      item.title,
                      semanticsLabel: item.title,
                      style: context.text.bodyMedium?.copyWith(
                        color: context.color.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Display item subtitle
                Seo.text(
                  text: item.subtitle,
                  style: TextTagStyle.p,
                  child: Text(
                    item.subtitle,
                    semanticsLabel: item.subtitle,
                    textAlign: TextAlign.justify,
                    style: context.text.bodySmall
                        ?.copyWith(color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
