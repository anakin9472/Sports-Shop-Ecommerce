using System;
using System.Collections.Generic;

namespace Ecommerce.Models
{
    public partial class Product
    {
        public int ProductId { get; set; }
        public string? Title { get; set; }
        public string? Price { get; set; }
        public string? Image { get; set; }
    }
}
