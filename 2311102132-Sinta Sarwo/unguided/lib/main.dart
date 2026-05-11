import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SimplePOSDashboard(),
));

class SimplePOSDashboard extends StatelessWidget {
  const SimplePOSDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> keranjang = ['Nasi Goreng', 'Es Teh', 'Kerupuk'];
    final List<String> riwayat = ['TRX-01', 'TRX-02', 'TRX-03'];

    return Scaffold(
      appBar: AppBar(title: const Text('SmartPOS Simple')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. STACK
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 100, width: double.infinity, color: Colors.blue),
                const Text('TOTAL: Rp 150.000', style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),

            // 2. CONTAINER
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              color: Colors.greenAccent,
              width: double.infinity,
              child: const Text('Status Printer: Aktif', textAlign: TextAlign.center),
            ),

            const Divider(),
            const Text('Kategori'),

            // 3. GRIDVIEW
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: const EdgeInsets.all(8),
              children: List.generate(6, (index) => Card(
                color: Colors.orange[200],
                child: Center(child: Text('Menu ${index + 1}')),
              )),
            ),

            const Divider(),
            const Text('Top Menu'),

            // 4. LISTVIEW
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ListTile(title: Text('A. Ayam Bakar')),
                ListTile(title: Text('B. Bebek Goreng')),
                ListTile(title: Text('C. Cumi Saus Tiram')),
              ],
            ),

            const Divider(),
            const Text('Keranjang'),

            // 5. LISTVIEW.BUILDER
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: keranjang.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(keranjang[index]),
                leading: const Icon(Icons.check),
              ),
            ),

            const Divider(),
            const Text('Riwayat Transaksi'),

            // 6. LISTVIEW.SEPARATED
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: riwayat.length,
              separatorBuilder: (context, index) => const Divider(color: Colors.red),
              itemBuilder: (context, index) => ListTile(
                title: Text(riwayat[index]),
                trailing: const Text('Lunas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}