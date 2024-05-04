import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Festival extends StatefulWidget {
  const Festival({Key? key}) : super(key: key);

  @override
  State<Festival> createState() => _FestivalState();
}

class _FestivalState extends State<Festival> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: width < 600
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: const Text(
                "Fresh Gala",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color(0xFF034703),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_outlined))
              ],
              foregroundColor: Colors.white,
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return DesktopLayout();
          } else {
            return const MobileLayout();
          }
        },
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<Map<String, String>> fruits = [
      {
        "name": "Banana",
        "otherName": "(Organic)",
        "imageUrl": "assets/banana.png",
        "subtext":
            "Bananas are rich in fibre, which helps in increasing \n satiety and reducing binge eating and thus, it may help in weight loss. Additionally, it may\nimprove digestive health and relieve constipation.",
        "price": "Rs.45"
      },
      {
        "name": "Apple",
        "otherName": "(Organic)",
        "imageUrl": "assets/apple.png",
        "subtext":
            "Bananas are rich in fibre, which helps in increasing \n satiety and reducing binge eating and thus, it may help in weight loss. Additionally, it may\nimprove digestive health and relieve constipation.",
        "price": "Rs.45"
      },
      {
        "name": "Cherry",
        "otherName": "(Organic)",
        "imageUrl": "assets/mango.png",
        "subtext":
            "Bananas are rich in fibre, which helps in increasing \n satiety and reducing binge eating and thus, it may help in weight loss. Additionally, it may\nimprove digestive health and relieve constipation.",
        "price": "Rs.45"
      },
    ];

    final List<String> images = [
      'assets/leaf.png',
      'assets/sprouts.png',
      'assets/sesonal.png',
      'assets/sesonalveg.png',
    ];

    // ignore: non_constant_identifier_names
    final List<String> imgtxt = [
      'Leafy Greens',
      'Sprouts',
      'Seasonal \nFruits',
      'Seasonal \nVegetables',
    ];

    final List<String> imagePath = [
      'assets/sesonalveg.png',
      'assets/sesonalveg.png',
      'assets/sesonalveg.png',
      'assets/sesonalveg.png',
    ];

    List umbrellaImage = [
      'assets/fc2.png',
      'assets/fc2.png',
      'assets/fc2.png',
      'assets/fc2.png',
      'assets/fc2.png',
      'assets/fc2.png'
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          // Your mobile layout widgets here
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: width,
                height: height * 0.60,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/festivalbanner.png"),
                      fit: BoxFit.fill),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: height/4,),
                      const Text('Up to 20% off',
                          style: TextStyle(
                              color: Color(0xFF9F581F),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF034703),
                            padding: const EdgeInsets.all(0)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          width: width * 0.50,
                          height: 35,
                          decoration: const BoxDecoration(
                              color: Color(0xFF034703),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1))),
                          child: const Row(
                            children: [
                              const Text('Shop Now ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 15,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  // padding: EdgeInsets.symmetric(vertical: 20),
                  width: width * 0.90,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconText('assets/organic4.svg', 'Fresh', context),
                      _buildIconText('assets/organic1.svg', 'Organic', context),
                      _buildIconText(
                          'assets/organic3.svg', 'Best Price', context),
                      _buildIconText('assets/organic2.svg', 'Variety', context),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // More mobile layout widgets...

          const SizedBox(height: 20),
          const Text('Must Have Fruits',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 350, // Fixed height for horizontal ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                return FruitCard(
                  name: fruits[index]["name"]!,
                  otherName: fruits[index]["otherName"]!,
                  imageUrl: fruits[index]["imageUrl"]!,
                  subtext: fruits[index]["subtext"]!,
                  price: fruits[index]["price"]!,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Organic And Fresh Vegetables',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'See All ',
                              style: TextStyle(
                                  color: Color(0xFF034703),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                              selectionColor: Color(0xFF034703),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF034703),
                              size: 12,
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text('Veggies Collection',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), //
                  //padding: const EdgeInsets.all(12.0),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // childAspectRatio: 4.0,
                  children: List.generate(images.length, (index) {
                    return Card(
                        child: Expanded(
                      child: Container(
                        height: 500,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            color: Color(0xFFE5EEC3),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                imgtxt[index],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                  height: 100,
                                  width: width * 0.25,
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.fill,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ));
                  }),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Fruits Collection',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), //
                  //padding: const EdgeInsets.all(12.0),
                  crossAxisCount: 3,
                  // crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  // childAspectRatio: 4.0,
                  children: List.generate(umbrellaImage.length, (index) {
                    return SizedBox(
                      child: SizedBox(
                          height: 300,
                          width: width * 0.25,
                          child: Image.asset(
                            umbrellaImage[index],
                            fit: BoxFit.fill,
                          )),
                    );
                  }),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
                child: Container(
                  width: width,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color(0xFF034703),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    "Explore All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                )),
          ),

          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _buildIconText(
      String svgAssetPath, String label, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(mobile ? 4 : 8),
          decoration: const BoxDecoration(
            color: Color(0xFF034703),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            svgAssetPath,
            height: 18,
            width: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        Text(label,
            style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF034703),
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class DesktopLayout extends StatelessWidget {
  final List<String> images = [
    'assets/leaf.png',
    'assets/sprouts.png',
    'assets/sesonal.png',
    'assets/sesonalveg.png',
    'assets/cut_fruit.png',
    'assets/fruit_juice.png'
  ];

  // ignore: non_constant_identifier_names
  final List<String> imgtxt = [
    'Leafy Greens',
    'Sprouts',
    'Seasonal \nFruits',
    'Seasonal \nVegetables',
    "Cut Fruits",
    "Fruit Juice"
  ];

  final List<String> imagePath = [
    'assets/sesonalveg.png',
    'assets/sesonalveg.png',
    'assets/sesonalveg.png',
    'assets/sesonalveg.png',
  ];

  DesktopLayout({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      // Added to ensure the whole screen is scrollable
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: width,
                height: height * 1.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/festivalbanner.png"),
                      fit: BoxFit.fill),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 2,
                      ),
                      const Text('Up to 20% off',
                          style: TextStyle(
                              color: Color(0xFF9F581F),
                              fontSize: 40,
                              fontWeight: FontWeight.w900)),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF034703),
                            padding: const EdgeInsets.all(0)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: width > 1000 ? width * 0.17 : width * 0.30,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Color(0xFF034703),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Row(
                            children: [
                              const Text('Shop Now ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_outlined),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                child: Container(
                  // padding: EdgeInsets.symmetric(vertical: 20),
                  width: width * 0.70,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconText('assets/organic4.svg', 'Fresh'),
                      _buildIconText('assets/organic1.svg', 'Organic'),
                      _buildIconText('assets/organic3.svg', 'Best Price'),
                      _buildIconText('assets/organic2.svg', 'Variety'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Organic And Fresh Vegetables',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            const Text(
                              'See All ',
                              style: TextStyle(
                                  color: Color(0xFF034703),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              selectionColor: Color(0xFF034703),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF034703),
                              size: 15,
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text('Fresh & Organic Today',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), //
                  //padding: const EdgeInsets.all(12.0),
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // childAspectRatio: 4.0,
                  children: List.generate(images.length, (index) {
                    return Card(
                        child: Container(
                      height: 400,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          color: Color(0xFFE5EEC3),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            imgtxt[index],
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                              height: 100,
                              width: width * 0.07,
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ));
                  }),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Fruits Collection',
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: width * 0.12,
                        height: 150,
                        child: Image.asset(
                          'assets/fc1.png',
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                        width: width * 0.12,
                        height: 150,
                        child: Image.network(
                          'assets/fc2.png',
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                        width: width * 0.12,
                        height: 150,
                        child: Image.network(
                          'assets/fc6.png',
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                        width: width * 0.12,
                        height: 150,
                        child: Image.network(
                          'assets/fc4.png',
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                        width: width * 0.12,
                        height: 150,
                        child: Image.network(
                          'assets/fc6.png',
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                        width: width * 0.12,
                        height: 150,
                        child: Image.network(
                          'assets/fc1.png',
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0)),
                    child: Container(
                      width: width * 0.60,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xFF034703),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Text(
                        "Explore All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    )),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildIconText(String svgAssetPath, String label) {
  return Row(
    children: [
      Container(
        height: 40, // Adjust the size as needed
        width: 40,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFF034703),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          svgAssetPath,

          // ignore: deprecated_member_use
          color: Colors.white,
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(width: 8),
      Text(label,
          style: const TextStyle(
              color: Color(0xFF034703),
              fontSize: 18,
              fontWeight: FontWeight.w500)),
    ],
  );
}

Widget IconwithText(String svgImg, String labelText, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            svgImg,
            height: 24, // Adjust the size as needed
            width: 24,
            // ignore: deprecated_member_use
            color: Colors.brown,
          ),
        ),
        const SizedBox(height: 4),
        Text(labelText, style: const TextStyle(fontSize: 12)),
      ],
    ),
  );
}

class FruitCard extends StatelessWidget {
  final String name;
  final String otherName;
  final String price;
  final String imageUrl;
  final String subtext;

  const FruitCard(
      {Key? key,
      required this.name,
      required this.otherName,
      required this.imageUrl,
      required this.price,
      required this.subtext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 6,
      child: Container(
        width: width * 0.75,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/fruit_background_img.png"),
                fit: BoxFit.fill)),
        child: Row(
          children: [
            Expanded(
              // Allows dynamic resizing
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // To align text to the left
                  children: [
                    Text(name,
                        style: const TextStyle(
                            color: Color(0xFF562D0C),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(otherName,
                        style: const TextStyle(
                            color: Color(0xFF562D0C),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(subtext,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Color(0xFF562D0C),
                          fontSize: 14,
                        )),
                    Text(price,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(imageUrl),
                const SizedBox(
                  height: 80,
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF034703))),
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Color(0xFF034703)),
                  ),
                ),
              ],
            ),
            // ClipPath(
            //   clipper: WaveClipper(),
            //   child: Image.asset(imageUrl,
            //       fit: BoxFit.cover, width: 100), // Adjusted width
            // ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var firstControlPoint = Offset(size.width / 4, size.height - 30);
    var firstEndPoint = Offset(size.width / 2, size.height);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height + 30);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subText;
  final int rating;

  const CustomCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subText,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 4,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(subText, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: index < rating ? Colors.amber : Colors.grey,
                        size: 20,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
