part of lib_hmpage;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);
  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<Product> products = [];
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    //fetch data from API
    getData();
  }

  getData() async {
    products = (await ProductsService().getAllProducts()) ?? [];
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,

      /// A widget that is used to scroll the content of the body.
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(Margin.defaultPadding),

        /// A widget that displays its children in a vertical array.
        child: Visibility(
          visible: isLoaded,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Primas Sport",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const Text(
                "The best Fitness Shop for you",
                style: TextStyle(fontSize: 18),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: Margin.defaultPadding),
                child: SearchForm(),
              ),
              const Categories(),
              // const NewArrivalProducts(products: products,),
              // const PopularProducts(products: products,),
              NewArrivalProducts(
                products: products,
              ),
              PopularProducts(
                products: products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
