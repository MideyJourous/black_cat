import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/user/widget/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/user/widget/profile_info.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;
  final String tab;
  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: widget.tab == "likes" ? 1 : 0,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(widget.username),
                actions: [
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: FaIcon(FontAwesomeIcons.gear, size: Sizes.size20),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 50,
                      foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/197362842?v=4",
                      ),
                      child: Text("MJ"),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "@${widget.username}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size20,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.lightBlue,
                          size: Sizes.size16,
                        ),
                      ],
                    ),
                    Gaps.v20,
                    SizedBox(
                      height: Sizes.size52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileInfo(numberText: "21", infoText: "Following"),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: 1,
                            color: Colors.grey.shade300,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                          ),
                          ProfileInfo(
                            numberText: "10.5M",
                            infoText: "Followers",
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: 1,
                            color: Colors.grey.shade300,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                          ),
                          ProfileInfo(numberText: "149.3M", infoText: "Likes"),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.3,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Sizes.size12,
                          horizontal: Sizes.size8,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Sizes.size4),
                          ),
                        ),
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Gaps.v14,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        "All highlights and where to watch live matches on FIFA+ and these texts are too long to read",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.link, size: Sizes.size14),
                        Gaps.h5,
                        Text(
                          "https://www.fifa.com/en/home",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 13,
                ),
                itemBuilder:
                    (context, index) => Column(
                      children: [
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 9 / 13,
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholderFit: BoxFit.cover,
                                placeholder: "asset/images/image.jpg",
                                image:
                                    "https://images.unsplash.com/photo-1740188305229-63c68ef04712?q=80&w=2912&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              ),
                            ),
                            Positioned(
                              left: Sizes.size8,
                              top: Sizes.size8,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size3,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Sizes.size2,
                                    horizontal: Sizes.size4,
                                  ),
                                  child: Text(
                                    'Pinned',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.play,
                                    color: Colors.white,
                                    size: Sizes.size14,
                                  ),
                                  Gaps.h2,
                                  Text(
                                    "4.1M",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
              ),
              Center(child: Text("Page two")),
            ],
          ),
        ),
      ),
    );
  }
}
