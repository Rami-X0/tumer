import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/core/di/dependency_injection.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_cached_network_image.dart';
import 'package:tumer_detection/core/widgets/app_dialog.dart';
import 'package:tumer_detection/core/widgets/app_scaffold.dart';
import 'package:tumer_detection/core/widgets/app_text_form_field.dart';
import 'package:tumer_detection/features/home/cubit/home_cubit.dart';
import 'package:tumer_detection/features/home/cubit/home_state.dart';

class GetAllMessageDoctorsScreen extends StatefulWidget {
  final String name;
  final String receiverId;

  const GetAllMessageDoctorsScreen({super.key, required this.name, required this.receiverId});

  @override
  State<GetAllMessageDoctorsScreen> createState() => _GetAllMessageDoctorsScreenState();
}

final ValueNotifier<File?> _imageNotifier = ValueNotifier<File?>(null);

class _GetAllMessageDoctorsScreenState extends State<GetAllMessageDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    print('buildddd1');
    return BlocProvider.value(
      value: getIt<DoctorsCubit>()..getAllMessages(widget.receiverId),
      child: AppScaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          centerTitle: true,
          shadowColor: Colors.black,
          title: Text(
            '${role == 'Doctor' ? 'Pa:' : 'Dr:'}${widget.name}',
            style: TextStyle(color: AppColors.defaultColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SafeArea(
                  minimum: EdgeInsets.symmetric(vertical: 5.h),
                  child: BlocBuilder<DoctorsCubit, DoctorsState>(
                    buildWhen: (previous, current) =>
                        current is GetAllMessagesLoadingState ||
                        current is GetAllMessagesSuccessState ||
                        current is GetAllMessagesFailureState,
                    builder: (context, state) {
                      if (state is GetAllMessagesLoadingState) {
                        return SizedBox(
                          height: 655.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (state is GetAllMessagesSuccessState) {
                        final messages =
                            state.messages; // List<GetMessageModel>
                        final hasMessages = messages.messages.isNotEmpty;

                        return hasMessages
                            ? SizedBox(
                                height: 655.h,
                                child: ListView.builder(
                                  itemCount: messages.messages.length,
                                  itemBuilder: (context, index) {
                                    final message = messages.messages[index];

                                    final formattedTime =
                                        DateFormat('hh:mm a').format(
                                      DateTime.parse(message.timestamp),
                                    );

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      child: Align(
                                        alignment: message.senderId == userId
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                        child: Container(
                                          padding: const EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            color: message.senderId == userId
                                                ? Colors.grey[100]
                                                : Colors.blue[200],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              message.imageUrl == 'image'
                                                  ? Text(
                                                      message.message,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                  : AppCachedNetworkImage(
                                                      imageUrl: message.imageUrl
                                                          .toString()),
                                              const SizedBox(height: 8.0),
                                              Text(
                                                formattedTime,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(
                                height: 655.h,
                                child: const Center(
                                  child: Text('No messages available'),
                                ),
                              );
                      }

                      if (state is GetAllMessagesFailureState) {
                        return Center(
                          child: Text(
                            state.failure.message.toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      return const Center(
                        child: Text('Unexpected state'),
                      );
                    },
                  ),
                ),
                _sendMessageForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sendMessageForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Form(
        child: AppTextFormField(
          hintText: 'Write your message',
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder(
                    valueListenable: _imageNotifier,
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          chooseImage().then((onValue) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return _sendImage();
                                });
                          });
                        },
                        child: Icon(Icons.image, color: Colors.grey),
                      );
                    }),
                SizedBox(width: 15.w),
                GestureDetector(
                  onTap: () {
                    getIt<DoctorsCubit>().sendMessages(widget.receiverId);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.solidPaperPlane,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your message';
            }
            return null;
          },
          controller: DoctorsCubit.messageControllerText,
        ),
      ),
    );
  }

  Widget _sendImage() {
    return BlocProvider.value(
      value: getIt<DoctorsCubit>(),
      child: Stack(
        children: [
          AppDialog(
            child: Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: FileImage(
                    File(_imageNotifier.value!.path),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 445.h,
            left: 270.w,
            child: GestureDetector(
              onTap: () {
                getIt<DoctorsCubit>()
                    .sendImageChat(_imageNotifier.value!,widget.receiverId)
                    .then((value) {
                  Navigator.pop(context);
                });
              },
              child: CircleAvatar(
                child: FaIcon(
                  FontAwesomeIcons.solidPaperPlane,
                  color: Colors.grey,
                  size: 18.w,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future chooseImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    _imageNotifier.value = File(image!.path);
    print(_imageNotifier.value);
  }
}
