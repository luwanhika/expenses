import 'package:flutter/material.dart';

class TransacionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransacionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransacionForm> createState() => _TransacionFormState();
}

class _TransacionFormState extends State<TransacionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  const Text('Nenhuma data selecionada!'),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary),
                    onPressed: () {},
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: _submitForm,
                  child: const Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
