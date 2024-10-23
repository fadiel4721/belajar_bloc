import 'package:flutter/material.dart';

class Pulsa extends StatelessWidget {
  Pulsa({super.key});

  final List<Map<String, dynamic>> pulsaOptions = [
    {'nominal': '5rb', 'price': 'Rp7.000', 'discount': '', 'isSelected': false},
    {'nominal': '10rb', 'price': 'Rp10.500', 'discount': '-14%', 'isSelected': false},
    {'nominal': '15rb', 'price': 'Rp9.500', 'discount': '-43%', 'isSelected': false},
    {'nominal': '20rb', 'price': 'Rp20.500', 'discount': '-5%', 'isSelected': false},
    {'nominal': '25rb', 'price': 'Rp19.500', 'discount': '-27%', 'isSelected': false},
    {'nominal': '30rb', 'price': 'Rp30.995', 'discount': '-3%', 'isSelected': false},
    {'nominal': '40rb', 'price': 'Rp41.495', 'discount': '-1%', 'isSelected': false},
    {'nominal': '45rb', 'price': 'Rp45.985', 'discount': '-1%', 'isSelected': false},
    {'nominal': '50rb', 'price': 'Rp44.500', 'discount': '-14%', 'isSelected': false},
    {'nominal': '55rb', 'price': 'Rp55.495', 'discount': '-1%', 'isSelected': false},
    {'nominal': '60rb', 'price': 'Rp61.495', 'discount': '-1%', 'isSelected': false},
    {'nominal': '65rb', 'price': 'Rp66.495', 'discount': '-1%', 'isSelected': false},
    {'nominal': '70rb', 'price': 'Rp70.495', 'discount': '-1%', 'isSelected': false},
    {'nominal': '75rb', 'price': 'Rp75.495', 'discount': '-1%', 'isSelected': false},
    {'nominal': '80rb', 'price': 'Rp80.495', 'discount': '-1%', 'isSelected': false},
  ];

  final ValueNotifier<int> selectedTab = ValueNotifier<int>(0);
  final ValueNotifier<int?> selectedPulsaIndex = ValueNotifier<int?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsa', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '082298724372',
                        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset('assets/images/telkomsel_logo.png', width: 60, height: 30),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.contact_phone, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTab('Pulsa', 0),
                _buildTab('Data', 1),
                _buildTab('Roaming', 2),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPromoCard('assets/images/promo_icon.png', 'Min. Belanja 100 Rb', true),
                  _buildPromoCard('assets/images/spaylater_icon.png', 'Cashback 1% Min. Beli Rp0 s/d 50RB', true),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<int?>(
              valueListenable: selectedPulsaIndex,
              builder: (context, selectedIndex, child) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: pulsaOptions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedPulsaIndex.value = index; // Update selected pulsa index
                      },
                      child: _buildPulsaCard(
                        pulsaOptions[index]['nominal'],
                        pulsaOptions[index]['price'],
                        pulsaOptions[index]['discount'],
                        selectedIndex == index,
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 242, 147, 4),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedTab,
      builder: (context, selected, child) {
        final bool isSelected = selected == index;
        return GestureDetector(
          onTap: () {
            selectedTab.value = index;
          },
          child: Column(
            children: [
              Text(label, style: TextStyle(color: isSelected ? Colors.orange : Colors.black)),
              if (isSelected)
                Container(
                  width: 40,
                  height: 2,
                  color: Colors.orange,
                ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildPromoCard(String imagePath, String text, bool hasClaimButton) {
    return Card(
      elevation: 2,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: 205,
            height: 85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(imagePath, width: 30, height: 30),
                const SizedBox(height: 5),
                Text(text, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          if (hasClaimButton)
            Positioned(
              right: 0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(50, 30),
                ),
                child: const Text('Klaim', style: TextStyle(color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPulsaCard(String nominal, String price, String discount, bool isSelected) {
    return Card(
      elevation: 2,
      shape: isSelected
          ? RoundedRectangleBorder(
              side: const BorderSide(color: Colors.orange, width: 2),
              borderRadius: BorderRadius.circular(8),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  nominal,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.orange : Colors.black,
                  ),
                ),
                Text(price, style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
          if (discount.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Text(
                discount,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
        ],
      ),
    );
  }
}
