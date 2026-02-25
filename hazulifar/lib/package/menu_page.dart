import 'package:flutter/material.dart';
import 'menu_detail.dart'; 
import '../booking/booking_page.dart';

class MenuItem {
  final String type;
  final int numOfGuests;
  final double ratePerMenu;
  final String imageUrl;
  final String details;

  MenuItem({
    required this.type,
    required this.numOfGuests,
    required this.ratePerMenu,
    required this.imageUrl,
    required this.details,
  });
}

class menuPage extends StatelessWidget {
   menuPage({Key? key}) : super(key: key);

  final List<MenuItem> menuItems = [
    MenuItem(
      type: 'Chinese Banquet Package',
      numOfGuests: 100,
      ratePerMenu: 199.00,
      imageUrl:
          'https://www.thatsmandarin.com/wp-content/uploads/2018/07/Wedding-Banquet-in-China-580x350.jpg',
      details: 'Set Menu\n\n\n'
          'Trilogy of Hot & Cold Combination\n\n'
          'Steamed Prawn Dumpling with Dry Scallop Sauce\n'
          'Marinated Japanese Octopus & Pickled Pumpkin\n'
          'Premium Chicken Pandan with Chili Aioli\n\n'
          'Soup\n\n'
          'Double Boiled Village Chicken Soup with Fresh Ginseng & Enoki Mushroom\n\n'
          'Mains\n\n'
          'Roasted Whole Chicken with Five Spice & Crackers\nBraised Free Range Chicken with Herbs & Red Dates in Lotus Leaf\n'
          'Steamed Live Seabass with King Superior Sauce & Ginger Crisp\n'
          'Wok Fried Tiger Prawn with Ginger Chili Sauce & Crispy Mini Bun\n'
          'Braised Medley Mushroom with Broccoli & Almond Flakes\n'
          'Fragrant Chinese Fried Rice with Seafood & XO Sauce\n\n'
          'Dessert\n\n'
          'Chilled Mango Puree with Sago & Pomelo',
    ),
    MenuItem(
      type: 'Western Banquet Package',
      numOfGuests: 150,
      ratePerMenu: 280.00,
      imageUrl:
          'https://whimsicalwonderlandweddings.com/wp-content/uploads/2013/10/Wedding-Food-Menue-Ideas-Lauren-May-Photos.jpg',
      details: 'Epicurean Set Menu\n\n\n'
          'Appetizer\n\n'
          'Sesame Crusted Tuna\n'
          'Espelette | Bonito Gelee | Fennel Marmalade\n\n'
          'Soup\n\n'
          'Green Pea Velouté\n'
          'Smoked Scallop | Extra Virgin Olive Oil\n\n'
          'Mains\n\n'
          'Pan-seared Seabass\n'
          'Braised Daikon | Wilted Spinach | Citrus Gastrique\n'
          'Or\n'
          'Sous Vide Beef Short Ribs\n'
          'Pomme Puree | Glazed Vegetable Medley | Au Jus\n\n'
          'Dessert\n\n'
          'Red Velvet\n'
          'Ispahan Anglais | Lychee Compote Ispahan | Granola Crumb\n'
          'Mini Pralines',
    ),
    MenuItem(
      type: 'Indian Banquet Package', 
      numOfGuests: 200, 
      ratePerMenu: 178.00, 
      imageUrl: 'https://www.happywedding.app/blog/wp-content/uploads/2020/05/Latest-Indian-Wedding-Food-Menu-List.jpg', 
      details: 'Buffet Menu\n\n\n'
          'Appetizer\n\n'
          'Pani Puri | Bhel Puri\n'
          'Kachumber Salad (Cucumber Salad with Tomato & Onion)\n'
          'Aloo Matar (Potatoes & Green Peas with Cumin)\n'
          'Chana Dal with Masala Spices\n'
          'Lime Pickle | Mango Chutney | Cucumber Raita | Mint Raita | Lime | Onion Ring\n\n'
          'From The Garden\n\n'
          'Salad Bar & Condiments\n'
          'Lettuce - Baby Romaine & Mesclun Mix\n'
          'Dressings - Balsamic, Thousand Island, Italian, Roasted Sesame\n\n'
          'Soup\n\n'
          'Tomato Shorba (Spiced Tomato Soup)\n\n'
          'Breads & Butter\n\n'
          'Selection of Freshly Baked Rolls\n'
          'Poppadum | Naan | Chapatti\n\n'
          'Hot Buffet Station\n\n'
          'Fish Curry with Lady Fingers\n'
          'Chicken Tikka\n'
          'Paneer Jalfrezi (Cottage Cheese with Curry Vegetables)\n'
          'Spicy Prawn Masala\n'
          'Dal Tadka\n'
          'Aloo Ghobi (Potato & Cauliflower in Masala Spice)\n'
          'Steamed Rice Pilaf\n\n'
          'Dessert\n\n'
          'Deluxe Nyonya Kuih\n'
          'Bharwan Gulab Jamun\n'
          'Fruit Salad in Cardamom Syrup\n'
          'Jalebi\n'
          'Gajar Ka Halwa\n'
          'Tropical Sliced Fresh Fruit Platter',
      ),
      MenuItem(
      type: 'Malay Banquet Package', 
      numOfGuests: 250, 
      ratePerMenu: 188.00, 
      imageUrl: 'https://story.wedding.com.my/wp-content/uploads/2016/06/new-1-1.jpg', 
      details: 'Buffet Menu\n\n\n'
          'Salad & Appetizers\n\n'
          'Compound Salad\n'
          'Kerabu Ayam Bakar & Kacang Botol\n'
          'Kerabu Ikan Bilis & Betik Muda\n'
          'Urap Udang Pucuk Ubi\n'
          'Kerabu Sotong & Mangga Muda\n'
          'Acar Jelatah\n'
          'Rojak Buah\n\n'
          'From The Garden\n\n'
          'Salad Bar & Condiments\n'
          'Baby Romaine & Mesclun Mix\n'
          'Dressing - Balsamic, Italian, Thousand Island, Roasted Sesame\n\n'
          'Soup\n'
          'Sup Ayam Berempah\n\n'
          'Breads & Butter\n\n'
          'Selection of Freshly Baked Rolls\n'
          'Unsalted Butter\n\n'
          'Hot Buffet Station\n\n'
          'Ayam Masak Merah\n'
          'Beef Rendang\n'
          'Udang Masak Lemak Cili Api\n'
          'Terung Sambal Belacan\n'
          'Sayur Lodeh\n'
          'Steamed Fragrant White Rice\n\n'
          'Dessert\n\n'
          'Assorted Nyonya Kuih\n'
          'Pengat Pisang\n'
          'Sarawak Kek Lapis\n'
          'Blueberry Light Cheese Cake\n'
          'Tropical Sliced Fresh Fruit Platter',
      ),
      MenuItem(
      type: 'Malay Banquet Package', 
      numOfGuests: 250, 
      ratePerMenu: 198.00, 
      imageUrl: 'https://apicms.thestar.com.my/uploads/images/2023/03/13/thumbs/small/1976653.jpg', 
      details: 'Muhibbah Set Menu\n\n\n'
          'Soup\n\n'
          'Sup Ayam Madura Berempah\n'
          'Nasi Impit | Kentang | Daun Sup\n\n'
          'Trilogy Mains\n\n'
          'Ayam Goreng Sambal Madu Kelulut\n'
          'Deep-fried Chicken with Pounded Chili Paste & Kelulut Honey\n'
          'Asam Pedas Daging Tetel\n'
          'Stewed Beef in Spicy Tamarind Gravy\n'
          'Sambal Belacan Asparagus\n'
          'Wok-fried Asparagus with Sambal Belacan\n'
          'Pineapple Fried Rice\n'
          'Mixed Seafood | Chicken | Cashew Nut\n\n'
          'Dessert\n\n'
          'Pandan Sago Pudding\n'
          'Palm Sugar | Coconut Milk | Hawaiian Coconut | Exotic Fruit Salsa\n',
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Package Details')),
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
                        builder: (context) => MenuPageDetail(
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
                    builder: (context) => BookingDetailsPage(name: '', address: '', phoneNo: '', email: '',),
                  ),
                );
              },
              child: Text('Book Your Dream Wedding'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItemCard(MenuItem item) {
    return Card(
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
          Text('Guests: ${item.numOfGuests}'),
          Text('Rate: RM${item.ratePerMenu.toStringAsFixed(2)} per person'),
        ],
      ),
    );
  }
}