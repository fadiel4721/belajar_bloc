import 'dart:async';
import 'package:belajar_bloc/pages/pulsa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomepageShoope extends StatefulWidget {
  const HomepageShoope({super.key});

  @override
  _HomepageShoopeState createState() => _HomepageShoopeState();
}

class _HomepageShoopeState extends State<HomepageShoope> {
  static Duration countdownDuration = const Duration(hours: 3, minutes: 42, seconds: 57);
  Duration _currentDuration = countdownDuration;
  Timer? _timer;
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentDuration.inSeconds > 0) {
        setState(() {
          _currentDuration = _currentDuration - const Duration(seconds: 1);
        });
      } else {
        _timer?.cancel();
       
      }
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              hintText: 'Produk Lokal Di Bawah 45RB',
              hintStyle: TextStyle(color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Wallet Info
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Rp194.632"),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.account_balance_wallet, color: Colors.grey),
                            SizedBox(width: 5),
                            Text("Isi Saldo", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("262"),
                        SizedBox(height: 5),
                        Text("Koin Saya", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.card_giftcard, color: Colors.red),
                        SizedBox(height: 5),
                        Text("Transfer", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Grid Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  List<String> assetImages = [
                    'assets/images/ongkir.png',
                    'assets/images/mobile.png',
                    'assets/images/shopee.png',
                    'assets/images/shopping-bag.png',
                    'assets/images/transfer.png',
                    'assets/images/giftbox.png',
                    'assets/images/shopefood.png',
                    'assets/images/lokal.png',
                    'assets/images/paylater.png',
                    'assets/images/grid.png',
                  ];

                  List<String> optionTexts = [
                    'Gartis Ongkir & Voucher',
                    'Pulsa, Tagihan & Tiket',
                    'Shopee Mall',
                    'Shopee Pay Sekitarmu',
                    'Transfer Shopee',
                    'Hadiah Shopee',
                    'Shopee Food',
                    'Shopee Pilih Lokal',
                    'SPaylater',
                    'Lihat Semua',
                  ];

                  return GestureDetector(
                    onTap: () {
                      if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Pulsa()),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 20,
                            backgroundImage: AssetImage(assetImages[index]),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          optionTexts[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Promo Banners
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageSlideshow(
                        width: double.infinity,
                        height: 200,
                        initialPage: 0,
                        indicatorColor: Colors.blue,
                        indicatorBackgroundColor: Colors.grey,
                        onPageChanged: (value) {},
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: [
                          Image.asset('assets/images/pi.jpg', fit: BoxFit.cover),
                          Image.asset('assets/images/pi.jpg', fit: BoxFit.cover),
                          Image.asset('assets/images/pi.jpg', fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Flash Sale
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "FLASH SALE",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatDuration(_currentDuration),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        "Lihat Semua",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        List<String> productImages = [
                          'assets/images/product1.jpg',
                          'assets/images/product2.jpg',
                          'assets/images/product3.jpg',
                          'assets/images/product4.jpg',
                          'assets/images/product5.jpg',
                        ];
                        List<String> productNames = [
                          'HP Minimalis',
                          'Kartu ATM',
                          'Laptop Keren',
                          'Jersey Timnas',
                          'Dada Ayam',
                        ];

                        return Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  productImages[index],
                                  height: 80,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                '93% OFF',
                                style: TextStyle(color: Colors.red),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                productNames[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, index, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (newIndex) {
              selectedIndex.value = newIndex; 
            },
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Rekomendasi',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.live_tv),
                label: 'Live',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill),
                label: 'Video',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(Icons.notifications),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '99+',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'Notifikasi',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Saya',
              ),
            ],
          );
        },
      ),
    );
  }
}
