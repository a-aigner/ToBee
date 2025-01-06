import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.deepPurple.shade100,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Rewards',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Points collected section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Point collected',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Swap reward logic
                  },
                  style: ElevatedButton.styleFrom(),
                  child: const Text('Swap Now'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Row(
                children: [
                  // XP Icon or Image
                  Icon(Icons.star, color: Colors.orange, size: 40),
                  SizedBox(width: 20),
                  Text(
                    '1150', // This would be fetched from a backend
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // History section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // See All history logic
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: const [
                  RewardHistoryItem(
                    points: -100,
                    description: 'Swap reward',
                    isNegative: true,
                  ),
                  RewardHistoryItem(
                    points: 100,
                    description: 'Reward from first login',
                  ),
                  RewardHistoryItem(
                    points: 120,
                    description: 'Reward from first login',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RewardHistoryItem extends StatelessWidget {
  final int points;
  final String description;
  final bool isNegative;

  const RewardHistoryItem({
    super.key,
    required this.points,
    required this.description,
    this.isNegative = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Text(
          '${isNegative ? '-' : '+'}$points',
          style: TextStyle(
            color: isNegative ? Colors.red : Colors.green,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Text(description),
      ),
    );
  }
}
