using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace knowledgeBase.DataContract
{
    public class KnowledgeTypeContract
    {

        public int Id { get; set; }
        public string Type { get; set; }

        public KnowledgeTypeContract(KnowledgeType knowledgeType)
        {
            Id = knowledgeType.Id;
            Type = knowledgeType.Type;
        }

    }
}