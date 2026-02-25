import 'package:flutter/material.dart';
import '../authentication/register_page.dart';
import 'menu_page.dart';
import 'wedding_detail.dart';
import '../Hazulifar_theme.dart';
import '../auth_service.dart';

class WeddingItem {
  final String type;
  final int minGuests;
  final int maxGuests;
  final double ratePerMenu;
  final String imageUrl;
  final List<Widget> details;

  WeddingItem({
    required this.type,
    required this.minGuests,
    required this.maxGuests,
    required this.ratePerMenu,
    required this.imageUrl,
    required this.details,
  });
}

class WeddingPage extends StatelessWidget {
  WeddingPage({Key? key}) : super(key: key);

  final AuthService authService = AuthService();

  void _redirectToRegistration(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  final List<WeddingItem> menuItems = [
    WeddingItem(
      type: 'Chinese Opulence',
      minGuests: 300,
      maxGuests: 500,
      ratePerMenu: 498.00,
      imageUrl:
          'https://www.fourseasons.com/alt/img-opt/~80.1860.0,0000-252,0600-3000,0000-1687,5000/publish/content/dam/fourseasons/images/web/GUA/GUA_251_original.jpg',
      details: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'When you choose our Chinese Opulence package, we take care of everything for you. From smaller details such as wedding favours and VIP parking to big items such as your five-tier wedding cake, a seven-course plated Chinese menu and accommodations for you and your love in a luxurious Executive Park-View Suite, this package has it all.',
            style: HazulifarTheme.lightTextTheme.displaySmall,
          ),
        ),
        ExpansionTile(
          title: Text('Special Feature'),
          children: <Widget>[
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                    'One Complimentary bottle of house-pour wine per confirmed table'),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Wine and Dine'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• A choice of seven-course individual plated Chinese menu or five-course Western menu'),
            ),
            ListTile(
              title:
                  Text('• Selection of two canapés during cocktail reception'),
            ),
            ListTile(
              title: Text(
                  '• Free flow of soft drinks, two types of chilled juices and mocktail throughout dinner reception'),
            ),
            ListTile(
              title: Text(
                  '• Complimentary bottle of house-pour wine per confirmed table'),
            ),
            ListTile(
              title:
                  Text('• Food tasting for up to 10 people on selected menu'),
            ),
            ListTile(
              title: Text(
                  '(Applicable from Monday to Friday, except on eve of public holidays and on public holidays)'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Enrichment'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• Floral decorations inclusive of fresh flower centrepiece and tealight candles for all tables'),
            ),
            ListTile(
              title: Text('• Wedding favour for all guests'),
            ),
            ListTile(
              title: Text('• Five-tier wedding cake'),
            ),
            ListTile(
              title: Text('• Reserved table for 10 people'),
            ),
            ListTile(
              title: Text(
                  '• Usage of LCD projector, four wireless microphones, rostrum and existing sound system & lighting'),
            ),
            ListTile(
              title: Text('• VIP parking for bridal car in hotel driveway'),
            ),
            ListTile(
              title: Text('• Valet parking up to two cars'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Rest and Relax'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• Two one-night stays in a City-View Room with buffet breakfast at Curate'),
            ),
            ListTile(
              title: Text(
                  '• One-night anniversary stay in a Premier Park-View Room with buffet breakfast and dinner at Curate'),
            ),
            ListTile(
              title:
                  Text('• Special accommodation rate for friends and family'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Food Package'),
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menuPage(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                      'Click Here To Know Food Package That Right For You'),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Terms & Conditions'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Items not stated in the wedding package are subject to additional charges.'),
            ),
          ],
        ),
      ],
    ),
    WeddingItem(
      type: 'Indian Opulence',
      minGuests: 300,
      maxGuests: 500,
      ratePerMenu: 498.00,
      imageUrl:
          'https://www.fourseasons.com/alt/img-opt/~80.1860.0,0000-103,6522-1600,0000-900,0000/publish/content/dam/fourseasons/images/web/MUM/MUM_197_original.jpg',
      details: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Host an Indian wedding feast when you choose this package, which comes with a set menu of Indian specialties curated by our Executive Chef as well as free-flowing beverages and a complimentary bottle of wine per table. But it\'s not just the food, you can rest easy knowing the flowers, decorations, wedding cake and wedding night accommodations are all taken care of.',
            style: HazulifarTheme.lightTextTheme.displaySmall,
          ),
        ),
        ExpansionTile(
          title: Text('Special Feature'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'One Complimentary bottle of house-pour wine per confirmed table'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Wedding Night Treats'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Bottle of champagne, fresh fruits and chocolate pralines waiting in your Four Seasons Park-View Suite'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Luxury Dining'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• A choice of Indian set or buffet menu prepared by our executive chef'),
            ),
            ListTile(
              title:
                  Text('• Selection of two canapés during cocktail reception'),
            ),
            ListTile(
              title: Text(
                  '• Free flow of soft drinks, two types of chilled juices and mocktail throughout dinner reception'),
            ),
            ListTile(
              title: Text(
                  '• Complimentary bottle of house-pour wine per confirmed table'),
            ),
            ListTile(
              title:
                  Text('• Food tasting for up to 10 people on selected menu'),
            ),
            ListTile(
              title: Text(
                  '(Applicable from Monday to Friday, except on eve of public holidays and on public holidays)'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Enrichment'),
          children: <Widget>[
            ListTile(
              title: Text('• Stage backdrop with wording of your choice'),
            ),
            ListTile(
              title: Text(
                  '• Floral decorations inclusive of fresh flower centrepiece and tealight candles for all tables'),
            ),
            ListTile(
              title: Text('• Wedding favour for all guests'),
            ),
            ListTile(
              title: Text('• Five-tier wedding cake'),
            ),
            ListTile(
              title: Text('• Reserved table for 10 people'),
            ),
            ListTile(
              title: Text(
                  '• Usage of LCD projector, four wireless microphones, rostrum and existing sound system & lighting'),
            ),
            ListTile(
              title: Text('• VIP parking for bridal car in hotel driveway'),
            ),
            ListTile(
              title: Text('• Valet parking up to two cars'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Rest and Relax'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• One-night stay in a Four Seasons Park-View Suite with a bottle of champagne, fresh fruits, chocolate pralines and exclusive usage of Executive Club Lounge'),
            ),
            ListTile(
              title: Text(
                  '• Two one-night stays at City View Room with buffet breakfast at Curate'),
            ),
            ListTile(
              title: Text(
                  '• One-night anniversary stay in Premier Park-View Room with buffet breakfast and dinner at Curate'),
            ),
            ListTile(
              title:
                  Text('• Special accommodation rate for friends and family'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Food Package'),
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menuPage(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                      'Click Here To Know Food Package That Right For You'),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Terms & Conditions'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Items not stated in the wedding package are subject to additional charges.'),
            ),
          ],
        ),
      ],
    ),
    WeddingItem(
      type: 'Malay Opulence',
      minGuests: 300,
      maxGuests: 500,
      ratePerMenu: 468.00,
      imageUrl:
          'https://www.fourseasons.com/alt/img-opt/~80.1860.0,0000-32,9384-3000,0000-1687,5000/publish/content/dam/fourseasons/images/web/KUA/KUA_314_original.jpg',
      details: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Treat your guests to traditional dishes such as nasi lemak and sang har noodles with a set Malay menu designed by our executive chef to highlight Kuala Lumpur\'s flavourful local cuisine. And don\'t forget to enjoy the food yourself. With our Malay Opulence package, we\'ve got everything else covered for you, allowing you to sit back, relax and bask in the beauty of your love.',
            style: HazulifarTheme.lightTextTheme.displaySmall,
          ),
        ),
        ExpansionTile(
          title: Text('Special Feature'),
          children: <Widget>[
            ListTile(
              title: Text('Selection of Two Canapes during cocktail reception'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Wedding Night Delight'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'One-night stay in an Executive Park-View Suite, complete with sparkling juice, fresh fruits and chocolate pralines'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Luxury Dining'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• A choice of Malay set or buffet menu prepared by our executive chef'),
            ),
            ListTile(
              title:
                  Text('• Selection of two canapés during cocktail reception'),
            ),
            ListTile(
              title: Text(
                  '• Free flow of soft drinks, two types of chilled juices and mocktail throughout dinner reception'),
            ),
            ListTile(
              title:
                  Text('• Food tasting for up to 10 people on selected menu'),
            ),
            ListTile(
              title: Text(
                  '(Applicable from Monday to Friday, except on eve of public holidays and on public holidays)'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Enrichment'),
          children: <Widget>[
            ListTile(
              title: Text('• Stage backdrop with wording of your choice'),
            ),
            ListTile(
              title: Text(
                  '• Floral decorations inclusive of fresh flower centrepiece and tealight candles for all tables'),
            ),
            ListTile(
              title: Text('• Wedding favour for all guests'),
            ),
            ListTile(
              title: Text('• Five-tier wedding cake'),
            ),
            ListTile(
              title: Text('• Reserved table for 10 people'),
            ),
            ListTile(
              title: Text(
                  '• Usage of LCD projector, four wireless microphones, rostrum and existing sound system & lighting'),
            ),
            ListTile(
              title: Text('• VIP parking for bridal car in hotel driveway'),
            ),
            ListTile(
              title: Text('• Valet parking up to two cars'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Rest and Relax'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• One-night stay at luxurious Four Seasons Park-View Suite with bottle of sparkling juice, fresh fruits, chocolate pralines and exclusive usage of Executive Club Lounge'),
            ),
            ListTile(
              title: Text(
                  '• Two one-night stays at City View Room with buffet breakfast at Curate'),
            ),
            ListTile(
              title: Text(
                  '• One-night anniversary stay in Premier Park-View Room with buffet breakfast and dinner at Curate'),
            ),
            ListTile(
              title:
                  Text('• Special accommodation rate for friends and family'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Food Package'),
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menuPage(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                      'Click Here To Know Food Package That Right For You'),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Terms & Conditions'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Items not stated in the wedding package are subject to additional charges.'),
            ),
          ],
        ),
      ],
    ),
    WeddingItem(
      type: 'Chinese Grandeur',
      minGuests: 300,
      maxGuests: 500,
      ratePerMenu: 538.00,
      imageUrl:
          'https://pearlriver.com/cdn/shop/articles/chinese_wedding_double_happiness.jpg?v=1564769434',
      details: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'From the eight-course plated menu of Chinese specialties and fresh flower centrepieces to the complimentary couple\'s spa treatment and a wedding night stay in one of our suites, complete with champagne and a selection of sweet treats, our Chinese Grandeur package encourages you to relish in your love from the moment your special day begins.',
            style: HazulifarTheme.lightTextTheme.displaySmall,
          ),
        ),
        ExpansionTile(
          title: Text('Special Feature'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Two complimetary bottles of house-pout wine and corkage waiver of one bottle of wine per confirmed table'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Anniversary Bonus'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'One-night anniversary stay in a Premier Park View Room with buffet breakfast and dinner at Curate'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Wine and Dine'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• A choice of seven-course individual plated Chinese menu or five-course Western menu'),
            ),
            ListTile(
              title:
                  Text('• Selection of four canapés during cocktail reception'),
            ),
            ListTile(
              title: Text(
                  '• Free flow of soft drinks, two types of chilled juices and mocktail throughout dinner reception'),
            ),
            ListTile(
              title: Text(
                  '• Complimentary two bottles of house-pour wine per confirmed table'),
            ),
            ListTile(
              title:
                  Text('• Food tasting for up to 10 people on selected menu'),
            ),
            ListTile(
              title: Text(
                  '(Applicable from Monday to Friday, except on eve of public holidays and on public holidays)'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Enrichment'),
          children: <Widget>[
            ListTile(
              title: Text('• Stage backdrop with wording of your choice'),
            ),
            ListTile(
              title: Text(
                  '• Floral decorations inclusive of six units of pedestal stands, fresh flower centrepiece and tealight candles for all tables'),
            ),
            ListTile(
              title: Text('• Wedding favour for all guests'),
            ),
            ListTile(
              title: Text('• Five-tier wedding cake'),
            ),
            ListTile(
              title: Text('• Reserved table for 10 people'),
            ),
            ListTile(
              title: Text(
                  '• Usage of LCD projector, four wireless microphones, rostrum and existing sound system & lighting'),
            ),
            ListTile(
              title: Text('• VIP parking for bridal car in hotel driveway'),
            ),
            ListTile(
              title: Text('• Valet parking up to two cars'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Rest and Relax'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• One-night stay at luxurious Ambassador Suite with of bottle of champagne, fresh fruits, chocolate pralines and exclusive usage of Executive Club Lounge'),
            ),
            ListTile(
              title: Text(
                  '• Two one-night stays in a City-View Room with buffet breakfast at Curate'),
            ),
            ListTile(
              title: Text('• Complimentary spa session for bride and groom'),
            ),
            ListTile(
              title: Text(
                  '• One-night anniversary stay in Premier Park-View Room with buffet breakfast and dinner at Curate'),
            ),
            ListTile(
              title:
                  Text('• Special accommodation rate for friends and family'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Food Package'),
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menuPage(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                      'Click Here To Know Food Package That Right For You'),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Terms & Conditions'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Items not stated in the wedding package are subject to additional charges.'),
            ),
          ],
        ),
      ],
    ),
    WeddingItem(
      type: 'Indian Grandeur',
      minGuests: 300,
      maxGuests: 500,
      ratePerMenu: 538.00,
      imageUrl:
          'https://yannidesignstudio.com/app/uploads/2019/08/unique-mandap-indian-wedding-reception-decor-drake-hotel-hilton-chicago-red-floral-decoration-ideas.jpg',
      details: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'From start to finish, you won\'t have to worry about a thing when you choose our Indian Grandeur wedding package. Choose from specially prepared Indian menus designed by our executive chef, relax with a complimentary spa session for the bride and groom, and let your wedding specialist take care of the flowers, wedding favours and your entire wedding day itinerary - from the arrival of your guests to the cutting of your five-tier cake to the post-celebration treats in your suite.',
            style: HazulifarTheme.lightTextTheme.displaySmall,
          ),
        ),
        ExpansionTile(
          title: Text('Special Feature'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Two complimentary bottles of house-pour wine per confirmed table'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Spa Indulgence'),
          children: <Widget>[
            ListTile(
              title: Text('Complimentary spa session for bride and groom'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Luxury Dining'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• A choice of Indian set or buffet menu prepared by our executive chef'),
            ),
            ListTile(
              title:
                  Text('• Selection of four canapés during cocktail reception'),
            ),
            ListTile(
              title: Text(
                  '• Free flow of soft drinks, two types of chilled juices and mocktail throughout dinner reception'),
            ),
            ListTile(
              title: Text(
                  '• Complimentary two bottles of house-pour wine per confirmed table'),
            ),
            ListTile(
              title:
                  Text('• Food tasting for up to 10 people on selected menu'),
            ),
            ListTile(
              title: Text(
                  '(Applicable from Monday to Friday, except on eve of public holidays and on public holidays)'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Enrichment'),
          children: <Widget>[
            ListTile(
              title: Text('• Stage backdrop with wording of your choice'),
            ),
            ListTile(
              title: Text(
                  '• Floral decorations inclusive of six units of pedestal stands, fresh flower centrepiece and tealight candles for all tables'),
            ),
            ListTile(
              title: Text('• Wedding favour for all guests'),
            ),
            ListTile(
              title: Text('• Five-tier wedding cake'),
            ),
            ListTile(
              title: Text('• Reserved table for 10 people'),
            ),
            ListTile(
              title: Text(
                  '• Usage of LCD projector, four wireless microphones, rostrum and existing sound system & lighting'),
            ),
            ListTile(
              title: Text('• VIP parking for bridal car in hotel driveway'),
            ),
            ListTile(
              title: Text('• Valet parking up to two cars'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Rest and Relax'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• One-night stay in an Ambassador Suite with bottle of champagne, fresh fruits, chocolate pralines and exclusive usage of Executive Club Lounge'),
            ),
            ListTile(
              title: Text(
                  '• Two one-night stays at City-View Room with buffet breakfast at Curate'),
            ),
            ListTile(
              title: Text('• Complimentary spa session for bride and groom'),
            ),
            ListTile(
              title: Text(
                  '• One-night anniversary stay in Premier Park-View Room with buffet breakfast and dinner at Curate'),
            ),
            ListTile(
              title:
                  Text('• Special accommodation rate for friends and family'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Food Package'),
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menuPage(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                      'Click Here To Know Food Package That Right For You'),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Terms & Conditions'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Items not stated in the wedding package are subject to additional charges.'),
            ),
          ],
        ),
      ],
    ),
    WeddingItem(
      type: 'Malay Grandeur',
      minGuests: 300,
      maxGuests: 500,
      ratePerMenu: 498.00,
      imageUrl:
          'https://static.wixstatic.com/media/594e7c_59eaa11027a94cd5a6e786de0a5dd0a7~mv2.jpg/v1/fill/w_640,h_426,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/594e7c_59eaa11027a94cd5a6e786de0a5dd0a7~mv2.jpg',
      details: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Imagine a bounty of traditional Malay dishes such as nasi lemak and sang har noodles served next to beautiful floral centrepieces and twinkling tea light candles at each table, surrounded by the faces of your nearest and dearest as they celebrate your day with you. But the delicious food is only the beginning. Our Malay Grandeur package takes care of all the details, from your five-tier wedding cake to floral arrangements and décor to your wedding night accommodations.',
            style: HazulifarTheme.lightTextTheme.displaySmall,
          ),
        ),
        ExpansionTile(
          title: Text('Special Feature'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Your choice of Malay set or buffet menu prepared by our executive chef'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Spa Indulgence'),
          children: <Widget>[
            ListTile(
              title: Text('Complimentary spa session for bride and groom'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Luxury Dining'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• A choice of Malay set or buffet menu prepared by our executive chef'),
            ),
            ListTile(
              title:
                  Text('• Selection of four canapés during cocktail reception'),
            ),
            ListTile(
              title: Text(
                  '• Free flow of soft drinks, two types of chilled juices and mocktail throughout dinner reception'),
            ),
            ListTile(
              title:
                  Text('• Food tasting for up to 10 people on selected menu'),
            ),
            ListTile(
              title: Text(
                  '(Applicable from Monday to Friday, except on eve of public holidays and on public holidays)'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Enrichment'),
          children: <Widget>[
            ListTile(
              title: Text('• Stage backdrop with wording of your choice'),
            ),
            ListTile(
              title: Text(
                  '• Floral decorations inclusive of six units of pedestal stands, fresh flower centrepiece and tealight candles for all tables'),
            ),
            ListTile(
              title: Text('• Wedding favour for all guests'),
            ),
            ListTile(
              title: Text('• Five-tier wedding cake'),
            ),
            ListTile(
              title: Text('• Reserved table for 10 people'),
            ),
            ListTile(
              title: Text(
                  '• Usage of LCD projector, four wireless microphones, rostrum and existing sound system & lighting'),
            ),
            ListTile(
              title: Text('• VIP parking for bridal car in hotel driveway'),
            ),
            ListTile(
              title: Text('• Valet parking up to two cars'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Rest and Relax'),
          children: <Widget>[
            ListTile(
              title: Text(
                  '• One-night stay in an Ambassador Suite with bottle of sparkling juice, fresh fruits,chocolate pralines and exclusive usage of Executive Club Lounge'),
            ),
            ListTile(
              title: Text(
                  '• Two one-night stays at City-View Room with buffet breakfast at Curate'),
            ),
            ListTile(
              title: Text('• Complimentary spa session for bride and groom'),
            ),
            ListTile(
              title: Text(
                  '• One-night anniversary stay in Premier Park-View Room with buffet breakfast and dinner at Curate'),
            ),
            ListTile(
              title:
                  Text('• Special accommodation rate for friends and family'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Food Package'),
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menuPage(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                      'Click Here To Know Food Package That Right For You'),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Terms & Conditions'),
          children: <Widget>[
            ListTile(
              title: Text(
                  'Items not stated in the wedding package are subject to additional charges.'),
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wedding Package Details')),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: menuItems.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeddingPageDetail(
                          title: item.type,
                          details: item.details,
                        ),
                      ),
                    );
                  },
                  child: buildMenuItemCard(item),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text('Register'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItemCard(WeddingItem item) {
    return Container(
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              item.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(item.type, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Guests: ${item.minGuests} - ${item.maxGuests}'),
            Text('Rate: RM${item.ratePerMenu.toStringAsFixed(2)} per person'),
          ],
        ),
      ),
    );
  }
}
