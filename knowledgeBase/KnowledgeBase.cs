//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace knowledgeBase
{
    using System;
    using System.Collections.Generic;
    
    public partial class KnowledgeBase
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KnowledgeBase()
        {
            this.LikeNumber = 0;
            this.LikeUsers = new HashSet<User>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public int LikeNumber { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<User> LikeUsers { get; set; }
        public virtual User User { get; set; }
        public virtual KnowledgeType KnowledgeType { get; set; }
    }
}
