using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;

namespace LihatKos.DataAccess
{
    public class DataAccessConnection
    {
        private Database db;

        public Database CreateDatabase()
        {
            try
            {
                return DatabaseFactory.CreateDatabase("conStr");
            }
            catch (Exception ex)
            {
                throw new DataAccessException(this.ToString() + "\n" + MethodBase.GetCurrentMethod() + "\n" + ex.Message, ex);
            }
        }

        public DbCommand GetStoredProcCommand(Database db, string storedProcedureName)
        {
            DbCommand dbCommand = db.GetStoredProcCommand(storedProcedureName);
            dbCommand.CommandTimeout = 72000;

            return dbCommand;
        }
    }
}
