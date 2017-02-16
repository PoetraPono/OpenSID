<script>
$(function(){
var nik = {};
nik.results = [
<?php foreach($penduduk as $data){?>
{id:'<?php echo $data['id']?>',name:"<?php echo $data['nik']." - ".($data['nama'])?>",info:"<?php echo ($data['alamat'])?>"},
<?php }?>
];

$('#nik').flexbox(nik, {
resultTemplate: '<div><label>No nik : </label>{name}</div><div>{info}</div>',
watermark: <?php if($individu){?>'<?php echo $individu['nik']?> - <?php echo spaceunpenetration($individu['nama'])?>'<?php }else{?>'Ketik no nik di sini..'<?php }?>,
width: 260,
noResultsText :'Tidak ada no nik yang sesuai..',
onSelect: function() {
$('#'+'main').submit();
}
});

});
</script>


<style>
table.form.detail th{
padding:5px;
background:#fafafa;
border-right:1px solid #eee;
}
table.form.detail td{
padding:5px;
}
</style>
<div id="pageC">
<table class="inner">
<tr style="vertical-align:top">

<td style="background:#fff;padding:5px;">
<div class="content-header">

</div>
<div id="contentpane">
<div class="ui-layout-north panel">
<h3>Surat Izin Istri/ Suami</h3>
</div>
<div class="ui-layout-center" id="maincontent" style="padding: 5px;">
<table class="form">
<tr>
<th>NIK / Nama</th>
<td>
<form action="" id="main" name="main" method="POST">
<div id="nik" name="nik"></div>
</form>
</tr>

<form id="validasi" action="<?php echo $form_action?>" method="POST" target="_blank">
<input type="hidden" name="nik" value="<?php echo $individu['id']?>">
<?php if($individu){ //bagian info setelah terpilih?>
  <?php include("donjo-app/views/surat/form/konfirmasi_pemohon.php"); ?>
<?php }?>
<tr>
<th>Nomor Surat</th>
<td>
<input name="nomor" type="text" class="inputbox required" size="12"/>
</td>
</tr>
<tr>
<th>Status Dalam Keluarga</th>
<td>
<input name="status" type="text" class="inputbox required" size="30"/>
</td>
</tr>
<tr>
	<td>DATA YANG AKAN DIBERI IZIN : </td>
</tr>
<tr>
<th>Nama Lengkap</th>
<td>
<input name="nama" type="text" class="inputbox required" size="30"/>
</td>
</tr>
<tr>
<th>Tempat Tanggal Lahir</th>
<td>
<input name="tempatlahir" type="text" class="inputbox required" size="30"/>
<input name="tanggallahir" type="text" class="inputbox required datepicker" size="20"/>
</td>
</tr><tr>
<th>Warganegara</th>
<td>
<input name="wn" type="text" class="inputbox required" size="15"/>
</td>
</tr><tr>
<th>Agama</th>
<td>
<input name="agama" type="text" class="inputbox required" size="15"/>
</td>
</tr><tr>
<th>Pekerjaan</th>
<td>
<input name="pekerjaan" type="text" class="inputbox required" size="15"/>
</td>
</tr><tr>
<th>Tempat Tinggal</th>
<td>
<input name="alamat" type="text" class="inputbox required" size="40"/>
</td>
</tr>
<tr>
<th>Status Dalam Keluarga</th>
<td>
<input name="status_anak" type="text" class="inputbox required" size="30"/>
</td>
</tr>
<tr>
<th>Status Pekerjaan/ TKI/ TKW</th>
<td>
<input name="pekerja" type="text" class="inputbox required" size="30"/>
</td>
</tr>
<tr>
<th>Negara Tujuan</th>
<td>
<input name="negara_tujuan" type="text" class="inputbox required" size="30"/>
</td>
</tr>
<tr>
<th>Nama PPTKIS</th>
<td>
<input name="nama_pptkis" type="text" class="inputbox required" size="30"/>
</td>
</tr>
<tr>
<th>Alamat PPTKIS</th>
<td>
<input name="alamat_pptkis" type="text" class="inputbox required" size="50"/>
</td>
</tr>
<tr>
<th>Staf Pemerintah Desa</th>
<td>
<select name="pamong"  class="inputbox required">
<option value="">Pilih Staf Pemerintah Desa</option>

<?php foreach($pamong AS $data){?>
<option value="<?php echo $data['pamong_nama']?>"><font style="bold"><?php echo unpenetration($data['pamong_nama'])?></font> (<?php echo unpenetration($data['jabatan'])?>)</option>
<?php }?>
</select>
</td>
</tr>
</tr>
<th>N I P</th>
<td>
<select name="pamong_nip"  class="inputbox required">
<option value="">Pilih No NIP</option>
<?php foreach($pamong AS $data){?>
<option ><?php echo unpenetration($data['pamong_nip'])?></option>
<?php }?>
</select>
<tr>
<th>Sebagai</th>
<td>
<select name="jabatan"  class="inputbox required">
<option value="">Pilih Jabatan</option>

<?php foreach($pamong AS $data){?>
<option ><?php echo unpenetration($data['jabatan'])?></option>
<?php }?>
</select>
</td>
</tr>
</table>
</div>

<div class="ui-layout-south panel bottom">
<div class="left">
<a href="<?php echo site_url()?>surat" class="uibutton icon prev">Kembali</a>
</div>
<div class="right">
<div class="uibutton-group">
<button class="uibutton" type="reset">Clear</button>

							<button type="button" onclick="$('#'+'validasi').attr('action','<?php echo $form_action?>');$('#'+'validasi').submit();" class="uibutton special"><span class="ui-icon ui-icon-print">&nbsp;</span>Cetak</button>
							<?php if (SuratExport($url)) { ?><button type="button" onclick="$('#'+'validasi').attr('action','<?php echo $form_action2?>');$('#'+'validasi').submit();" class="uibutton confirm"><span class="ui-icon ui-icon-document">&nbsp;</span>Export Doc</button><?php } ?>
</div>
</div>
</div> </form>
</div>
</td></tr></table>
</div>
