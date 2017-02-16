CREATE TABLE `analisis_indikator` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_master` int(11) NOT NULL,
`nomor` int(3) NOT NULL,
`pertanyaan` varchar(400) NOT NULL,
`id_tipe` tinyint(4) NOT NULL DEFAULT '1',
`bobot` tinyint(4) NOT NULL DEFAULT '0',
`act_analisis` tinyint(1) NOT NULL DEFAULT '2',
`id_kategori` tinyint(4) NOT NULL,
`is_publik` tinyint(1) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`),
KEY `id_master` (`id_master`,`id_tipe`),
KEY `id_tipe` (`id_tipe`),
KEY `id_kategori` (`id_kategori`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_kategori_indikator` (
`id` tinyint(4) NOT NULL AUTO_INCREMENT,
`id_master` tinyint(4) NOT NULL,
`kategori_kode` varchar(3) NOT NULL,
`kategori` varchar(50) NOT NULL,
PRIMARY KEY (`id`),
KEY `id_master` (`id_master`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_klasifikasi` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_master` int(11) NOT NULL,
`nama` varchar(20) NOT NULL,
`minval` double(5,2) NOT NULL,
`maxval` double(5,2) NOT NULL,
PRIMARY KEY (`id`),
KEY `id_master` (`id_master`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_master` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(40) NOT NULL,
`subjek_tipe` tinyint(4) NOT NULL,
`lock` tinyint(1) NOT NULL DEFAULT '1',
`deskripsi` text NOT NULL,
`kode_analisis` varchar(5) NOT NULL DEFAULT '00000',
`id_child` smallint(4) NOT NULL,
`id_kelompok` int(11) NOT NULL,
`pembagi` varchar(10) NOT NULL DEFAULT '100',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_parameter` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_indikator` int(11) NOT NULL,
`kode_jawaban` int(3) NOT NULL,
`asign` tinyint(1) NOT NULL DEFAULT '0',
`jawaban` varchar(200) NOT NULL,
`nilai` tinyint(4) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`),
KEY `id_indikator` (`id_indikator`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_partisipasi` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_subjek` int(11) NOT NULL,
`id_master` int(11) NOT NULL,
`id_periode` int(11) NOT NULL,
`id_klassifikasi` int(11) NOT NULL DEFAULT '1',
PRIMARY KEY (`id`),
KEY `id_subjek` (`id_subjek`,`id_master`,`id_periode`,`id_klassifikasi`),
KEY `id_master` (`id_master`),
KEY `id_periode` (`id_periode`),
KEY `id_klassifikasi` (`id_klassifikasi`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_periode` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_master` int(11) NOT NULL,
`nama` varchar(50) NOT NULL,
`id_state` tinyint(4) NOT NULL DEFAULT '1',
`aktif` tinyint(1) NOT NULL DEFAULT '0',
`keterangan` varchar(100) NOT NULL,
`tahun_pelaksanaan` year(4) NOT NULL,
PRIMARY KEY (`id`),
KEY `id_master` (`id_master`),
KEY `id_state` (`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_ref_state` (
`id` tinyint(4) NOT NULL AUTO_INCREMENT,
`nama` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
INSERT INTO analisis_ref_state VALUES
("1","Belum Entri / Pendataan"),
("2","Sedang Dalam Pendataan"),
("3","Selesai Entri / Pendataan");
CREATE TABLE `analisis_ref_subjek` (
`id` tinyint(4) NOT NULL AUTO_INCREMENT,
`subjek` varchar(20) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO analisis_ref_subjek VALUES
("1","Penduduk"),
("2","Keluarga / KK"),
("3","Rumah Tangga"),
("4","Kelompok");
CREATE TABLE `analisis_respon` (
`id_indikator` int(11) NOT NULL,
`id_parameter` int(11) NOT NULL,
`id_subjek` int(11) NOT NULL,
`id_periode` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_respon_bukti` (
`id_master` tinyint(4) NOT NULL,
`id_periode` tinyint(4) NOT NULL,
`id_subjek` int(11) NOT NULL,
`pengesahan` varchar(100) NOT NULL,
`tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_respon_hasil` (
`id_master` tinyint(4) NOT NULL,
`id_periode` tinyint(4) NOT NULL,
`id_subjek` int(11) NOT NULL,
`akumulasi` double(8,3) NOT NULL,
`tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
UNIQUE KEY `id_master` (`id_master`,`id_periode`,`id_subjek`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `analisis_tipe_indikator` (
`id` tinyint(4) NOT NULL AUTO_INCREMENT,
`tipe` varchar(20) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO analisis_tipe_indikator VALUES
("1","Pilihan (Tunggal)"),
("2","Pilihan (Multivalue)"),
("3","Isian Angka"),
("4","Isian Tulisan");
CREATE TABLE `area` (
`id` int(4) NOT NULL AUTO_INCREMENT,
`nama` varchar(50) NOT NULL,
`path` text NOT NULL,
`enabled` int(11) NOT NULL DEFAULT '1',
`ref_polygon` int(9) NOT NULL,
`foto` varchar(100) NOT NULL,
`id_cluster` int(11) NOT NULL,
`desk` text NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `artikel` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`gambar` varchar(200) NOT NULL,
`isi` text NOT NULL,
`enabled` int(2) NOT NULL DEFAULT '1',
`tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`id_kategori` int(4) NOT NULL,
`id_user` int(4) NOT NULL,
`judul` varchar(100) NOT NULL,
`headline` int(1) NOT NULL DEFAULT '0',
`gambar1` varchar(200) NOT NULL,
`gambar2` varchar(200) NOT NULL,
`gambar3` varchar(200) NOT NULL,
`dokumen` varchar(400) NOT NULL,
`link_dokumen` varchar(200) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
INSERT INTO artikel VALUES
("7","sid.jpg","<p><strong>SID sebagai tanggapan atas kebutuhan:</strong><br /> Kalau dulu untuk mencari data penduduk menurut kelompok umur saja kesulitan karena tidak mempunyai databasenya. Dengan adanya SID menjadi lebih mudah.<br /> (Nuryanto, Kabag Pelayanan Pemdes Terong)<br /> <br /> Membangun sebuah sistem bukan hanya membuatkan software dan meninggalkan begitu saja, namun ada upaya untuk memadukan sistem dengan kebutuhan yang ada pada desa. sehingga software dapat memenuhi kebutuhan yang telah ada bukan memaksakan desa untuk mengikuti dan berpindah sistem. inilah yang melatari combine melaksanakan alur pengaplikasian software.<br /> 1. Bentuk tim kerja bersama pemerintah desa<br /> 2. Diskusikan basis data apa saja yang diperlukan untuk warga<br /> 3. Himpun data kependudukan warga dari Kartu Keluarga (KK)<br /> 4. Daftarkan proyek SID dan dapatkan aplikasi softwarenya di http://abcd.lumbungkomunitas.net<br /> 5. Install aplikasi software SID di komputer desa<br /> 6. Entry data penduduk ke SID<br /> 7. Basis data kependudukan sudah bisa dimanfaatkan<br /> 8. Diskusikan rencana pengembangan SID sesuai kebutuhan desa<br /> 9. Sebarluaskan informasi desa melalui beragam media untuk warga<br /> <br /> Pemberdayaan data desa yang dibangun diharapkan dapat menjunjung kesejahteraan masyarakat desa, data-data tersebut dapat diperuntukkan untuk riset lebih lanjut tentang kemiskinan, tanggap bencana, sumberdaya desa yang bisa diekspose keluar dan dengan menghubungkan dari desa ke desa dapat mencontohkan banyak hal dalam keberhasilan pemberdayaannya.<br /> (sumber: Buku Sistem Informasi Desa) <strong><br /></strong></p>","1","2013-03-30 22:31:04","999","1","Awal mula SID","1","","","","",""),
("8","sid.jpg","<h2 style=\"text-align: justify;\">Visi Pemerintah Desa Bumi Pertiwi</h2>\n<p><strong>Visi dan Misi</strong></p>\n<p><strong>1&nbsp; </strong><strong>Visi </strong></p>\n<p>Visi dalam hal ini adalah visi pemerintahan desa, yaitu visi Kepala Desa. Visi pemeritahan desa pada dasarnya merupakan gambaran masa depan yang akan diwujudkan oleh pemerintah desa dalam periode 2014 - 2019 fungsi visi pemerintah desa, terutama sebagai arah bagi perjalanan pemerintah desa dalam mewujudkan kesejahteraan masyarakat. Visi bukan mimpi dan bukan slogan tetapi visi harus diwujudkan dan dapat diarahkan ketercapaiannya.</p>\n<p>Berdasarkan masalah potensi dan harapan masa depan maka pemerintah desa Madukara dalam periode 2014-2019 menetapkan visi sebagai berikut :</p>\n<p>&ldquo;Terwujudnya desa.Madukara Mandiri dan sejahtera&nbsp; &rdquo;. dan mempunyai slogan &ldquo;Nyawiji Mbangun Desa&rdquo;</p>\n<p>Dari visi tersebut dapat dijelaskan sebagai berikut :</p>\n<p>-Mandiri</p>\n<p>Kemandirian dalam hal ini meliputi 2 (dua) sisi yaitu pemerintah desa dan masyarakat. Oleh karena itu ketercapaian kemandirian dapat dilihat dari adanya peningkatan kemampuan pemerintah desa dan peningkatan kemampuan masyarakat dalam pelaksanaan pembangunan desa.</p>\n<p>-Sejahtera</p>\n<p>Dari uraian tersebut diatas, maka ketercapaian visi Kepala Desa dapat diuraikan sebagai berikut :</p>\n<p>&nbsp;Makin kuatnya kelembagaan pemerintahan desa.</p>\n<ol>\n<li>Makin meningkatnya peran masyarakat dalam pembangunan.</li>\n<li>Makin baiknya kebijakan-kebijakan pemerintah desa dalam penyelengaraan pemerintahan desa.</li>\n<li>Makin baiknya kualitas pembangunan desa.</li>\n<li>Makin meningkatnya kesejahteraan kehidupan dari masyarakat</li>\n</ol>\n<p>&nbsp;</p>\n<p><strong>2 Misi </strong></p>\n<p>Misi dalam hal ini adalah misi Kepala Desa. Misi pada dasarnya merupakan penjabaran atau operasionalisasi dari visi. Misi merupakan bidang bidang yang akan diarungi untuk menuju tercapainya visi yang telah ditetapkan. Misi juga berapa output&nbsp; output yang pernah diciptakan terlebih dahulu untuk mewujudkan visi. Misi pada dasarnya merupakan beban yang akan dipikul dan diselesaikan agar visi dapat terwujud.</p>\n<p>Untuk mewujudkan visi Kepala Desa sebagaimana rumusan dimuka, maka dirumuskan misi&nbsp; (beban kinerja yang harus dilaksanakan) sebagai berikut :</p>\n<ol>\n<li>Menyelenggarakan pemerintahan desa yang efisien, efektif, dan bersih dengan mengutamakan masyarakat .</li>\n<li>Meningkatkan sumber sumber pendanaan pemerintahan dan pembangunan desa.</li>\n<li>Mengembangkan pemberdayaan masyarakat dan kemitraan dalam pelaksanaan pembangunan desa.</li>\n<li>Meningkatkan kualitas sumber daya manusia dalam pembangunan desa yang berkelanjutan.</li>\n<li>Mengembangkan perekonomian desa.</li>\n<li>Menciptakan rasa aman, tentram, dalam suasana kehidupan desa yang demokratis dan agamis.</li>\n</ol>\n<p><strong>Rumusan Misi tersebut diatas dapat dijelaskan sebagai berikut : </strong></p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Misi 1 : &nbsp;&nbsp; Menyelenggarakan pemerataan desa yang efisien, efektif dan bersih.</p>\n<p>Tujuan pemerintah secara garis besar ada 3 hal yaitu membina/ mengembangkan, membangun/ memberdayakan dan melindungi seluruh masyarakat. Untuk mewujudkan 3 tujuan tersebut maka diciptakan suatu kelembagaan pemerintahan yang mengacu&nbsp; kepada prinsip prinsip manajemen antara lain efisien dan efektif serta prinsip <em>&ldquo;Clean Government&rdquo;</em> yaitu pemerintah yang bersih, oleh karena itu aparat pemerintah desa dalam menjalankan tugas dan fungsinya harus secara profesional, produktif, dan transparan serta akuntabel.</p>\n<p>Misi 2 : &nbsp; Meningkatkan sumber sumber pendanaan pemerintahan&nbsp; dan pembangunan Desa.</p>\n<p>Dana bagi penyelenggaraan pemerintahan desa merupakan elemen yang mutlak harus ada. Visi dan Misi tidak akan terwujud tanpa tersedianya&nbsp; dana. Oleh karena itu pemerintahan yang kuat ditandai oleh cukup dan beragamnya&nbsp; sumber-sumber dana yang dimilikinya.</p>\n<p>Dari uraian tersebut diatas, maka pencapaian&nbsp; misi Kepala Desa dapat diindikasikan sebagai berikut :</p>\n<ol>\n<li>Terselenggaraanya tugas-tugas pemerintahan desa secara efektif.</li>\n<li>Tersusunya program-program pembangunan desa secara efektif dan efisien</li>\n<li>Penggunaan dana yang makin terarah dan efisien/ benar</li>\n<li>Terlaksanaanya pengawasan melekat yang efektf.</li>\n<li>Meningkatnya jumlah dan keragaman sumber - sumber pendanaan desa.</li>\n<li>Meningkatnya kemandirian masyarakat, terutama dalam bidang pendanaan pembangunan.</li>\n<li>Meningkatnya keterlibatan masyarakat dalam pelaksanaan pembangunan.</li>\n<li>Meningkatnya kemampuan masyarakat mengakses ke sumber-sumber daya termasuk informasi.</li>\n<li>Meningkatnya usaha kemitraan yang dilakukan oleh masyarakat.</li>\n<li>Meningkatnya tingkat pendidikan masyarakat.</li>\n<li>Meningkatnya tingkat kesehatan masyarakat.</li>\n<li>Berkembangnya produktivitas sektor pertanian dan sektor sektor rill ekonomi desa.</li>\n</ol>","1","2013-03-31 17:14:06","999","1","Visi Misi","0","","","","",""),
("32","sid.jpg","<div class=\"contentText\">\n<div align=\"justify\">Bagian ini berisi informasi dasar mengenai desa kami. Sila klik pada tautan berikut untuk mendapatkan informasi yang lebih rinci.</div>\n<div align=\"justify\">&nbsp;</div>\n<div align=\"justify\"><ol>\n<li>Sejarah Desa</li>\n<li>Profil Wilayah Desa</li>\n<li>Profil Masyarakat Desa</li>\n<li>Profil Potensi Desa</li>\n</ol></div>\n</div>","1","2013-07-28 19:46:44","999","1","Profil Desa","0","","","","",""),
("35","sid.jpg","<p>Susunan Organisasi Pemerintah Desa Terong</p>\n<p>Kepala Desa dan Perangkat</p>\n<p>1).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Purwono</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 02 Maret 1961</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 03 Rw. 05</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kepala Desa</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 081 392 028 007</p>\n<p>&nbsp;</p>\n<p>2).&nbsp;&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Wijaya Adi Nugraha</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 22 Juni 1983</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 01 Rw. 05</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Sekretaris Desa</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 081 327 960 967</p>\n<p>&nbsp;</p>\n<p>3).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Ari Dewi Utami</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 02 Februari 1992</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 02 Rw. 03</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Pemerintahan</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp; 081 327 404 858</p>\n<p>&nbsp;</p>\n<p>4).&nbsp;&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Basuki</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 02 Juni 1973</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 03 Rw. 05</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Pembangunan</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 082 326 844 747</p>\n<p>&nbsp;</p>\n<p>5).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Dwi Rahayu</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 9 Maret 1986</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 01 Rw. 06</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Keuangan</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 085 713 536 650</p>\n<p>&nbsp; </p>\n<p>6).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Erna Setyani</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 5 November 1979</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 03 Rw. 05</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Kesra</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 081 327 769 231</p>\n<p>&nbsp;</p>\n<p>7).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Dwi Yogi Artati</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kebumen, 26 Desember 1967</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 01 Rw. 05</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Umum</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 081 391 682 880</p>\n<p>&nbsp;</p>\n<p>8).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Agus Kharin</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 22 Agustus 1976</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 02 Rw. 04</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus I</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 085 328 018 996</p>\n<p>&nbsp;</p>\n<p>9).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Suyoto</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 21 September 1966</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 01 Rw. 03</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus II</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 085 291 491 221</p>\n<p>&nbsp;</p>\n<p>10).&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Ali Fikri</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 10 Mei 1977</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 03 Rw. 01</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus III</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 085 726 032 433</p>\n<p>&nbsp;</p>\n<p>11).&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kasmin</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 24 November 1955</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 02 Rw. 06</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus IV</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; :&nbsp;&nbsp;&nbsp; -</p>\n<p>&nbsp;</p>\n<p>12).&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Sukasih</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 11 Juli 1981</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 02 Rw. 07</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus V</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 087 937 769 387</p>\n<p><br /><br />&nbsp;</p>","1","2013-07-28 20:18:20","999","1","Pemerintah Desa","0","","","","",""),
("36","sid.jpg","<p>Anda dapat menghubungi kami melalui :</p>\n<p>COMBINE Resource Institution<br /> Alamat: Jl. K.H. Ali Maksum No. 183 Panggungharjo, Sewon, Bantul, D.I. Yogyakarta 55188 INDONESIA<br /> Telp. / Faks. : +62 274 - 411 123<br /> e-mail: office[at]combine.or.id</p>\n<p>&nbsp;</p>","1","2013-07-28 20:28:31","999","1","Kontak Kami","0","","","","","Kontak Kami"),
("38","sid.jpg","<p>Susunan Kepengurusan LP3M Desa Madukara</p>\n<table style=\"width: 366px; height: 376px;\" border=\"0\">\n<tbody>\n<tr>\n<td>No</td>\n<td>Jabatan</td>\n<td>Nama</td>\n</tr>\n<tr>\n<td>1</td>\n<td>Ketua</td>\n<td>\n<p>Sodikin</p>\n</td>\n</tr>\n<tr>\n<td>2</td>\n<td>Wakil Ketua</td>\n<td>\n<p>Waldiman, S.Pd</p>\n</td>\n</tr>\n<tr>\n<td>3</td>\n<td>Sekretaris</td>\n<td>\n<p>Catur Wahyu Setyo Nugroho</p>\n</td>\n</tr>\n<tr>\n<td>4</td>\n<td>Bendahara</td>\n<td>\n<p>Sumadiwirya</p>\n</td>\n</tr>\n<tr>\n<td>5</td>\n<td>Seksi Agama</td>\n<td>\n<p>Suparjo</p>\n</td>\n</tr>\n<tr>\n<td>6</td>\n<td>Seksi Pendidikan</td>\n<td>\n<p>Supangadi</p>\n</td>\n</tr>\n<tr>\n<td>7</td>\n<td>Seksi Pembangunan</td>\n<td>\n<p>Hudiyono, ST</p>\n</td>\n</tr>\n<tr>\n<td>8</td>\n<td>Seksi Ekonomi</td>\n<td>\n<p>Suyono, SE</p>\n</td>\n</tr>\n<tr>\n<td>9</td>\n<td>Seksi Pemberdayaan Perempuan</td>\n<td>\n<p>Iman Sri Kuati</p>\n</td>\n</tr>\n<tr>\n<td>10</td>\n<td>Seksi Kesehatan</td>\n<td>\n<p>Kasman</p>\n</td>\n</tr>\n<tr>\n<td>11</td>\n<td>Seksi Pemuda</td>\n<td>\n<p>Setyanto</p>\n</td>\n</tr>\n<tr>\n<td>12</td>\n<td>Seksi Keamanan</td>\n<td>\n<p>Sukari</p>\n</td>\n</tr>\n</tbody>\n</table>","1","2013-07-28 20:38:33","999","1","Lembaga Kemasyarakatan","0","","","","",""),
("57","sid.jpg","<p>Menurut Kamus Besar Bahasa Indonesia (KBBI)</p>\n<p>ma.du.ka.ra</p>\n<p>Klasik nomina (kata benda) lebah</p>\n<p>Nomina (kata benda) kain sutra berbenang warna emas</p>\n<p>&nbsp;</p>\n<p>Berikut ini adalah nama-nama pemimpin Desa Madukara sejak tahun...</p>\n<table border=\"0\">\n<tbody>\n<tr>\n<td>NO</td>\n<td>NAMA</td>\n<td>TAHUN</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n</tbody>\n</table>","1","2014-04-29 20:20:39","999","1","Sejarah Desa","0","","","","",""),
("59","sid.jpg","<ol>\n<li><strong>a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Jumlah Penduduk</strong></li>\n</ol>\n<p>&nbsp;</p>\n<table class=\'table table-striped\' style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Jumlah jiwa</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Jumlah laki-laki</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Jumlah perempuan</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Jumlah Kepala Keluarga</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">KK</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<ol>\n<li><strong>b.&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Tingkat Pendidikan</strong></li>\n</ol>\n<table class=\'table table-striped\' style=\"width: 373px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\">\n<tbody>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Belum sekolah</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Usia 7-45 tahun tidak pernah sekolah</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pernah sekolah SD tetapi tidak tamat</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">&nbsp;</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pendidikan terakhir</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Tamat SD/sederajat</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">SLTP/sederajat</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">SLTA/sederajat</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">D-1</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">D-2</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">D-3</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">S-1</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">S-2</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">S-3</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"121\">&nbsp;</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<ol>\n<li><strong>c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Mata Pencaharian</strong></li>\n</ol>\n<p><strong>&nbsp;</strong></p>\n<table class=\'table table-striped\' style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Petani</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">246</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Buruh tani</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">125</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Buruh/swasta</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">136</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pegawai Negeri</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">35</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pengrajin</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pedagang</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">9</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Peternak</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">-</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Nelayan</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">-</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Montir</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">8</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Dokter</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">-</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">POLRI/ABRI</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">1</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pensiunan</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">36</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Perangkat Desa</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">15</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Pembuat Bata</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">3</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p><strong>&nbsp;</strong></p>\n<ol>\n<li><strong>d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>AGAMA</strong></li>\n</ol>\n<table class=\'table table-striped\' style=\"width: 372px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Islam</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">2215</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Kristen</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">5</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Katholik</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Hindu</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">&nbsp;</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n<tr>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"168\">\n<p align=\"right\">Budha</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"120\">\n<p align=\"right\">1</p>\n</td>\n<td valign=\"bottom\" nowrap=\"nowrap\" width=\"84\">\n<p align=\"right\">orang</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>","1","2014-04-29 20:23:24","999","1","Profil Potensi Desa","0","","","","","Profil Potensi Desa"),
("73","sid.jpg","<p><strong>Tentang SID</strong> <br /> Sistem Informasi Desa (SID) adalah sebuah platform teknologi informasi komunikasi untuk mendukung pengelolaan sumber daya komunitas di tingkat desa. Ini bersifat terbuka bagi siapa saja yang akan bergabung dalam gerakan membangun kemandirian komunitas. Konsep pengelolaan sumber daya berada dalam payung besar gagasan Lumbung Komunitas yang dikelola oleh COMBINE Resource Institution.<br /> <strong><br /></strong> <strong>Sekilas pandang sistem informasi desa</strong><br /> Aplikasi Gratis untuk desa yang berbasis Opensource, SID merupakan inisiatif Combine resource institution, sebuah organisasi masyarakat sipil yang sangat tekun dan dedikatif dalam mengembangkan informasi dan komunikasi alternatif berbasis masyarakat.<br /> <strong><br /></strong> <strong>Awal mula SID</strong><br /> \"Awalnya ada keinginan dari pemerintah Desa Balerante yang berharap pelayanan pemerintah desa bisa seperti pengunjung rumah sakit yang ingin mencari data pasien rawat inap, tinggal ketik nama di komputer, maka data tersebut akan keluar\"<br /> (Mart Widarto, pengelola Program Lumbung Komunitas)<br /> Program ini mulai dibuat dari awal 2006: <br /> 1. (2006) komunitas melakukan komunikasi dan diskusi lepas tentang sebuah sistem yang bisa digunakan untuk menyimpan data.<br /> 2. (2008) Rangkaian FDG dengan pemerintah desa membahas tentang tata kelola pendokumentasian di desa<br /> 3. (2009) Ujicoba SID yang sudah dikembangkan di balerante<br /> 4. (2009-2010) Membangun SID (aplikasi) dibeberapa desa yang lain: terong (bantul), Nglegi (Gunungkidul) <br /> 5. (2011) Kandangan (Temanggung) Gilangharjo (bantul) Girikarto (gunungkidul) Talun (klaten) Pager Gunung (magelang) <br /> 6. hingga saat ini 2013 sudah banyak desa pengguna SID.<br /> <br /> <strong>SID sebagai tanggapan atas kebutuhan:</strong><br /> Kalau dulu untuk mencari data penduduk menurut kelompok umur saja kesulitan karena tidak mempunyai databasenya. Dengan adanya SID menjadi lebih mudah.<br /> (Nuryanto, Kabag Pelayanan Pemdes Terong)<br /> <br /> Membangun sebuah sistem bukan hanya membuatkan software dan meninggalkan begitu saja, namun ada upaya untuk memadukan sistem dengan kebutuhan yang ada pada desa. sehingga software dapat memenuhi kebutuhan yang telah ada bukan memaksakan desa untuk mengikuti dan berpindah sistem. inilah yang melatari combine melaksanakan alur pengaplikasian software.<br /> 1. Bentuk tim kerja bersama pemerintah desa<br /> 2. Diskusikan basis data apa saja yang diperlukan untuk warga<br /> 3. Himpun data kependudukan warga dari Kartu Keluarga (KK)<br /> 4. Daftarkan proyek SID dan dapatkan aplikasi softwarenya di http://abcd.lumbungkomunitas.net<br /> 5. Install aplikasi software SID di komputer desa<br /> 6. Entry data penduduk ke SID<br /> 7. Basis data kependudukan sudah bisa dimanfaatkan<br /> 8. Diskusikan rencana pengembangan SID sesuai kebutuhan desa<br /> 9. Sebarluaskan informasi desa melalui beragam media untuk warga<br /> (Elanto Wijoyono, pengelola Program Lumbung Komunitas)<br /> <br /> Pemberdayaan data desa yang dibangun diharapkan dapat menjunjung kesejahteraan masyarakat desa, data-data tersebut dapat diperuntukkan untuk riset lebih lanjut tentang kemiskinan, tanggap bencana, sumberdaya desa yang bisa diekspose keluar dan dengan menghubungkan dari desa ke desa dapat mencontohkan banyak hal dalam keberhasilan pemberdayaannya.<br /> (sumber: Buku Sistem Informasi Desa) <br /> <strong><br /></strong> <strong>Hal-hal penting yang harus diperhatikan dalam mengaplikasikan SID</strong><br /> 1. SID mencoba masuk keranah paling kecil dari penduduk, dengan tujuan menyatukan warga masyarakat bersama perangkat desa bersama-sama memajukan desa dengan memanfaatkan informasi dan jaringan. Konsep gotong royong sebagai kearifan lokal dipertahankan dan dikuatkan kembali.<br /> 2. Data yang dikumpulkan dijaga kerahasiaanya dari publik, Keamanan data pribadi warga mengacu pada Undang-Undang Nomor 23 Tahun 2006 tentang Administrasi Kependudukan. Penerapan sistem informasi administrasi kependudukan diatur dalam Keputusan Presiden (Keppres) No. 88/2004 tentang pengelolaan administrasi kependudukan, Undang-Undang (UU) No. 23 tahun 2006 tentang administrasi kependudukan dan Peraturan Menteri Dalam Negeri (Permendagri) No. 18/2005 serta Peraturan Pemerintah (PP) No. 37 tahun 2007 tentang administrasi kependudukan. Pencatatan data penduduk suatu daerah yang melalui sistem informasi administrasi kependudukan menjadi tanggung jawab pemerintah kabupaten dan kota dimana dalam pelaksanaannya diawali dari desa dan kelurahan sebagai awal dari pendataan penduduk disuatu daerah.<br /> 3. Software SID hanyalah sebuah alat, yang membutuhkan ketrampilan dari pengguna alat. alat ini bisa menjadi kekuatan desa apabila digunakan dengan semestinya, namun juga bisa menjadi bumerang ketika jatuh ketangan yang salah.<br /> <strong><br /></strong> <strong>Pengembangan dengan ACCESS</strong><br /> ACCESS yang memiliki pengalaman melakukan participatory poverty assessment dengan pendekatan Community Led Action and participatory Process (CLAPP) dimana melibatkan warga secara partisipatif dalam menyusun dan menghasilkan data yang valid. Yang kemudian Memanfaatkan SAID (Sistem Administrasi dan Informasi Desa) sebagai &acirc;&euro;&oelig;mesin&acirc;&euro; untuk memanfaatkan database partisipatif yang diperoleh. <br /> ACCESS bekerjasama dengan Combine Resource Institution (CRI) bersama mengembangkan SAID di sejumlah desa di wilayah dampingan ACCESS, dan beberapa daerah telah menyatakan minatnya sebagai bagian dari upaya mereka menyediakan informasi terbaru yang lebih akurat di level yang paling bawah yaitu desa/kelurahan. Hal ini dirasakan karena Indonesia masih menghadapi kesulitan terkait dengan ketepatan data dan SAID membantu menyediakan data tersebut dari desa ke atas.</p>","1","2014-05-15 16:21:08","1","1","Selamat Bergabung dengan SID","0","","","","",""),
("79","sid.jpg","<p style=\"text-align: justify;\">This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the system administrator. Please note that any views or opinions presented in this email are solely those of the author and do not necessarily represent those of the company. Finally, the recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.</p>","1","2014-10-23 19:57:06","7","1","Bakpia Ketan","0","","","","",""),
("81","sid.jpg","<p>Jelajah Desa merupakan paket wisata menjelajah Desa Wisata Bumi Pertiwi mengunjungi masing sanggar dan menikmati alam desa.<br />Jelajah Desa ini masing-masing peserta dikenai biaya: Rp. 15.000,-/ Orang.<br />Dengan peserta minimal 10 Orang<br />Fasilitas : Pemandu</p>","1","2014-11-05 17:33:38","7","1","Jelajah Desa yang Mengesankan","0","","","","",""),
("82","sid.jpg","<p style=\"text-align: justify;\">Halaman ini berisi tautan menuju informasi mengenai Basis Data Desa. Ada dua jenis data yang dimuat dalam sistem ini, yakni basis data kependudukan dan basis data sumber daya desa. Sila klik pada tautan berikut untuk mendapatkan tampilan data statistik per kategori.</p>\n<ol>\n<li style=\"text-align: justify;\">Data Wilayah Administratif&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Pendidikan&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Pekerjaan&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Golongan Darah&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Agama&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Jenis Kelamin&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Kelompok Umur&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Penerima Raskin&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Penerima Jamkesmas&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Warga Negara&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n<li style=\"text-align: justify;\">Data Kelas Sosial&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\n</ol>\n<p style=\"text-align: justify;\">Data yang tampil adalah statistik yang didapatkan dari proses olah data dasar yang dilakukan secara <em>offline</em> di kantor desa secara rutin/harian. Data dasar di kantor desa diunggah ke dalam sistem <em>online</em> di website ini secara berkala. Sila hubungi kontak pemerintah desa untuk mendapatkan data dan informasi desa termutakhir.</p>","1","2014-11-05 18:26:37","999","1","Data Desa","0","","","","",""),
("84","sid.jpg","<p style=\"text-align: justify;\">1. Pada komputer/PC server, buka web-browser (direkomendasikan <span style=\"text-decoration: underline;\">Mozilla Firefox</span> atau <span style=\"text-decoration: underline;\">Chrome</span>)</p>\n<p style=\"text-align: justify; padding-left: 30px;\">Ketik:<span style=\"color: #0000ff;\"> localhot/phpmyadmin</span></p>\n<p>2. Muncul halaman <span style=\"text-decoration: underline;\">PHPMyAdmin</span>. Periksa kolom kiri.</p>\n<p style=\"padding-left: 30px;\">Klik/Pilih: &ldquo;sid&rdquo;</p>\n<p>3. Muncul halaman yang menampilkan deretan isi tabel &ldquo;<span style=\"text-decoration: underline;\">sid</span>&ldquo;.</p>\n<p style=\"padding-left: 30px;\">Klik/Pilih: &ldquo;Export&rdquo; pada bagian menu atas di kolom kanan</p>\n<p>4. Muncul halaman <span style=\"text-decoration: underline;\">Export</span>. Kolom isian yang ada tak perlu diubah. Lihat bagian kanan bawah.</p>\n<p style=\"padding-left: 30px;\">Klik: &ldquo;Go&rdquo;</p>\n<p>5. Muncul jendela pilihan lokasi untuk menyimpan file database.</p>\n<p style=\"padding-left: 30px;\">Klik: &ldquo;Save&rdquo;<br /> Klik: &ldquo;OK&rdquo;</p>\n<p>6. File database SID 3.0 akan tersimpan otomatis di folder Download (tergantung setting komputer masing-masing). File tersimpan dalam sebagai &ldquo;sid.sql&rdquo;</p>\n<p>7. Simpan/amankan file &ldquo;sid.sql&rdquo; di media lain: Hard-disk eksternal, CD, <em>online storage</em>, dan sebagainya.</p>\n<p>8. Lakukan proses <em>back-up</em> database ini secara berkala.</p>\n<p>.<br /> Selamat mencoba!</p>","1","2014-11-05 20:25:34","1","1","Panduan Back-Up Data (Export Database) SID 3.0","0","","","","",""),
("85","sid.jpg","<div class=\"contentText\">\n<div align=\"justify\">Bagian ini berisi informasi mengenai PemerintahanDesa. Sila klik pada tautan berikut untuk mendapatkan informasi yang lebih rinci.</div>\n<div align=\"justify\">&nbsp;</div>\n<ol>\n<li>Visi dan Misi</li>\n<li>Pemerintah Desa</li>\n<li>Badan Permusyawaratan Desa</li>\n</ol></div>","1","2014-11-06 12:53:54","999","1","Pemerintahan Desa","0","","","","",""),
("89","sid.jpg","<p>This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they yang berlaku di seluruh Indonesia.</p>","2","2015-06-16 23:47:36","17","1","teks 1","0","","","","",""),
("90","sid.jpg","<p>PEMBUATAN KTP Kartu Tanda Penduduk adalah identitas resmi penduduk sebagai bukti diri yang terbitkan oleh instansi pelaksana yang berlaku di seluruh Indonesia.</p>","2","2015-06-16 23:47:55","17","1","teks 2","0","","","","","");
CREATE TABLE `config` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`nama_desa` varchar(100) NOT NULL,
`kode_desa` varchar(100) NOT NULL,
`nama_kepala_desa` varchar(100) NOT NULL,
`nip_kepala_desa` varchar(100) NOT NULL,
`kode_pos` varchar(6) NOT NULL,
`nama_kecamatan` varchar(100) NOT NULL,
`kode_kecamatan` varchar(100) NOT NULL,
`nama_kepala_camat` varchar(100) NOT NULL,
`nip_kepala_camat` varchar(100) NOT NULL,
`nama_kabupaten` varchar(100) NOT NULL,
`kode_kabupaten` varchar(100) NOT NULL,
`nama_propinsi` varchar(100) NOT NULL,
`kode_propinsi` varchar(100) NOT NULL,
`logo` varchar(100) NOT NULL,
`lat` varchar(20) NOT NULL,
`lng` varchar(20) NOT NULL,
`zoom` tinyint(4) NOT NULL,
`map_tipe` varchar(20) NOT NULL,
`path` text NOT NULL,
`alamat_kantor` varchar(200) DEFAULT NULL,
`g_analytic` varchar(200) NOT NULL,
`regid` varchar(60) NOT NULL,
`macid` varchar(60) NOT NULL,
`email_desa` varchar(100) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO config VALUES
("1","Bumi Pertiwi","07","Jarwo","--","53482","Nusantara","08","Sukirman","23425525025","Sejahtera","03","Banjar Raya","34","logo-kab.png","-7.770089387659562","110.29246435532377","11","roadmap","(-7.8446308481358535, 110.31679916661233);(-7.764357196314333, 110.42803573887795);(-7.8507527808847515, 110.48365402501076);(-7.897684597196081, 110.4362754849717);(-7.867077493758317, 110.30169296544045);","Jl. Tengah Raya Tinggi No. 77","Tes","5966cb089927401e9ed81157d5be0ce0","00426-OEM-8992662-00537","");
CREATE TABLE `data_persil` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nik` varchar(64) NOT NULL,
`nama` varchar(128) NOT NULL COMMENT 'nomer persil',
`persil_jenis_id` tinyint(2) NOT NULL,
`id_clusterdesa` varchar(64) NOT NULL,
`alamat_ext` varchar(64) NOT NULL,
`luas` decimal(7,2) NOT NULL,
`kelas` varchar(128) DEFAULT NULL,
`peta` text,
`no_sppt_pbb` varchar(128) NOT NULL,
`persil_peruntukan_id` tinyint(2) NOT NULL,
`rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`userID` int(11) NOT NULL,
PRIMARY KEY (`id`),
KEY `nik` (`nik`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `data_persil_jenis` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(128) NOT NULL,
`ndesc` text NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
INSERT INTO data_persil_jenis VALUES
("1","Leter C","Untuk tanah yang memiliki surat minim itu biasanya berupa leter C. Letter C ini diperoleh dari kantor desa dimana tanah itu berada, letter C ini merupakan tanda bukti berupa catatan yang berada di Kantor Desa atau Kelurahan."),
("2","Leter D","Leter D adalah"),
("4","SHM","Sertifikat Hak Milik adalah bl ab a"),
("5","HGB","Hak Guna Bangunan adalah");
CREATE TABLE `data_persil_log` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`persil_id` int(11) NOT NULL,
`persil_transaksi_jenis` tinyint(2) NOT NULL,
`pemilik_lama` varchar(24) NOT NULL,
`pemilik_baru` varchar(24) NOT NULL,
`rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`user_id` int(11) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tabel untuk menyimpan catatan transaksi atas data persil';
CREATE TABLE `data_persil_peruntukan` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(128) NOT NULL,
`ndesc` text NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
INSERT INTO data_persil_peruntukan VALUES
("1","Sawah","Sawah"),
("2","Pekarangan","Pekarangan"),
("3","Perumahan","Perumahan");
CREATE TABLE `detail_log_penduduk` (
`id` int(10) NOT NULL,
`nama` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `dokumen` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_pend` int(11) NOT NULL DEFAULT '0',
`satuan` varchar(200) NOT NULL,
`nama` varchar(50) NOT NULL,
`enabled` int(2) NOT NULL DEFAULT '1',
`tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `gambar_gallery` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`parrent` int(4) NOT NULL,
`gambar` varchar(200) NOT NULL,
`nama` varchar(50) NOT NULL,
`enabled` int(2) NOT NULL DEFAULT '1',
`tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`tipe` int(4) NOT NULL,
PRIMARY KEY (`id`),
KEY `parrent` (`parrent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `garis` (
`id` int(4) NOT NULL AUTO_INCREMENT,
`nama` varchar(50) NOT NULL,
`path` text NOT NULL,
`enabled` int(11) NOT NULL DEFAULT '1',
`ref_line` int(9) NOT NULL,
`foto` varchar(100) NOT NULL,
`desk` text NOT NULL,
`id_cluster` int(11) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `gis_simbol` (
`simbol` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO gis_simbol VALUES
("accident.png"),
("accident_2.png"),
("administration.png"),
("administration_2.png"),
("aestheticscenter.png"),
("agriculture.png"),
("agriculture2.png"),
("agriculture3.png"),
("agriculture4.png"),
("aircraft-small.png"),
("airplane-sport.png"),
("airplane-tourism.png"),
("airport-apron.png"),
("airport-runway.png"),
("airport-terminal.png"),
("airport.png"),
("airport_2.png"),
("amphitheater-tourism.png"),
("amphitheater.png"),
("ancientmonument.png"),
("ancienttemple.png"),
("ancienttempleruin.png"),
("animals.png"),
("animals_2.png"),
("anniversary.png"),
("apartment.png"),
("apartment_2.png"),
("aquarium.png"),
("arch.png"),
("archery.png"),
("artgallery.png"),
("atm.png"),
("atv.png"),
("audio.png"),
("australianfootball.png"),
("bags.png"),
("bank.png"),
("bank_2.png"),
("bankeuro.png"),
("bankpound.png"),
("bar.png"),
("bar_2.png"),
("baseball.png"),
("basketball.png"),
("baskteball2.png"),
("beach.png"),
("beach_2.png"),
("beautiful.png"),
("beautiful_2.png"),
("bench.png"),
("biblio.png"),
("bicycleparking.png"),
("bigcity.png"),
("billiard.png"),
("bobsleigh.png"),
("bomb.png"),
("bookstore.png"),
("bowling.png"),
("bowling_2.png"),
("boxing.png"),
("bread.png"),
("bread_2.png"),
("bridge.png"),
("bridgemodern.png"),
("bullfight.png"),
("bungalow.png"),
("bus.png"),
("bus_2.png"),
("butcher.png"),
("cabin.png"),
("cablecar.png"),
("camping.png"),
("camping_2.png"),
("campingsite.png"),
("canoe.png"),
("car.png"),
("car_2.png"),
("carrental.png"),
("carrepair.png"),
("carrepair_2.png"),
("carwash.png"),
("casino.png"),
("casino_2.png"),
("castle.png"),
("cathedral.png"),
("cathedral2.png"),
("cave.png"),
("cemetary.png"),
("chapel.png"),
("church.png"),
("church2.png"),
("church_2.png"),
("cinema.png"),
("cinema_2.png"),
("circus.png"),
("citysquare.png"),
("climbing.png"),
("clothes-female.png"),
("clothes-male.png"),
("clothes.png");
INSERT INTO gis_simbol VALUES
("clothes_2.png"),
("clouds.png"),
("clouds_2.png"),
("cloudsun.png"),
("cloudsun_2.png"),
("club.png"),
("club_2.png"),
("cluster.png"),
("cluster2.png"),
("cluster3.png"),
("cluster4.png"),
("cluster5.png"),
("cocktail.png"),
("coffee.png"),
("coffee_2.png"),
("communitycentre.png"),
("company.png"),
("company_2.png"),
("computer.png"),
("computer_2.png"),
("concessionaire.png"),
("conference.png"),
("construction.png"),
("convenience.png"),
("convent.png"),
("corral.png"),
("country.png"),
("court.png"),
("cricket.png"),
("cross.png"),
("crossingguard.png"),
("cruise.png"),
("currencyexchange.png"),
("customs.png"),
("cycling.png"),
("cycling_2.png"),
("cyclingfeedarea.png"),
("cyclingmountain1.png"),
("cyclingmountain2.png"),
("cyclingmountain3.png"),
("cyclingmountain4.png"),
("cyclingmountainnotrated.png"),
("cyclingsport.png"),
("cyclingsprint.png"),
("cyclinguncategorized.png"),
("dam.png"),
("dancinghall.png"),
("dates.png"),
("dates_2.png"),
("daycare.png"),
("days-dim.png"),
("days-dom.png"),
("days-jeu.png"),
("days-jue.png"),
("days-lun.png"),
("days-mar.png"),
("days-mer.png"),
("days-mie.png"),
("days-qua.png"),
("days-qui.png"),
("days-sab.png"),
("days-sam.png"),
("days-seg.png"),
("days-sex.png"),
("days-ter.png"),
("days-ven.png"),
("days-vie.png"),
("dentist.png"),
("deptstore.png"),
("disability.png"),
("disability_2.png"),
("disabledparking.png"),
("diving.png"),
("doctor.png"),
("doctor_2.png"),
("dog-leash.png"),
("dog-offleash.png"),
("door.png"),
("down.png"),
("downleft.png"),
("downright.png"),
("downthenleft.png"),
("downthenright.png"),
("drinkingfountain.png"),
("drinkingwater.png"),
("drugs.png"),
("drugs_2.png"),
("elevator.png"),
("embassy.png"),
("entrance.png"),
("escalator-down.png"),
("escalator-up.png"),
("exit.png"),
("expert.png"),
("explosion.png"),
("factory.png"),
("factory_2.png"),
("fallingrocks.png"),
("family.png"),
("farm.png");
INSERT INTO gis_simbol VALUES
("farm_2.png"),
("fastfood.png"),
("fastfood_2.png"),
("festival-itinerant.png"),
("festival.png"),
("findajob.png"),
("findjob.png"),
("findjob_2.png"),
("fire-extinguisher.png"),
("fire.png"),
("firemen.png"),
("firemen_2.png"),
("fireworks.png"),
("firstaid.png"),
("fishing.png"),
("fishing_2.png"),
("fishingshop.png"),
("fitnesscenter.png"),
("fjord.png"),
("flood.png"),
("flowers.png"),
("flowers_2.png"),
("followpath.png"),
("foodtruck.png"),
("forest.png"),
("fortress.png"),
("fossils.png"),
("fountain.png"),
("friday.png"),
("friday_2.png"),
("friends.png"),
("friends_2.png"),
("garden.png"),
("gateswalls.png"),
("gazstation.png"),
("gazstation_2.png"),
("geyser.png"),
("gifts.png"),
("girlfriend.png"),
("girlfriend_2.png"),
("glacier.png"),
("golf.png"),
("golf_2.png"),
("gondola.png"),
("gourmet.png"),
("grocery.png"),
("gun.png"),
("gym.png"),
("hairsalon.png"),
("handball.png"),
("hanggliding.png"),
("hats.png"),
("headstone.png"),
("headstonejewish.png"),
("helicopter.png"),
("highway.png"),
("highway_2.png"),
("hiking-tourism.png"),
("hiking.png"),
("hiking_2.png"),
("historicalquarter.png"),
("home.png"),
("home_2.png"),
("horseriding.png"),
("horseriding_2.png"),
("hospital.png"),
("hospital_2.png"),
("hostel.png"),
("hotairballoon.png"),
("hotel.png"),
("hotel1star.png"),
("hotel2stars.png"),
("hotel3stars.png"),
("hotel4stars.png"),
("hotel5stars.png"),
("hotel_2.png"),
("house.png"),
("hunting.png"),
("icecream.png"),
("icehockey.png"),
("iceskating.png"),
("im-user.png"),
("info.png"),
("info_2.png"),
("jewelry.png"),
("jewishquarter.png"),
("jogging.png"),
("judo.png"),
("justice.png"),
("justice_2.png"),
("karate.png"),
("karting.png"),
("kayak.png"),
("laboratory.png"),
("lake.png"),
("laundromat.png"),
("left.png"),
("leftthendown.png"),
("leftthenup.png"),
("library.png");
INSERT INTO gis_simbol VALUES
("library_2.png"),
("lighthouse.png"),
("liquor.png"),
("lock.png"),
("lockerrental.png"),
("magicshow.png"),
("mainroad.png"),
("massage.png"),
("military.png"),
("military_2.png"),
("mine.png"),
("mobilephonetower.png"),
("modernmonument.png"),
("moderntower.png"),
("monastery.png"),
("monday.png"),
("monday_2.png"),
("monument.png"),
("mosque.png"),
("motorbike.png"),
("motorcycle.png"),
("movierental.png"),
("museum-archeological.png"),
("museum-art.png"),
("museum-crafts.png"),
("museum-historical.png"),
("museum-naval.png"),
("museum-science.png"),
("museum-war.png"),
("museum.png"),
("museum_2.png"),
("music-classical.png"),
("music-hiphop.png"),
("music-live.png"),
("music-rock.png"),
("music.png"),
("music_2.png"),
("nanny.png"),
("newsagent.png"),
("nordicski.png"),
("nursery.png"),
("observatory.png"),
("oilpumpjack.png"),
("olympicsite.png"),
("ophthalmologist.png"),
("pagoda.png"),
("paint.png"),
("palace.png"),
("panoramic.png"),
("panoramic180.png"),
("park-urban.png"),
("park.png"),
("park_2.png"),
("parkandride.png"),
("parking.png"),
("parking_2.png"),
("party.png"),
("patisserie.png"),
("pedestriancrossing.png"),
("pend.png"),
("pens.png"),
("perfumery.png"),
("personal.png"),
("personalwatercraft.png"),
("petroglyphs.png"),
("pets.png"),
("phones.png"),
("photo.png"),
("photodown.png"),
("photodownleft.png"),
("photodownright.png"),
("photography.png"),
("photoleft.png"),
("photoright.png"),
("photoup.png"),
("photoupleft.png"),
("photoupright.png"),
("picnic.png"),
("pizza.png"),
("pizza_2.png"),
("places-unvisited.png"),
("places-visited.png"),
("planecrash.png"),
("playground.png"),
("playground_2.png"),
("poker.png"),
("poker_2.png"),
("police.png"),
("police2.png"),
("police_2.png"),
("pool-indoor.png"),
("pool.png"),
("pool_2.png"),
("port.png"),
("port_2.png"),
("postal.png"),
("postal_2.png"),
("powerlinepole.png"),
("powerplant.png"),
("powersubstation.png");
INSERT INTO gis_simbol VALUES
("prison.png"),
("publicart.png"),
("racing.png"),
("radiation.png"),
("rain_2.png"),
("rain_3.png"),
("rattlesnake.png"),
("realestate.png"),
("realestate_2.png"),
("recycle.png"),
("recycle_2.png"),
("recycle_3.png"),
("regroup.png"),
("regulier.png"),
("resort.png"),
("restaurant-barbecue.png"),
("restaurant-buffet.png"),
("restaurant-fish.png"),
("restaurant-romantic.png"),
("restaurant.png"),
("restaurant_2.png"),
("restaurantafrican.png"),
("restaurantchinese.png"),
("restaurantchinese_2.png"),
("restaurantfishchips.png"),
("restaurantgourmet.png"),
("restaurantgreek.png"),
("restaurantindian.png"),
("restaurantitalian.png"),
("restaurantjapanese.png"),
("restaurantjapanese_2.png"),
("restaurantkebab.png"),
("restaurantkorean.png"),
("restaurantmediterranean.png"),
("restaurantmexican.png"),
("restaurantthai.png"),
("restaurantturkish.png"),
("revolution.png"),
("right.png"),
("rightthendown.png"),
("rightthenup.png"),
("riparian.png"),
("ropescourse.png"),
("rowboat.png"),
("rugby.png"),
("ruins.png"),
("sailboat-sport.png"),
("sailboat-tourism.png"),
("sailboat.png"),
("salle-fete.png"),
("satursday.png"),
("satursday_2.png"),
("sauna.png"),
("school.png"),
("school_2.png"),
("schrink.png"),
("schrink_2.png"),
("sciencecenter.png"),
("seals.png"),
("seniorsite.png"),
("shadow.png"),
("shelter-picnic.png"),
("shelter-sleeping.png"),
("shoes.png"),
("shoes_2.png"),
("shoppingmall.png"),
("shore.png"),
("shower.png"),
("sight.png"),
("skateboarding.png"),
("skiing.png"),
("skiing_2.png"),
("skijump.png"),
("skilift.png"),
("smallcity.png"),
("smokingarea.png"),
("sneakers.png"),
("snow.png"),
("snowboarding.png"),
("snowmobiling.png"),
("snowshoeing.png"),
("soccer.png"),
("soccer2.png"),
("soccer_2.png"),
("spaceport.png"),
("spectacle.png"),
("speed20.png"),
("speed30.png"),
("speed40.png"),
("speed50.png"),
("speed60.png"),
("speed70.png"),
("speed80.png"),
("speed90.png"),
("speed100.png"),
("speed110.png"),
("speed120.png"),
("speed130.png"),
("speedhump.png"),
("spelunking.png");
INSERT INTO gis_simbol VALUES
("stadium.png"),
("statue.png"),
("steamtrain.png"),
("stop.png"),
("stoplight.png"),
("stoplight_2.png"),
("strike.png"),
("strike1.png"),
("subway.png"),
("sun.png"),
("sun_2.png"),
("sunday.png"),
("sunday_2.png"),
("supermarket.png"),
("supermarket_2.png"),
("surfing.png"),
("suv.png"),
("synagogue.png"),
("tailor.png"),
("tapas.png"),
("taxi.png"),
("taxi_2.png"),
("taxiway.png"),
("teahouse.png"),
("telephone.png"),
("templehindu.png"),
("tennis.png"),
("tennis2.png"),
("tennis_2.png"),
("tent.png"),
("terrace.png"),
("text.png"),
("textiles.png"),
("theater.png"),
("theater_2.png"),
("themepark.png"),
("thunder.png"),
("thunder_2.png"),
("thursday.png"),
("thursday_2.png"),
("toilets.png"),
("toilets_2.png"),
("tollstation.png"),
("tools.png"),
("tower.png"),
("toys.png"),
("toys_2.png"),
("trafficenforcementcamera.png"),
("train.png"),
("train_2.png"),
("tram.png"),
("trash.png"),
("truck.png"),
("truck_2.png"),
("tuesday.png"),
("tuesday_2.png"),
("tunnel.png"),
("turnleft.png"),
("turnright.png"),
("university.png"),
("university_2.png"),
("up.png"),
("upleft.png"),
("upright.png"),
("upthenleft.png"),
("upthenright.png"),
("usfootball.png"),
("vespa.png"),
("vet.png"),
("video.png"),
("videogames.png"),
("videogames_2.png"),
("villa.png"),
("waitingroom.png"),
("water.png"),
("waterfall.png"),
("watermill.png"),
("waterpark.png"),
("waterskiing.png"),
("watertower.png"),
("waterwell.png"),
("waterwellpump.png"),
("wedding.png"),
("wednesday.png"),
("wednesday_2.png"),
("wetland.png"),
("white1.png"),
("white20.png"),
("wifi.png"),
("wifi_2.png"),
("windmill.png"),
("windsurfing.png"),
("windturbine.png"),
("winery.png"),
("wineyard.png"),
("workoffice.png"),
("world.png"),
("worldheritagesite.png"),
("yoga.png"),
("youthhostel.png");
INSERT INTO gis_simbol VALUES
("zipline.png"),
("zoo.png"),
("zoo_2.png");
CREATE TABLE `inbox` (
`UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
`Text` text NOT NULL,
`SenderNumber` varchar(20) NOT NULL DEFAULT '',
`Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
`UDH` text NOT NULL,
`SMSCNumber` varchar(20) NOT NULL DEFAULT '',
`Class` int(11) NOT NULL DEFAULT '-1',
`TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
`RecipientID` text NOT NULL,
`Processed` enum('false','true') NOT NULL DEFAULT 'false',
PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `kategori` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`kategori` varchar(100) NOT NULL,
`tipe` int(4) NOT NULL DEFAULT '1',
`urut` tinyint(4) NOT NULL,
`enabled` tinyint(4) NOT NULL,
`parrent` tinyint(4) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
INSERT INTO kategori VALUES
("1","Berita Desa","1","1","1","0"),
("2","Produk Desa","1","3","1","0"),
("4","Agenda Desa","2","2","1","0"),
("5","Peraturan Desa","2","5","1","0"),
("6","Laporan Desa","2","6","1","0"),
("8","Panduan Layanan Desa","2","3","1","0"),
("15","Berita Daerah","1","0","1","1"),
("17","teks_berjalan","1","0","1","0");
CREATE TABLE `kelompok` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_master` int(11) NOT NULL,
`id_ketua` int(11) NOT NULL,
`kode` varchar(16) NOT NULL,
`nama` varchar(50) NOT NULL,
`keterangan` varchar(100) NOT NULL,
PRIMARY KEY (`id`),
KEY `id_ketua` (`id_ketua`),
KEY `id_master` (`id_master`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `kelompok_anggota` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_kelompok` int(11) NOT NULL,
`id_penduduk` int(11) NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `id_kelompok` (`id_kelompok`,`id_penduduk`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `kelompok_master` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`kelompok` varchar(50) NOT NULL,
`deskripsi` varchar(400) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `komentar` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`id_artikel` int(7) NOT NULL,
`owner` varchar(50) NOT NULL,
`email` varchar(50) NOT NULL,
`komentar` text NOT NULL,
`tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`enabled` int(2) NOT NULL DEFAULT '2',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `kontak` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_pend` int(11) DEFAULT NULL,
`no_hp` varchar(15) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `kontak_grup` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama_grup` varchar(30) NOT NULL,
`id_kontak` int(11) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `line` (
`id` int(4) NOT NULL AUTO_INCREMENT,
`nama` varchar(50) NOT NULL,
`simbol` varchar(50) NOT NULL,
`color` varchar(10) NOT NULL DEFAULT 'ff0000',
`tipe` int(4) NOT NULL,
`parrent` int(4) DEFAULT '1',
`enabled` int(11) NOT NULL DEFAULT '1',
PRIMARY KEY (`id`),
KEY `parrent` (`parrent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `log_bulanan` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pend` int(11) NOT NULL,
`lk` int(11) NOT NULL,
`pr` int(11) NOT NULL,
`kk` int(11) NOT NULL,
`tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `log_penduduk` (
`id` int(10) NOT NULL AUTO_INCREMENT,
`id_pend` int(11) NOT NULL,
`id_detail` int(4) NOT NULL,
`tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`bulan` varchar(2) NOT NULL,
`tahun` varchar(4) NOT NULL,
`tgl_peristiwa` date NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `id_pend` (`id_pend`,`id_detail`,`tgl_peristiwa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `log_perubahan_penduduk` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_pend` int(11) NOT NULL,
`id_cluster` varchar(200) NOT NULL,
`tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `log_surat` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_format_surat` int(4) NOT NULL,
`id_pend` int(11) NOT NULL,
`id_pamong` int(4) NOT NULL,
`id_user` int(4) NOT NULL,
`tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`bulan` varchar(2) DEFAULT NULL,
`tahun` varchar(4) DEFAULT NULL,
`no_surat` varchar(20) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `lokasi` (
`id` int(4) NOT NULL AUTO_INCREMENT,
`desk` text NOT NULL,
`nama` varchar(50) NOT NULL,
`enabled` int(11) NOT NULL DEFAULT '1',
`lat` varchar(30) NOT NULL,
`lng` varchar(30) NOT NULL,
`ref_point` int(9) NOT NULL,
`foto` varchar(100) NOT NULL,
`id_cluster` int(11) NOT NULL,
PRIMARY KEY (`id`),
KEY `ref_point` (`ref_point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `media_sosial` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`gambar` text NOT NULL,
`link` text NOT NULL,
`nama` varchar(100) NOT NULL,
`enabled` int(11) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO media_sosial VALUES
("1","fb.png","https://www.facebook.com/combine.ri","Facebook","1"),
("2","twt.png","https://twitter.com/combineri","Twitter","1"),
("3","goo.png","http://plus.google.com/","Google Pluss","1"),
("4","yb.png","http://www.youtube.com/channel/UCk3eN9fI_eLGYzAn_lOlgXQ","Youtube","1");
CREATE TABLE `menu` (
`id` int(4) NOT NULL AUTO_INCREMENT,
`nama` varchar(50) NOT NULL,
`link` varchar(500) NOT NULL,
`tipe` int(4) NOT NULL,
`parrent` int(4) NOT NULL DEFAULT '1',
`link_tipe` tinyint(1) NOT NULL DEFAULT '0',
`enabled` int(11) NOT NULL DEFAULT '1',
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
INSERT INTO menu VALUES
("16","Profil Desa","artikel/32","1","1","1","1"),
("17","Pemerintahan Desa","artikel/85","1","1","1","1"),
("19","Lembaga Masyarakat","artikel/38","1","1","1","1"),
("23","Teras Desa","","2","1","1","1"),
("24","Data Desa","artikel/82","1","1","1","1"),
("31","Data Wilayah Administratif","statistik/wilayah","3","24","1","1"),
("32","Data Pendidikan dalam KK","statistik/pendidikan-dalam-kk","3","24","1","1"),
("33","Data Pendidikan Ditempuh","statistik/pendidikan-ditempuh","3","24","1","1"),
("34","Data Pekerjaan","statistik/pekerjaan","3","24","1","1"),
("35","Data Agama","statistik/agama","3","24","1","1"),
("36","Data Jenis Kelamin","statistik/jenis-kelamin","3","24","1","1"),
("40","Data Golongan Darah","statistik/golongan-darah","3","24","1","1"),
("51","Data Kelompok Umur","statistik/kelompok-umur","3","24","1","1"),
("54","Sejarah Desa","artikel/57","3","16","0","1"),
("57","Visi dan Misi","artikel/8","3","17","1","1"),
("58","Pemerintah Desa","artikel/35","3","17","1","1"),
("62","Berita Desa","","2","1","1","1"),
("63","Agenda Desa","artikel/41","2","1","1","2"),
("64","Peraturan Desa","peraturan","2","1","1","1"),
("65","Panduan Layanan Desa","#","2","1","1","1"),
("66","Produk Desa","produk","2","1","1","1"),
("68","Undang undang","artikel/42","3","64","1","2"),
("69","Peraturan Pemerintah","artikel/43","3","64","1","2"),
("70","Peraturan Daerah","","3","64","1","2"),
("71","Peraturan Bupati","","3","64","1","2"),
("72","Peraturan Bersama KaDes","","3","64","1","2"),
("73","Informasi Publik","#","2","1","1","1"),
("75","Rencana Kerja Anggaran","","3","73","1","1"),
("76","RAPB Desa","","3","73","1","1"),
("77","APB Desa","","3","73","1","1"),
("78","DPA","","3","73","1","1"),
("80","Profil Potensi Desa","artikel/59","3","16","1","1"),
("84","LKMD","artikel/62","3","18","1","1"),
("85","PKK","artikel/63","3","18","1","1"),
("86","Karang Taruna","artikel/64","3","18","1","1"),
("87","RT RW","artikel/65","3","18","1","1"),
("88","Linmas","artikel/70","3","18","1","1"),
("89","TKP2KDes","artikel/66","3","18","1","1"),
("90","KPAD","artikel/67","3","18","1","1"),
("91","Kelompok Ternak","artikel/68","3","18","1","1"),
("92","Kelompok Tani","artikel/69","3","18","1","1"),
("93","Kelompok Ekonomi Lainya","artikel/71","3","18","1","1"),
("98","LKPJ","D:\\PEMERINTAHAN\\diklat\\lkpj2014","3","73","1","1"),
("99","LPPD","","3","73","1","1"),
("100","ILPPD","","3","73","1","1"),
("101","Peraturan Desa","artikel/44","3","64","1","2"),
("102","Peraturan Kepala Desa","artikel/45","3","64","1","2"),
("103","Keputusan Kepala Desa","artikel/46","3","64","1","2"),
("104","PBB","","3","73","1","1"),
("106","Data Warga Negara","statistik/warga-negara","3","24","1","1"),
("109","Kontak","artikel/36","1","1","1","1"),
("110","Status Perkawinan","statistik/status-perkawinan","3","24","1","1"),
("52","Data Analisis","data_analisis","3","24","1","1");
CREATE TABLE `outbox` (
`UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
`SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
`SendBefore` time NOT NULL DEFAULT '23:59:59',
`SendAfter` time NOT NULL DEFAULT '00:00:00',
`Text` text,
`DestinationNumber` varchar(20) NOT NULL DEFAULT '',
`Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
`UDH` text,
`Class` int(11) DEFAULT '-1',
`TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
`MultiPart` enum('false','true') DEFAULT 'false',
`RelativeValidity` int(11) DEFAULT '-1',
`SenderID` varchar(255) DEFAULT NULL,
`SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
`DeliveryReport` enum('default','yes','no') DEFAULT 'default',
`CreatorID` text NOT NULL,
PRIMARY KEY (`ID`),
KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
KEY `outbox_sender` (`SenderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `point` (
`id` int(4) NOT NULL AUTO_INCREMENT,
`nama` varchar(50) NOT NULL,
`simbol` varchar(50) NOT NULL,
`tipe` int(4) NOT NULL,
`parrent` int(4) NOT NULL DEFAULT '1',
`enabled` int(11) NOT NULL DEFAULT '1',
PRIMARY KEY (`id`),
KEY `parrent` (`parrent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `polygon` (
`id` int(4) NOT NULL AUTO_INCREMENT,
`nama` varchar(50) NOT NULL,
`simbol` varchar(50) NOT NULL,
`color` varchar(10) NOT NULL DEFAULT 'ff0000',
`tipe` int(4) NOT NULL,
`parrent` int(4) DEFAULT '1',
`enabled` int(11) NOT NULL DEFAULT '1',
PRIMARY KEY (`id`),
KEY `parrent` (`parrent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `program` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(256) NOT NULL,
`ndesc` text NOT NULL,
`sasaran` tinyint(1) NOT NULL DEFAULT '0',
`sdate` datetime NOT NULL,
`edate` datetime NOT NULL,
`userID` int(11) NOT NULL,
`rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`status` tinyint(1) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `program_peserta` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`program_id` int(11) NOT NULL,
`peserta` decimal(18,0) NOT NULL,
`sasaran` tinyint(1) NOT NULL,
`userID` int(11) NOT NULL,
`rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `sentitems` (
`UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
`SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
`DeliveryDateTime` timestamp NULL DEFAULT NULL,
`Text` text NOT NULL,
`DestinationNumber` varchar(20) NOT NULL DEFAULT '',
`Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
`UDH` text NOT NULL,
`SMSCNumber` varchar(20) NOT NULL DEFAULT '',
`Class` int(11) NOT NULL DEFAULT '-1',
`TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL DEFAULT '0',
`SenderID` varchar(255) NOT NULL,
`SequencePosition` int(11) NOT NULL DEFAULT '1',
`Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
`StatusError` int(11) NOT NULL DEFAULT '-1',
`TPMR` int(11) NOT NULL DEFAULT '-1',
`RelativeValidity` int(11) NOT NULL DEFAULT '-1',
`CreatorID` text NOT NULL,
PRIMARY KEY (`ID`,`SequencePosition`),
KEY `sentitems_date` (`DeliveryDateTime`),
KEY `sentitems_tpmr` (`TPMR`),
KEY `sentitems_dest` (`DestinationNumber`),
KEY `sentitems_sender` (`SenderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `setting_modul` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`modul` varchar(50) NOT NULL,
`url` varchar(50) NOT NULL,
`aktif` tinyint(1) NOT NULL DEFAULT '0',
`ikon` varchar(50) NOT NULL,
`urut` tinyint(4) NOT NULL,
`level` tinyint(1) NOT NULL DEFAULT '2',
`hidden` tinyint(1) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
INSERT INTO setting_modul VALUES
("1","SID Home","hom_desa","1","go-home-5.png","1","2","1"),
("2","Penduduk","penduduk/clear","1","preferences-contact-list.png","2","2","0"),
("3","Statistik","statistik","1","statistik.png","3","2","0"),
("4","Cetak Surat","surat","1","applications-office-5.png","4","2","0"),
("5","Analisis","analisis_master/clear","1","analysis.png","5","2","0"),
("6","Bantuan","program_bantuan","2","program.png","6","2","0"),
("7","Persil","data_persil/clear","2","persil.png","7","2","0"),
("8","Plan","plan","2","plan.png","8","2","0"),
("9","Peta","gis","2","gis.png","9","2","0"),
("10","SMS","sms","2","mail-send-receive.png","10","2","0"),
("11","Pengguna","man_user/clear","1","system-users.png","11","1","1"),
("12","Database","database","1","database.png","12","1","0"),
("13","Admin Web","web","1","message-news.png","13","4","0"),
("14","Laporan","lapor","1","mail-reply-all.png","14","2","0");
CREATE TABLE `setting_sms` (
`autoreply_text` varchar(160) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO setting_sms VALUES
("Terima kasih pesan Anda telah kami terima.");
CREATE TABLE `sys_traffic` (
`Tanggal` date NOT NULL,
`ipAddress` text NOT NULL,
`Jumlah` int(10) NOT NULL,
PRIMARY KEY (`Tanggal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `tweb_alamat_sekarang` (
`id` int(11) NOT NULL,
`jalan` varchar(100) NOT NULL,
`rt` varchar(100) NOT NULL,
`rw` varchar(100) NOT NULL,
`dusun` varchar(100) NOT NULL,
`desa` varchar(100) NOT NULL,
`kecamatan` varchar(100) NOT NULL,
`kabupaten` varchar(100) NOT NULL,
`provinsi` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `tweb_cacat` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(100) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
INSERT INTO tweb_cacat VALUES
("1","CACAT FISIK"),
("2","CACAT NETRA/BUTA"),
("3","CACAT RUNGU/WICARA"),
("4","CACAT MENTAL/JIWA"),
("5","CACAT FISIK DAN MENTAL"),
("6","CACAT LAINNYA"),
("7","TIDAK CACAT");
CREATE TABLE `tweb_desa_pamong` (
`pamong_id` int(5) NOT NULL AUTO_INCREMENT,
`pamong_nama` varchar(100) DEFAULT NULL,
`pamong_nip` varchar(20) DEFAULT NULL,
`pamong_nik` varchar(20) DEFAULT NULL,
`jabatan` varchar(50) DEFAULT '0',
`pamong_status` varchar(45) DEFAULT NULL,
`pamong_tgl_terdaftar` date DEFAULT NULL,
PRIMARY KEY (`pamong_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
INSERT INTO tweb_desa_pamong VALUES
("1","Jarwo","","","Kepala Desa","1","2015-05-19"),
("2","Jarwo","","","(A/n) Kepala Desa","1","2015-05-19");
CREATE TABLE `tweb_golongan_darah` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(15) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
INSERT INTO tweb_golongan_darah VALUES
("1","A"),
("2","B"),
("3","AB"),
("4","O"),
("5","A+"),
("6","A-"),
("7","B+"),
("8","B-"),
("9","AB+"),
("10","AB-"),
("11","O+"),
("12","O-"),
("13","TIDAK TAHU");
CREATE TABLE `tweb_keluarga` (
`id` int(10) NOT NULL AUTO_INCREMENT,
`no_kk` varchar(160) DEFAULT NULL,
`nik_kepala` varchar(200) DEFAULT NULL,
`tgl_daftar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`kelas_sosial` int(4) DEFAULT NULL,
`raskin` int(4) NOT NULL DEFAULT '2',
`id_bedah_rumah` int(2) NOT NULL DEFAULT '2',
`id_pkh` int(2) NOT NULL DEFAULT '2',
`id_blt` int(2) NOT NULL DEFAULT '2',
PRIMARY KEY (`id`),
KEY `nik_kepala` (`nik_kepala`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `tweb_penduduk` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(100) NOT NULL,
`nik` decimal(16,0) NOT NULL,
`id_kk` int(11) DEFAULT '0',
`kk_level` tinyint(2) NOT NULL DEFAULT '0',
`id_rtm` int(11) NOT NULL,
`rtm_level` int(11) NOT NULL,
`sex` tinyint(4) unsigned DEFAULT NULL,
`tempatlahir` varchar(100) NOT NULL,
`tanggallahir` date NOT NULL,
`agama_id` int(10) unsigned NOT NULL,
`pendidikan_kk_id` int(10) unsigned NOT NULL,
`pendidikan_id` int(10) unsigned NOT NULL,
`pendidikan_sedang_id` int(10) unsigned NOT NULL,
`pekerjaan_id` int(10) unsigned NOT NULL,
`status_kawin` tinyint(4) unsigned NOT NULL,
`warganegara_id` int(10) unsigned NOT NULL,
`dokumen_pasport` varchar(45) DEFAULT NULL,
`dokumen_kitas` int(10) DEFAULT NULL,
`ayah_nik` varchar(16) NOT NULL,
`ibu_nik` varchar(16) NOT NULL,
`nama_ayah` varchar(100) NOT NULL,
`nama_ibu` varchar(100) NOT NULL,
`foto` varchar(100) NOT NULL,
`golongan_darah_id` int(11) NOT NULL,
`id_cluster` int(11) NOT NULL,
`status` int(10) unsigned DEFAULT NULL,
`alamat_sebelumnya` varchar(200) NOT NULL,
`alamat_sekarang` varchar(200) NOT NULL,
`status_dasar` tinyint(4) NOT NULL DEFAULT '1',
`hamil` int(1) DEFAULT NULL,
`cacat_id` int(11) DEFAULT NULL,
`sakit_menahun_id` int(11) NOT NULL,
`jamkesmas` int(11) NOT NULL DEFAULT '2',
`akta_lahir` varchar(40) NOT NULL,
`akta_perkawinan` varchar(40) NOT NULL,
`tanggalperkawinan` date NOT NULL,
`akta_perceraian` varchar(40) NOT NULL,
`tanggalperceraian` date NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `tweb_penduduk_agama` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(100) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO tweb_penduduk_agama VALUES
("1","ISLAM"),
("2","KRISTEN"),
("3","KATHOLIK"),
("4","HINDU"),
("5","BUDHA"),
("6","KHONGHUCU"),
("7","Kepercayaan Terhadap Tuhan YME / Lainnya");
CREATE TABLE `tweb_penduduk_hubungan` (
`id` int(10) NOT NULL AUTO_INCREMENT,
`nama` varchar(100) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO tweb_penduduk_hubungan VALUES
("1","KEPALA KELUARGA"),
("2","SUAMI"),
("3","ISTRI"),
("4","ANAK"),
("5","MENANTU"),
("6","CUCU"),
("7","ORANGTUA"),
("8","MERTUA"),
("9","FAMILI LAIN"),
("10","PEMBANTU"),
("11","LAINNYA");
CREATE TABLE `tweb_penduduk_kawin` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(100) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO tweb_penduduk_kawin VALUES
("1","BELUM KAWIN"),
("2","KAWIN"),
("3","CERAI HIDUP"),
("4","CERAI MATI");
CREATE TABLE `tweb_penduduk_mandiri` (
`nik` varchar(20) NOT NULL,
`pin` varchar(60) NOT NULL,
`tanggal_buat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`last_login` datetime NOT NULL,
UNIQUE KEY `nik` (`nik`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `tweb_penduduk_map` (
`id` int(11) NOT NULL,
`lat` varchar(24) NOT NULL,
`lng` varchar(24) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `tweb_penduduk_pekerjaan` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(100) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO tweb_penduduk_pekerjaan VALUES
("1","BELUM/TIDAK BEKERJA"),
("2","MENGURUS RUMAH TANGGA"),
("3","PELAJAR/MAHASISWA"),
("4","PENSIUNAN"),
("5","PEGAWAI NEGERI SIPIL (PNS)"),
("6","TENTARA NASIONAL INDONESIA (TNI)"),
("7","KEPOLISIAN RI (POLRI)"),
("8","PERDAGANGAN"),
("9","PETANI/PERKEBUNAN"),
("10","PETERNAK"),
("11","NELAYAN/PERIKANAN"),
("12","INDUSTRI"),
("13","KONSTRUKSI"),
("14","TRANSPORTASI"),
("15","KARYAWAN SWASTA"),
("16","KARYAWAN BUMN"),
("17","KARYAWAN BUMD"),
("18","KARYAWAN HONORER"),
("19","BURUH HARIAN LEPAS"),
("20","BURUH TANI/PERKEBUNAN"),
("21","BURUH NELAYAN/PERIKANAN"),
("22","BURUH PETERNAKAN"),
("23","PEMBANTU RUMAH TANGGA"),
("24","TUKANG CUKUR"),
("25","TUKANG LISTRIK"),
("26","TUKANG BATU"),
("27","TUKANG KAYU"),
("28","TUKANG SOL SEPATU"),
("29","TUKANG LAS/PANDAI BESI"),
("30","TUKANG JAHIT"),
("31","TUKANG GIGI"),
("32","PENATA RIAS"),
("33","PENATA BUSANA"),
("34","PENATA RAMBUT"),
("35","MEKANIK"),
("36","SENIMAN"),
("37","TABIB"),
("38","PARAJI"),
("39","PERANCANG BUSANA"),
("40","PENTERJEMAH"),
("41","IMAM MASJID"),
("42","PENDETA"),
("43","PASTOR"),
("44","WARTAWAN"),
("45","USTADZ/MUBALIGH"),
("46","JURU MASAK"),
("47","PROMOTOR ACARA"),
("48","ANGGOTA DPR-RI"),
("49","ANGGOTA DPD"),
("50","ANGGOTA BPK"),
("51","PRESIDEN"),
("52","WAKIL PRESIDEN"),
("53","ANGGOTA MAHKAMAH KONSTITUSI"),
("54","ANGGOTA KABINET KEMENTERIAN"),
("55","DUTA BESAR"),
("56","GUBERNUR"),
("57","WAKIL GUBERNUR"),
("58","BUPATI"),
("59","WAKIL BUPATI"),
("60","WALIKOTA"),
("61","WAKIL WALIKOTA"),
("62","ANGGOTA DPRD PROVINSI"),
("63","ANGGOTA DPRD KABUPATEN/KOTA"),
("64","DOSEN"),
("65","GURU"),
("66","PILOT"),
("67","PENGACARA"),
("68","NOTARIS"),
("69","ARSITEK"),
("70","AKUNTAN"),
("71","KONSULTAN"),
("72","DOKTER"),
("73","BIDAN"),
("74","PERAWAT"),
("75","APOTEKER"),
("76","PSIKIATER/PSIKOLOG"),
("77","PENYIAR TELEVISI"),
("78","PENYIAR RADIO"),
("79","PELAUT"),
("80","PENELITI"),
("81","SOPIR"),
("82","PIALANG"),
("83","PARANORMAL"),
("84","PEDAGANG"),
("85","PERANGKAT DESA"),
("86","KEPALA DESA"),
("87","BIARAWATI"),
("88","WIRASWASTA"),
("89","LAINNYA");
CREATE TABLE `tweb_penduduk_pendidikan` (
`id` tinyint(3) NOT NULL AUTO_INCREMENT,
`nama` varchar(50) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO tweb_penduduk_pendidikan VALUES
("1","BELUM MASUK TK/KELOMPOK BERMAIN"),
("2","SEDANG TK/KELOMPOK BERMAIN"),
("3","TIDAK PERNAH SEKOLAH"),
("4","SEDANG SD/SEDERAJAT"),
("5","TIDAK TAMAT SD/SEDERAJAT"),
("6","SEDANG SLTP/SEDERAJAT"),
("7","SEDANG SLTA/SEDERAJAT"),
("8","SEDANG D-1/SEDERAJAT"),
("9","SEDANG D-2/SEDERAJAT"),
("10","SEDANG D-3/SEDERAJAT"),
("11","SEDANG S-1/SEDERAJAT"),
("12","SEDANG S-2/SEDERAJAT"),
("13","SEDANG S-3/SEDERAJAT"),
("14","SEDANG SLB A/SEDERAJAT"),
("15","SEDANG SLB B/SEDERAJAT"),
("16","SEDANG SLB C/SEDERAJAT"),
("17","TIDAK DAPAT MEMBACA DAN MENULIS"),
("18","TIDAK SEDANG SEKOLAH");
CREATE TABLE `tweb_penduduk_pendidikan_kk` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(50) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO tweb_penduduk_pendidikan_kk VALUES
("1","TIDAK / BELUM SEKOLAH"),
("2","BELUM TAMAT SD/SEDERAJAT"),
("3","TAMAT SD / SEDERAJAT"),
("4","SLTP/SEDERAJAT"),
("5","SLTA / SEDERAJAT"),
("6","DIPLOMA I / II"),
("7","AKADEMI/ DIPLOMA III/S. MUDA"),
("8","DIPLOMA IV/ STRATA I"),
("9","STRATA II"),
("10","STRATA III");
CREATE TABLE `tweb_penduduk_sex` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(15) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
INSERT INTO tweb_penduduk_sex VALUES
("1","LAKI-LAKI"),
("2","PEREMPUAN");
CREATE TABLE `tweb_penduduk_status` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(50) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
INSERT INTO tweb_penduduk_status VALUES
("1","TETAP"),
("2","TIDAK AKTIF"),
("3","PENDATANG");
CREATE TABLE `tweb_penduduk_umur` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(25) DEFAULT NULL,
`dari` int(11) DEFAULT NULL,
`sampai` int(11) DEFAULT NULL,
`status` int(11) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
INSERT INTO tweb_penduduk_umur VALUES
("1","BALITA","0","5","0"),
("2","ANAK-ANAK","6","17","0"),
("3","DEWASA","18","30","0"),
("4","TUA","31","120","0"),
("6","Dibawah 1 Tahun","0","1","1"),
("9","2 s/d 4 Tahun","2","4","1"),
("12","5 s/d 9 Tahun","5","9","1"),
("13","10 s/d 14 Tah","10","14","1"),
("14","15 s/d 19 Tahun","15","19","1"),
("15","20 s/d 24 Tahun","20","24","1"),
("16","25 s/d 29 Tahun","25","29","1"),
("17","30 s/d 34 Tahun","30","34","1"),
("18","35 s/d 39 Tahun ","35","39","1"),
("19","40 s/d 44 Tahun","40","44","1"),
("20","45 s/d 49 Tahun","45","49","1"),
("21","50 s/d 54 Tahun","50","54","1"),
("22","55 s/d 59 Tahun","55","59","1"),
("23","60 s/d 64 Tahun","60","64","1"),
("24","65 s/d 69 Tahun","65","69","1"),
("25","70 s/d 74 Tahun","70","74","1"),
("26","Diatas 75 Tahun","75","99999","1");
CREATE TABLE `tweb_penduduk_warganegara` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(25) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
INSERT INTO tweb_penduduk_warganegara VALUES
("1","WNI"),
("2","WNA"),
("3","DUA KEWARGANEGARAAN");
CREATE TABLE `tweb_rtm` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nik_kepala` int(11) NOT NULL,
`no_kk` varchar(20) NOT NULL,
`tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`kelas_sosial` int(11) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `tweb_rtm_hubungan` (
`id` tinyint(4) NOT NULL AUTO_INCREMENT,
`nama` varchar(20) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
INSERT INTO tweb_rtm_hubungan VALUES
("1","Kepala Rumah Tangga"),
("2","Anggota");
CREATE TABLE `tweb_sakit_menahun` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
INSERT INTO tweb_sakit_menahun VALUES
("1","JANTUNG"),
("2","LEVER"),
("3","PARU-PARU"),
("4","KANKER"),
("5","STROKE"),
("6","DIABETES MELITUS"),
("7","GINJAL"),
("8","MALARIA"),
("9","LEPRA/KUSTA"),
("10","HIV/AIDS"),
("11","GILA/STRESS"),
("12","TBC"),
("13","ASTHMA"),
("14","TIDAK ADA/TIDAK SAKIT");
CREATE TABLE `tweb_status_dasar` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nama` varchar(50) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO tweb_status_dasar VALUES
("1","HIDUP"),
("2","MATI"),
("3","PINDAH"),
("4","HILANG");
CREATE TABLE `tweb_surat_atribut` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`id_surat` int(11) NOT NULL,
`id_tipe` tinyint(4) NOT NULL,
`nama` varchar(40) NOT NULL,
`long` tinyint(4) NOT NULL,
`kode` tinyint(4) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `tweb_surat_format` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nama` varchar(100) NOT NULL,
`url_surat` varchar(100) NOT NULL,
`kode_surat` varchar(10) NOT NULL,
`kunci` tinyint(1) NOT NULL DEFAULT '0',
`favorit` tinyint(1) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
INSERT INTO tweb_surat_format VALUES
("1","Keterangan","surat_ket_pengantar","F1","0","1"),
("2","Keterangan Domisili","surat_ket_penduduk","FS-00X/DES","0","1"),
("3","Biodata Penduduk","surat_bio_penduduk","FS-00X/DES","1","0"),
("5","Keterangan Pindah Penduduk","surat_ket_pindah_penduduk","FS-00X/DES","1","0"),
("6","Keterangan Jual Beli","surat_ket_jual_beli","FS-00X/DES","1","0"),
("7","Pengantar Pindah Antar Kabupaten/ Provinsi","surat_pindah_antar_kab_prov","FS-00X/DES","1","0"),
("8","Pengantar SKCK","surat_ket_catatan_kriminal","FS-00X/DES","0","1"),
("9","Keterangan KTP dalam Proses","surat_ket_ktp_dlm_proses","FS-00X/DES","1","0"),
("10","Keterangan Beda Nama","surat_ket_beda_nama","FS-00X/DES","0","1"),
("11","Keterangan Bepergian / Jalan","surat_jalan","FS-00X/DES","0","1"),
("12","Keterangan Kurang Mampu","surat_ket_kurang_mampu","FS-00X/DES","0","1"),
("13","Pengantar Izin Keramaian","surat_izin_keramaian","FS-00X/DES","0","1"),
("16","Keterangan JAMKESOS","surat_ket_jamkesos","FS-00X/DES","1","0"),
("17","Keterangan Domisili Usaha","surat_ket_domisili_usaha","FS-00X/DES","0","1"),
("49","Kuasa AKTA Kematian","surat_kuasa_akta_kematian","F8","0","1"),
("19","Keterangan Kehilangan","surat_ket_kehilangan","FS-00X/DES","0","1"),
("20","Pengantar AKTA Kelahiran","surat_permohonan_akta","FS-00X/DES","0","1"),
("22","Keterangan Kelahiran","surat_permohonan_duplikat_kelahiran","F-2.02","0","1"),
("47","Keterangan Belum Masuk Database","surat_ket_blm_masuk_database","F7","1","0"),
("25","Keterangan Lahir Mati","surat_ket_lahir_mati","FS-00X/DES","1","0"),
("26","Pengantar Nikah Perempuan","surat_ket_nikah","FS-00X/DES","0","1"),
("51","Ket Kematian Suami Istri","surat_ket_kematian_suami_istri","Model N6","0","0"),
("50","Izin Orangtua","surat_izin_orangtua","Model N5","0","1"),
("48","Permohonan KTP","surat_permohonan_ktp","F-1.07","1","0"),
("33","Pengantar Nikah Laki-laki","surat_ket_pergi_kawin","FS-00X/DES","0","1"),
("34","Keterangan Wali Nikah","surat_wali","FS-00X/DES","0","1"),
("35","Keterangan Wali Hakim","surat_wali_hakim","FS-00X/DES","1","0"),
("36","Pengantar Permohonan Kutipan II Surat Nikah","surat_permohonan_duplikat_surat_nikah","FS-00X/DES","0","1"),
("37","Permohonan Cerai","surat_permohonan_cerai","FS-00X/DES","1","0"),
("38","Keterangan Pengantar Rujuk/Cerai","surat_ket_rujuk_cerai","FS-00X/DES","1","0"),
("39","Ubah Sesuaikan","surat_ubah_sesuaikan","FS-00X/DES","1","0"),
("41","Pengantar KTP Terbaru","surat_pengantar_ktp_terbaru","F2","1","0"),
("43","Keterangan Miskin","surat_keterangan_miskin","F4","0","1"),
("44","Pengantar Akta Kematian","surat_pengantar_akta_kematian","F5","0","1"),
("45","Keterangan Penghasilan","surat_keterangan_penghasilan","F6","0","1"),
("46","Keterangan Kematian","surat_permohonan_duplikat_kematian","F-2.16","0","1"),
("52","Keterangan Domisili","surat_keterangan_domisili","KK99","0","0");
CREATE TABLE `tweb_wil_clusterdesa` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`rt` varchar(10) NOT NULL DEFAULT '0',
`rw` varchar(10) NOT NULL DEFAULT '0',
`dusun` varchar(50) NOT NULL DEFAULT '0',
`id_kepala` int(11) NOT NULL,
`lat` varchar(20) NOT NULL,
`lng` varchar(20) NOT NULL,
`zoom` int(5) NOT NULL,
`path` text NOT NULL,
`map_tipe` varchar(20) NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `rt` (`rt`,`rw`,`dusun`),
KEY `id_kepala` (`id_kepala`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `user` (
`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
`username` varchar(100) NOT NULL,
`password` varchar(40) NOT NULL,
`id_grup` int(5) NOT NULL,
`email` varchar(100) NOT NULL,
`last_login` datetime NOT NULL,
`active` tinyint(1) unsigned DEFAULT '0',
`nama` varchar(50) DEFAULT NULL,
`company` varchar(100) DEFAULT NULL,
`phone` varchar(20) DEFAULT NULL,
`foto` varchar(100) NOT NULL,
`session` varchar(40) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
CREATE TABLE `user_grup` (
`id` tinyint(4) NOT NULL,
`nama` varchar(20) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO user_grup VALUES
("1","Administrator"),
("2","Operator"),
("3","Redaksi"),
("4","Kontributor");

INSERT INTO `user` (`id`, `username`, `password`, `id_grup`, `email`, `last_login`, `active`, `nama`, `company`, `phone`, `foto`, `session`) VALUES
(1, 'admin', '8d1762d8e2152172ed72c86b99483e4d', 1, 'admin@localhost', '2016-09-30 04:25:33', 1, 'Administrator', 'ADMIN', '0123456789', '', '898949e790996edab764cf8c4113a307');