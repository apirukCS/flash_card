import 'package:flash_card/presentation/pages/space_x/capsule/bloc/capsule_bloc.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CapsulePage extends StatefulWidget {
  const CapsulePage({super.key});

  @override
  State<CapsulePage> createState() => _CapsulePageState();
}

class _CapsulePageState extends State<CapsulePage> {
  @override
  void initState() {
    context.read<CapsuleBloc>().add(GetAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Capsule Space X Module")),
      body: BlocBuilder<CapsuleBloc, CapsuleState>(
        builder: (context, state) {
          var capsules = state.capsules;
          return Stack(
            children: [
              Visibility(
                visible: state.status == CapsuleStatus.loading,
                child: CircularProgressIndicator(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: capsules.length,
                  itemBuilder: (context, index) {
                    var capsule = capsules[index];
                    var text = "Id: ${capsule.id}, Serial: ${capsule.serial}";
                    return AppText(text: text);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
