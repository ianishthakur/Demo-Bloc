import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_bloc/bloc/video_cubit.dart';
import 'package:test_bloc/bloc/video_state.dart';
import 'package:test_bloc/screen/stream_screen.dart';
import 'package:test_bloc/utils/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VideoCubit>().fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.health_and_safety,
              size: 28,
              color: Colors.white,
            ),
            Text("Hello My Friend"),
            Icon(
              Icons.health_and_safety,
              size: 28,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.purple[900],
        elevation: 0,
      ),
      body: BlocConsumer<VideoCubit, VideoState>(
        listener: (context, state) {
          if (state is VideoFetchError) {
            Fluttertoast.showToast(
                msg: "An error occured.",
                toastLength: Toast.LENGTH_LONG,
                textColor: Colors.white);
          }
        },
        // bloc: videoCubit,
        builder: (context, state) {
          if (state is VideoFetchError) {
            return Text(state.errorMessage);
          }
          if (state is VideoFetchSucess) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final image = state.data[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const StreamScreen()));
                      },
                      child: FadeInImage(
                        image: NetworkImage(image["largeImageURL"]),
                        placeholder: const AssetImage(Assets.placeholder),
                      ));
                });
          }
          if (state is VideoLoading || state is VideoInitState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Text("Unknown State");
        },
      ),
    ));
  }
}
