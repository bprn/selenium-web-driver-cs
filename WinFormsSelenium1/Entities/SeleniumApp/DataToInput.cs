using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace WinFormsSelenium1.Entities.SeleniumApp;

[Table("DataToInput")]
public partial class DataToInput
{
    [Key]
    [StringLength(50)]
    [Unicode(false)]
    public string CIFNo { get; set; } = null!;

    [StringLength(200)]
    [Unicode(false)]
    public string? Nama { get; set; }

    [StringLength(10)]
    [Unicode(false)]
    public string? FlagBadanUsaha { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? NPWP { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? NoKTP { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? JenisKelamin { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? NoAkta { get; set; }

    [StringLength(250)]
    [Unicode(false)]
    public string? Alamat { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? NoTelepon { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string? Email { get; set; }
}
