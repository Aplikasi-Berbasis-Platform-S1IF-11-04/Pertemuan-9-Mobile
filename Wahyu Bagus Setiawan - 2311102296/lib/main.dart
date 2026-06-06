import 'package:flutter/material.dart';

void main() {
  runApp(const SmartWalletApp());
}

class SmartWalletApp extends StatelessWidget {
  const SmartWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoBank Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Data Array untuk ListView.builder
  final List<Map<String, dynamic>> transactions = const [
    {"title": "Apple Music Subscription", "amount": "-\$9.99", "date": "Today, 10:24", "icon": Icons.music_note},
    {"title": "Salary Payment", "amount": "+\$4,500.00", "date": "Yesterday, 09:00", "icon": Icons.account_balance_wallet},
    {"title": "Starbucks Coffee", "amount": "-\$5.50", "date": "Yesterday, 15:30", "icon": Icons.coffee},
    {"title": "Amazon Purchase", "amount": "-\$120.00", "date": "Oct 24, 2023", "icon": Icons.shopping_bag},
  ];

  // Data Array untuk ListView.separated
  final List<String> financialGoals = const [
    "Emergency Fund: 80% reached",
    "New Macbook Pro: 45% reached",
    "Investment Portfolio: 60% reached",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("Smart Wallet", style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1 & 6. CONTAINER & STACK (Hero Virtual Card)
              const SectionHeader(title: "Your Virtual Card", subtitle: "Stack & Container"),
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFFA855F7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Balance", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16)),
                          const Text("\$12,450.00", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: 25,
                      left: 25,
                      child: Text("**** **** **** 4242", style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 2)),
                    ),
                    Positioned(
                      top: 25,
                      right: 25,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                        child: const Icon(Icons.contactless, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 2. GRIDVIEW (Quick Actions)
              const SectionHeader(title: "Quick Actions", subtitle: "GridView (6 Items)"),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  _buildMenuIcon(Icons.send, "Send", Colors.blue),
                  _buildMenuIcon(Icons.qr_code_scanner, "Scan", Colors.orange),
                  _buildMenuIcon(Icons.receipt_long, "Bills", Colors.green),
                  _buildMenuIcon(Icons.trending_up, "Invest", Colors.purple),
                  _buildMenuIcon(Icons.security, "Insurance", Colors.red),
                  _buildMenuIcon(Icons.more_horiz, "More", Colors.grey),
                ],
              ),

              const SizedBox(height: 30),

              // 3. LISTVIEW (Statis - Account Tiers)
              const SectionHeader(title: "Account Tiers", subtitle: "ListView Static (A, B, C)"),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildTierCard("Tier A", "Silver Member", Colors.blueGrey),
                    _buildTierCard("Tier B", "Gold Member", Colors.orangeAccent),
                    _buildTierCard("Tier C", "Platinum Elite", Colors.indigo),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 4. LISTVIEW.BUILDER (Transactions)
              const SectionHeader(title: "Recent Transactions", subtitle: "ListView.builder"),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final item = transactions[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFF1F5F9),
                        child: Icon(item['icon'], color: const Color(0xFF6366F1)),
                      ),
                      title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item['date']),
                      trailing: Text(item['amount'], style: TextStyle(
                        color: item['amount'].contains('+') ? Colors.green : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      )),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // 5. LISTVIEW.SEPARATED (Financial Goals)
              const SectionHeader(title: "Financial Goals", subtitle: "ListView.separated"),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: financialGoals.length,
                  separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20, height: 1),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.flag_circle, color: Colors.amber),
                      title: Text(financialGoals[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
      ],
    );
  }

  Widget _buildTierCard(String title, String desc, Color color) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          Text(desc, style: TextStyle(color: Colors.white.withOpacity(0.8))),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const SectionHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.indigo.shade400, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}