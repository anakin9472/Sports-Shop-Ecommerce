using System;
using System.Collections.Generic;

namespace Ecommerce.Models
{
    public partial class Product
    {
        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public string? ProductPrice { get; set; }
        public string? ProductImage { get; set; }
    }
}
