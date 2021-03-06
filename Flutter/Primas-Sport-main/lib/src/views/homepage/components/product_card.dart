part of lib_hmpage;

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String image, title, price;
  final VoidCallback press;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(Margin.defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(Margin.defaultBorderRadius)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(Margin.defaultBorderRadius)),
              ),
              child: Image.network(
                image,
                height: 132,
              ),
            ),
            const SizedBox(height: Margin.defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: Margin.defaultPadding / 4),
                Text(
                  "\$$price",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
