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
    
    public partial class Cart
    {
        public int cartID { get; set; }
        public string username { get; set; }
        public int productID { get; set; }
        public int quantity { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual Product Product { get; set; }
    }
}
