using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web;

namespace LihatKos.Web.Controls
{
    public class ValidationError : IValidator
    {
        private bool _IsValid;
        private string _ErrorMessage;

        private ValidationError(string message)
        {
            _ErrorMessage = message;
            _IsValid = false;
        }

        public string ErrorMessage
        {
            get { return _ErrorMessage; }
            set { _ErrorMessage = value; }
        }

        public bool IsValid
        {
            get { return _IsValid; }
            set { _IsValid = value; }
        }

        public void Validate()
        {
            // no action required
        }

        public static void Display(string message)
        {
            Page currentPage = (Page)HttpContext.Current.Handler;
            currentPage.Validators.Add(new ValidationError(message));
        }
    }
}
