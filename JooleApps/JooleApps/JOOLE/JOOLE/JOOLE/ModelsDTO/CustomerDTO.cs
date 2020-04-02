using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace JOOLE.ModelsDTO
{
    public class CustomerDTO
    {
        [Required]
        public string USERNAME { get; set; }

        [Required]
        public string PASSWORD { get; set; }

        [Required]
        [Compare("PASSWORD", ErrorMessage = "Passwords MUST Match.")]
        public string ConfirmPassword { get; set; }

        [Required]
        public string FULLNAME { get; set; }
        public string PICTURE { get; set; }

        public HttpPostedFileBase ImageFile { get; set; }
    }
}