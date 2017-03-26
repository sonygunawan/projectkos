using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LihatKos.Common.Enum
{
    public class Enum
    {
        
    }
    public enum NavigationName : int
    {
        First = -1,
        Last = -2,
        Next = -3,
        Prev = -4,
        Ordinary = 0
    }
    public enum Phone : int
    {
        Ponsel = 1,
        Rumah = 2, 
        Kantor = 3
    }
}
