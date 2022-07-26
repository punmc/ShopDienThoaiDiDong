using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Encryption
{
    public static class Encryption
    {
        /// <summary>
        /// mã hóa 1 chiều 
        /// </summary>
        /// param chuỗi cần mã hóa 
        /// <returns> chuỗi đã được mã hóa</returns>
        public static string Encryption1(string _input)
        {
            //1. mã hóa MD5 
            using (MD5 md5Hash = MD5.Create())
            {
                string hash = MD5Hash( _input);
                return MyEncryption(hash);
            }
            //2.mã hóa 2 chiều
        }
        /// <summary>
        /// mã hóa 2 chiều 
        /// </summary>
        /// <param name="_input">chuỗi cần được mã hóa </param>
        /// <returns>chuỗi đã được mã hóa</returns>
        public static string MyEncryption(string _input)
        {
            //chuỗi abc => 48 49 50: 48+0+(49%2);49+1+50%2
            //chuyển thành mảng char 
            char[] char_input = _input.ToCharArray();
             // chuyển val ind thành ano.type 
           var input_WithIndex= char_input.Select((val, ind) => new { val, ind }).ToArray();
            //áp dụng công thức 
           var char_input_encripted = input_WithIndex.Select(c => c.val + c.ind + (input_WithIndex.Length > c.ind + 1 ? input_WithIndex[c.ind + 1].val % 2 : 0)).Select(c=>(char)c).ToArray();
           //chuyển về kiểu string 
            string resval = new string(char_input_encripted);
            return resval;
        }
        public static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }
        
    }
}
