using Microsoft.ApplicationBlocks.ExceptionManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.DataAccess
{
    public class DataAccessException : BaseApplicationException
    {
        public DataAccessException()
            : base()
        {
        }

        public DataAccessException(string message)
            : base(message)
        {
        }

        public DataAccessException(string message, Exception innerException)
            : base(message, innerException)
        {
        }
    }
}
