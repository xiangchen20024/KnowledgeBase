using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace knowledgeBase.DataContract
{
    public class KnowledgeBaseContract
    {

        public int Id { get; set; }
        public string Type { get; set; }

        public KnowledgeBaseContract(KnowledgeType knowledgeType)
        {
            Id = knowledgeType.Id;
            Type = knowledgeType.Type;
        }

    }
}