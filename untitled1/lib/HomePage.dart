import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/design.dart';
import 'package:untitled1/expenseModel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Bütçe Takibi',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer<BudgetModel>(builder: (context, budgetModel, child) {
              return Row(
                children: [
                  DesingPage(type: 'Bakiye', amount: budgetModel.totalMoney),
                  SizedBox(width: 10),
                  DesingPage(type: 'Gelir', amount: budgetModel.gelir),
                  SizedBox(width: 10),
                  DesingPage(type: 'Gider', amount: budgetModel.gider),
                ],
              );
            }),
            const SizedBox(height: 20),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                labelText: 'Tür Giriniz (Örneğin: Market)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Miktar Giriniz',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int? amount = int.tryParse(amountController.text);
                    if (amount != null) {
                      context.read<BudgetModel>().addGelir(amount);
                      amountController.clear();
                      typeController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Lütfen geçerli bir miktar girin.')),
                      );
                    }
                  },
                  child: const Text('Gelir'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int? amount = int.tryParse(amountController.text);
                    if (amount != null) {
                      context.read<BudgetModel>().addGider(amount);
                      amountController.clear();
                      typeController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Lütfen geçerli bir miktar girin.')),
                      );
                    }
                  },
                  child: const Text('Gider'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Consumer<BudgetModel>(builder: (context, budgetModelValue, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: budgetModelValue.showPage.length,
                  itemBuilder: (context, index) {
                    final transaction = budgetModelValue.showPage[index];
                    return ListTile(
                      title: Text('${transaction['type']} - ${transaction['amount']}'),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
