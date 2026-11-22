import 'package:flutter/material.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  String category = 'Organik';

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    super.dispose();
  }

  void saveLocation() {
    if (nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        double.tryParse(latitudeController.text) == null ||
        double.tryParse(longitudeController.text) == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lengkapi data lokasi dengan benar!'),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil divalidasi! Simpan ke database untuk menyimpannya permanen.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),

      appBar: AppBar(
        title: const Text('Tambah Lokasi'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Informasi Tempat Sampah',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF164B35),
              ),
            ),

            const SizedBox(height: 25),

            inputField(
              'Nama Tempat Sampah',
              nameController,
              Icons.delete_outline,
            ),

            const SizedBox(height: 18),

            inputField(
              'Alamat Lokasi',
              addressController,
              Icons.location_on_outlined,
            ),

            const SizedBox(height: 18),

            const Text(
              'Kategori Sampah',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: category,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              items: [
                'Organik',
                'Anorganik',
                'Campuran',
              ].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  category = value!;
                });
              },
            ),

            const SizedBox(height: 18),

            inputField(
              'Latitude',
              latitudeController,
              Icons.map,
            ),

            const SizedBox(height: 18),

            inputField(
              'Longitude',
              longitudeController,
              Icons.map_outlined,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: saveLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF229B62),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'SIMPAN LOKASI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}