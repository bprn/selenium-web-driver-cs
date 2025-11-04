using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace WinFormsSelenium1.Entities.SeleniumApp;

[Table("SeleniumLog")]
public partial class SeleniumLog
{
    [Key]
    public Guid Id { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? RegNo { get; set; }

    public int? Sequence { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? Step { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? Status { get; set; }

    [Unicode(false)]
    public string? Message { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? LogDate { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? RunAsUser { get; set; }
}
