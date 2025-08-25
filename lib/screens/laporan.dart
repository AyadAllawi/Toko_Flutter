import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/db/db_helper.dart';
import 'package:flutter_toko_sederhana/main.dart';
import 'package:flutter_toko_sederhana/model/transaksi.dart';
import 'package:flutter_toko_sederhana/screens/keuangan.dart';
import 'package:flutter_toko_sederhana/screens/mutasi.dart';

class Report extends StatefulWidget {
  static const id = '/report_transaction_screen';

  const Report({super.key});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<Transaksi> transaksiList = [];
  double totalPemasukan = 0;
  double totalPengeluaran = 0;
  double saldo = 0;

  @override
  void initState() {
    super.initState();
    _loadReportData();
  }

  Future<void> _loadReportData() async {
    final allTransaksi = await DbHelper.getAllTransaksi();

    double pemasukan = 0;
    double pengeluaran = 0;

    for (var transaksi in allTransaksi) {
      if (transaksi.jenis == 'Pemasukan') {
        pemasukan += transaksi.jumlah;
      } else {
        pengeluaran += transaksi.jumlah;
      }
    }

    setState(() {
      transaksiList = allTransaksi;
      totalPemasukan = pemasukan;
      totalPengeluaran = pengeluaran;
      saldo = pemasukan - pengeluaran;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporan Keuangan',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _loadReportData),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Saldo
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Saldo Saat Ini',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formatCurrency(saldo),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: saldo >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Card Pemasukan dan Pengeluaran
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Pemasukan',
                          style: TextStyle(
                            color: Colors.green[800],
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          formatCurrency(totalPemasukan),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Pengeluaran',
                          style: TextStyle(
                            color: Colors.red[800],
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          formatCurrency(totalPengeluaran),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Header Daftar Transaksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Transaksi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                if (transaksiList.isNotEmpty)
                  Text(
                    '${transaksiList.length} Transaksi',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
              ],
            ),

            SizedBox(height: 12),
            Divider(height: 1, thickness: 1),
            SizedBox(height: 12),

            // Daftar Transaksi
            Expanded(
              child: transaksiList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Belum ada transaksi',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tekan tombol + untuk menambah transaksi',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemCount: transaksiList.length,
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final transaksi = transaksiList[index];
                        return _buildTransactionItem(transaksi);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahKeuangan()),
          );
          // Refresh data setelah kembali dari tambah transaksi
          _loadReportData();
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTransactionItem(Transaksi transaksi) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: transaksi.jenis == 'Pemasukan'
                ? Colors.green.withOpacity(0.2)
                : Colors.red.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            transaksi.jenis == 'Pemasukan'
                ? Icons.arrow_downward
                : Icons.arrow_upward,
            color: transaksi.jenis == 'Pemasukan' ? Colors.green : Colors.red,
            size: 20,
          ),
        ),
        title: Text(
          transaksi.deskripsi.isNotEmpty
              ? transaksi.deskripsi
              : transaksi.kategori,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${transaksi.tanggal.day}/${transaksi.tanggal.month}/${transaksi.tanggal.year}',
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              formatCurrency(transaksi.jumlah),
              style: TextStyle(
                color: transaksi.jenis == 'Pemasukan'
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 2),
            Text(
              transaksi.jenis,
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
          ],
        ),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditTransaksi(transaksi: transaksi),
            ),
          );
          // Refresh data setelah kembali dari edit transaksi
          _loadReportData();
        },
      ),
    );
  }
}
