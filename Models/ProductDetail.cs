//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PRN292_Assignment.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductDetail
    {
        public int productDetailID { get; set; }
        public Nullable<int> productID { get; set; }
        public string origin { get; set; }
        public string ingredients { get; set; }
        public int netWeight { get; set; }
        public string description { get; set; }
        public string imageLink { get; set; }
    
        public virtual Product Product { get; set; }
    }
}