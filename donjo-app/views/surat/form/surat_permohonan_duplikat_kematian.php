<script>
	$(function(){
		var nik = {};
		nik.results = [
			<?php  foreach($penduduk as $data){?>
				{id:'<?php echo $data['id']?>',name:"<?php echo $data['nik']." - ".($data['nama'])?>",info:"<?php echo ($data['alamat'])?>"},
			<?php  }?>
		];
		var nik_ibu = {};
		nik_ibu.results = [
			<?php  foreach($penduduk as $data){?>
				{id:'<?php echo $data['id']?>',name:"<?php echo $data['nik']." - ".($data['nama'])?>",info:"<?php echo ($data['alamat'])?>"},
			<?php  }?>
		];
		$('#nik').flexbox(nik, {
			resultTemplate: '<div><label>No nik : </label>{name}</div><div>{info}</div>',
			watermark: <?php if($individu){?>'<?php echo $individu['nik']?> - <?php echo ($individu['nama'])?>'<?php }else{?>'Ketik no nik di sini..'<?php }?>,
			width: 260,
			noResultsText :'Tidak ada no nik yang sesuai..',
			onSelect: function() {
				//$('#'+'main').submit();
		} 
		});
		$('#nik_ibu').flexbox(nik_ibu, {
			resultTemplate: '<div><label>No nik : </label>{name}</div><div>{info}</div>',
			watermark: <?php if($ibu){?>'<?php echo $ibu['nik']?> - <?php echo ($ibu['nama'])?>'<?php }else{?>'Ketik no nik di sini..'<?php }?>,
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
	<td style="background:#fff;"> 
		<div id="contentpane">
			<div class="ui-layout-center" id="maincontent" style="padding: 5px;">
				<h3>Formulir Layanan : Surat Keterangan Kematian</h3>
				<form action="" id="main" name="main" method="POST" class="formular">
				<div id="form-cari-pemohon">
					<table class="form">
						<tr>
							<td width="200">NIK / Nama Pelapor</td>
							<td>
								<div id="nik" name="nik"></div>
							</td>
						</tr>
						<?php if($individu){
							?>
							<tr>
								<th width="200">Tempat Tanggal Lahir (Umur)</th>
								<td>
									<?php echo $individu['tempatlahir']?> <?php echo tgl_indo($individu['tanggallahir'])?> (<?php echo $individu['umur']?> Tahun)
								</td>
							</tr>
							<tr>
								<th>Alamat</th>
								<td><?php echo unpenetration($individu['alamat']); ?></td>
							</tr>
							<tr>
								<th>Pendidikan</th>
								<td><?php echo $individu['pendidikan']; ?></td>
							</tr>
							<tr>
								<th>Warganegara / Agama</th>
								<td><?php echo $individu['warganegara']?> / <?php echo $individu['agama']?></td>
							</tr>
						<?php }?>
						<tr>
							<td width="200">NIK / Nama Almarhum/ah</td>
							<td>
								<div id="nik_ibu" name="nik_ibu"></div>
							</td>
						</tr>
						<?php if($ibu){
							?>
							<tr>
								<th width="200">Tempat Tanggal Lahir (Umur)</th>
								<td>
									<?php echo $ibu['tempatlahir']?> <?php echo tgl_indo($ibu['tanggallahir'])?> (<?php echo $ibu['umur']?> Tahun)
								</td>
							</tr>
							<tr>
								<th>Alamat</th>
								<td><?php echo unpenetration($ibu['alamat']); ?></td>
							</tr>
							<tr>
								<th>Pendidikan</th>
								<td><?php echo $ibu['pendidikan']; ?></td>
							</tr>
							<tr>
								<th>Warganegara / Agama</th>
								<td><?php echo $ibu['warganegara']?> / <?php echo $ibu['agama']?></td>
							</tr>
						<?php 
						}
						?>

					</table>
				</div>
				</form>
				</br>
				
				<div id="form-melengkapi-data-permohonan">
					<form id="validasi" action="" method="POST" target="_blank">
					
					<input type="hidden" name="nik" value="<?php echo $_SESSION['nik'];?>">
					<input type="hidden" name="nik_ibu" value="<?php echo $_SESSION['nik_ibu'];?>">
					
					<table class="form">
<tr>
<th>Nomor Surat</th>
<td>
<input name="nomor" type="text" class="inputbox required" size="20"/>
</td>
</tr>
<tr> <th></th></tr>
<tr>
 <th>Data Kejadian :</th>
 <td>
 </td>
</tr>
<tr>
 <th>Hari/Tanggal/Jam</th>
 <td><input name="hari_mati" type="text" class="inputbox required " size="10"/>, <input name="tgl_mati" type="text" class="inputbox required datepicker" size="15"/> : <input name="jam_mati" type="text" class="inputbox required " size="10"/></td>
</tr>
<tr>
 <th>Bertempat di</th>
 <td><input name="tpt_mati" type="text" class="inputbox required" size="40"/></td>
</tr>
<tr>
 <th>Penyebab</th>
 <td><input name="sebab_mati" type="text" class="inputbox required" size="50"/></td>
</tr>
<tr> <th></th></tr>
<tr>
 <th>Hubungan Pelapor</th>
 <td>
  <select name="hub_lapor" class="inputbox required">
   <option value="">- Pilih Hubungan -</option>
   <option value="Ayah">Ayah</option>
   <option value="Ibu">Ibu</option>
   <option value="Kakak">Kakak</option>
   <option value="Kakek">Kakek</option>
   <option value="Nenek">Nenek</option>
   <option value="Anak">Anak</option>
   <option value="Saudara">Saudara</option>
   <option value="Lainnya">Lainnya</option>
  </select>
 </td>
</tr>
<tr>
<th>Staf Pemerintah Desa</th>
<td>
<select name="pamong" class="inputbox required">
<option value="">Pilih Staf Pemerintah Desa</option>
<?php foreach($pamong AS $data){?>
<option value="<?php echo $data['pamong_nama']?>"><font style="bold"><?php echo unpenetration($data['pamong_nama'])?></font> (<?php echo unpenetration($data['jabatan'])?>)</option>
<?php }?>
</select>
</td>
</tr>
<tr>
<th>Sebagai</th>
<td>
<select name="jabatan" class="inputbox required">
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
							<!--<button type="button" onclick="$('#'+'validasi').attr('action','<?php echo $form_action?>');$('#'+'validasi').submit();" class="uibutton special"><span class="ui-icon ui-icon-print">&nbsp;</span>Cetak</button>-->
							<?php if (file_exists("surat/$url/$url.rtf")) { ?><button type="button" onclick="$('#'+'validasi').attr('action','<?php echo $form_action2?>');$('#'+'validasi').submit();" class="uibutton confirm"><span class="ui-icon ui-icon-document">&nbsp;</span>Export Doc</button><?php } ?>
</div>
</div>
</div> </form>
</div>
</td></tr></table>
</div>