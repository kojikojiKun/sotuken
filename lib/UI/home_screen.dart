import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              const Text(
                'わすれものチェック',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF43594A),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'お出かけ前に、持ち物を確認しよう！',
                style: TextStyle(fontSize: 14, color: Color(0xFF77776F)),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5EDE2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.checklist_rounded,
                      size: 42,
                      color: Color(0xFF66846C),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '今日の持ち物',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF43594A),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text('忘れ物がないか確認しよう'),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                '持ち物リスト',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const ItemCard(
                icon: Icons.account_balance_wallet_outlined,
                name: '財布',
              ),
              const ItemCard(icon: Icons.smartphone, name: 'スマートフォン'),
              const ItemCard(icon: Icons.vpn_key_outlined, name: '鍵'),
              const ItemCard(icon: Icons.water_drop_outlined, name: '水筒'),

              const Spacer(),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomItem(icon: Icons.home_rounded, label: 'ホーム'),
                  BottomItem(icon: Icons.checklist_rounded, label: 'リスト'),
                  BottomItem(icon: Icons.settings_outlined, label: '設定'),
                ],
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final IconData icon;
  final String name;

  const ItemCard({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 26, color: const Color(0xFF78947D)),
          const SizedBox(width: 14),
          Expanded(child: Text(name, style: const TextStyle(fontSize: 16))),
          Icon(Icons.circle_outlined, color: Colors.grey, size: 23),
        ],
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const BottomItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 25, color: const Color(0xFF66846C)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
