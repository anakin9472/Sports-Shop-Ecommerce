part of lib_registration;

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  // final _formKey = GlobalKey<FormBuilderState>();

  final myTextController = TextEditingController();

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  late String fullName, email, phone, pass;

  List<String> items = ['Vietnam(VIE)', 'United States(USA)', 'Thailand(THA)'];
  String? selectedItem = 'United States(USA)';
  String region = "United States(USA)";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.h),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Primas',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: 'Sport',
                        style: TextStyle(
                            letterSpacing: 1.2,
                            //color: Theme.of(context).primaryColor,
                            fontSize: 38.sp,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              // const FormBuilder(
              //   label: 'FULL NAME',
              //   hintText: 'example: Lý Thái Linh',
              // ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'FULL NAME',
                  hintText: 'example: Lý Thái Linh',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    fullName = text;
                  });
                },
              ),
              SizedBox(height: 20.h),
              // const FormBuilder(
              //   label: 'EMAIL',
              //   hintText: 'example: abcd@gmail.com',
              // ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'EMAIL',
                  hintText: 'example: abcd@gmail.com',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                },
              ),

              SizedBox(height: 20.h),
              // const FormBuilder(
              //   label: 'PHONE NUMBER',
              //   hintText: 'example: +840123456789',
              // ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PHONE NUMBER',
                  hintText: 'example: +840123456789',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    phone = text;
                  });
                },
              ),

              SizedBox(height: 20.h),
              // const FormBuilder(
              //   label: 'PASSWORD',
              //   hintText: '*******',
              // ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PASSWORD',
                  hintText: '*******',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    pass = text;
                  });
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Text(
                  "REGION",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButton<String>(
                  value: selectedItem,
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                          value: item, child: Text(item)))
                      .toList(),
                  onChanged: (item) => setState(() {
                    selectedItem = item;
                    region = item!;
                  }),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Already got an account?',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                          TextSpan(
                            text: ' Login now',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () => navigator(context, const LoginScreen())),
              SizedBox(height: 50.h),
              Center(
                child: PrimaryButton(
                    label: 'Register now',
                    onTap: () async {
                      String res = "";
                      Account account = Account.fromAccount(
                          fullName: fullName,
                          email: email,
                          phone: phone,
                          region: region,
                          pass: pass);
                      Map accountData = account.toJsonNonId();
                      var result = await AccountsService()
                          .addAccount(accountData)
                          ?.then((response) {
                        res = response;
                      });

                      // Map<String, dynamic> userMap = jsonDecode(jsonString);
                      // var user = User.fromJson(userMap);
                      // var data = [fullName, email, phone, region, pass];
                      // String accountData = jsonEncode(data);
                      // const snackBar =
                      //     SnackBar(content: Text('Button has been clicked'));
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Add register" + res),
                            );
                          });
                    }),
              ),
              SizedBox(height: 17.h),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Theme.of(context).primaryColor)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 45.w),
                    child: Text(
                      'Register with Google',
                      style: TextStyle(
                        fontSize: 18.sp,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
