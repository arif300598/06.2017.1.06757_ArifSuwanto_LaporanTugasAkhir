langkah pertama
*membuat tablespace
SQL> create tablespace sistemjual
  2  datafile 'D:\ITATS\Matkul\semester4\basisdata\praktikum\sistem_jual.dbf'
  3  size 30m;

Tablespace created.

*membuat user
SQL> create user arif_06757
  2  identified by arif
  3  default tablespace arif_06757
  4  quota 30m on arif_06757;

User created.

*memberikan hak akses
SQL> grant all privileges to arif_06757;

Grant succeed.

*conect/login
SQL> conn arif_06757/arif;
Connected.

Langkah ke 2
*membuat table pegawai
SQL> create table pegawai_06757
  2  (
  3  id_pegawai integer not null,
  4  nama_depan VARCHAR2(15),
  5  nama_belakang VARCHAR2(15),
  6  Tanggal_lahir DATE,
  7  alamat VARCHAR2(100),
  8  kode_pos NUMBER(7),
  9  no_telp NUMBER(12),
 10  constraint PK_pegawai primary key (id_pegawai)
 11  );

Table created.

Langkah ke 3
*membuat table Pelanggan
SQL> create table pelanggan_06757
  2  (
  3  id_pelanggan INTEGER not null,
  4  nama_depan VARCHAR2(15),
  5  nama_belakang VARCHAR2(15),
  6  tanggal_lahir DATE,
  7  alamat VARCHAR2(100),
  8  kode_pos NUMBER(7),
  9  no_telp NUMBER(12),
 10  constraint PK_pelanggan primary key (id_pelanggan)
 11  );

Table created.

Langkah ke 4
*membuat tabel kurir
SQL> create table kurir_06757
  2  (
  3  id_kurir integer not null,
  4  nama_perusahaan VARCHAR2(16),
  5  no_telp NUMBER(12),
  6  constraint PK_kurir primary key (id_kurir)
  7  );

Table created.

Langkah ke 5
*membuat table pemasok
SQL> create table pemasok_06757
  2  (
  3  id_pemasok integer not null,
  4  nama_perusahaan VARCHAR2(15),
  5  alamat VARCHAR2(100),
  6  kode_pos NUMBER(7),
  7  no_telp NUMBER(12),
  8  constraint PK_pemasok primary key (id_pemasok)
  9  );

Table created.

Langkah ke 6
*membuat table kategori
SQL> create table kategori_06757
  2  (
  3  id_kategori integer not null,
  4  nama_kategori VARCHAR2(16),
  5  deskripsi VARCHAR2(20),
  6  constraint PK_kategori primary key (id_kategori)
  7  );

Table created.

langkah ke 7
*membuat tabel produk
SQL> create table produk_06757
  2  (
  3  id_produk integer not null,
  4  id_pemasok integer,
  5  id_kategori integer,
  6  nama_produk VARCHAR2(50),
  7  harga_satuan NUMBER(9),
  8  stok_produk NUMBER(3),
  9  constraint PK_produk primary key (id_produk),
 10  constraint FK_pemasok foreign key (id_pemasok)
 11  references pemasok_06757(id_pemasok),
 12  constraint FK_kategori foreign key (id_kategori)
 13  references kategori_06757(id_kategori)
 14  );

Table created.

langkah 8
*membuat tabel pemesanan
SQL> create table pemesanan_06757
  2  (
  3  id_pemesanan integer not null,
  4  id_pelanggan integer,
  5  id_pegawai integer,
  6  id_kurir integer,
  7  tanggal_pemesanan DATE,
  8  tanggal_pengiriman DATE,
  9  alamat_pengiriman VARCHAR2(100),
 10  harga_total NUMBER(9),
 11  constraint PK_pemesanan primary key (id_pemesanan)
 12  );

Table created.

langkah ke 9
*alter seatment

SQL> alter table pemesanan_06757
  2  add constraint FK_id_pelanggan FOREIGN KEY (id_pelanggan)
  3  references pelanggan_06757(id_pelanggan)
  4  add constraint FK_id_pegawai FOREIGN KEY (id_pegawai)
  5  references pegawai_06757(id_pegawai)
  6  add constraint FK_id_kurir FOREIGN KEY (id_kurir)
  7  references kurir_06757(id_kurir);

Table altered.

langkah 10
* detail pemesanan
SQL> create table detail_pemesanan_06757
  2  (
  3  id_produk integer not null,
  4  id_pemesanan integer,
  5  jumlah number(3),
  6  diskon float(4)
  7  );

Table created.

langkah 11

*table alter 

SQL> alter table detail_pemesanan_06757
  2  add constraint FK_id_produk FOREIGN KEY (id_produk)
  3  references produk_06757 (id_produk)
  4  add constraint FK_id_pemesanan FOREIGN KEY (id_pemesanan)
  5  references pemesanan_06757(id_pemesanan);

Table altered.

modul 2
1.langkah pertama
* insert tabel pegawai sebanyak 5 baris
SQL> insert all
  2  into pegawai_06757 (id_pegawai,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (1,'bejo','subejo',TO_DATE('01/01/1998','dd/mm/yyyy'),'boboh',69198,'083154671')
  3  into pegawai_06757 (id_pegawai,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (2,'Budi','subakti',TO_DATE('25/01/1997','dd/mm/yyyy'),'Madura',6971,'0856188881')
  4  into pegawai_06757 (id_pegawai,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (3,'Bakti','Sebakti',to_date('08/01/1995','dd/mm/yyyy'),'sidoarjo',6916,'0812324151')
  5  into pegawai_06757 (id_pegawai,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (4,'Rini','Arini',to_date('06/11/1998','dd/mm/yyyy'),'Rungkut',67911,'031267')
  6  into pegawai_06757 (id_pegawai,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (5,'Beni','Pratama',to_date('31/05/1998','dd/mm/yyyy'),'sukolilo',6901,'03147156')
  7  select 1 from dual;

5 rows created.

* tabel pelanggan
SQL> insert all
  2  into pelanggan_06757 (id_pelanggan,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (1,'tomy','maulana',to_date('31/10/1998','dd/mm/yyyy'),'lombok',6919,'0831567')
  3  into pelanggan_06757 (id_pelanggan,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (2,'indah','nuraini',to_date('25/01/1999','dd/mm/yyyy'),'madura',6971,'0821567')
  4  into pelanggan_06757 (id_pelanggan,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (3,'abdul','falah',to_date('08/01/1994','dd/mm/yyyy'),'sidoarjo',6916,'08223890')
  5  into pelanggan_06757 (id_pelanggan,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (4,'reno','ubaidillah',to_date('06/11/1998','dd/mm/yyyy'),'jupiter',6911,'082132154')
  6  into pelanggan_06757 (id_pelanggan,nama_depan,nama_belakang,tanggal_lahir,alamat,kode_pos,no_telp) values (5,'arizal','suhartono',to_date('31/05/1998','dd/mm/yyyy'),'pluto',6901,'081567')
  7  select 1 from dual;

5 rows created.

*tabel kurir
SQL> insert all
  2  into kurir_06757 (id_kurir,nama_perusahaan,no_telp) values (1,'indomart','031567')
  3  into kurir_06757 (id_kurir,nama_perusahaan,no_telp) values (2,'alfamart','0218567')
  4  into kurir_06757 (id_kurir,nama_perusahaan,no_telp) values (3,'giant','0812638')
  5  into kurir_06757 (id_kurir,nama_perusahaan,no_telp) values (4,'transmart','0821584')
  6  into kurir_06757 (id_kurir,nama_perusahaan,no_telp) values (5,'superindo','031587')
  7  select 1 from dual;

5 rows created.

*tabel pemasok
SQL> insert all
  2  into pemasok_06757 (id_pemasok,nama_perusahaan,alamat,kode_pos,no_telp) values (1,'DistriIndomart','lombok',6919,'123456789')
  3  into pemasok_06757 (id_pemasok,nama_perusahaan,alamat,kode_pos,no_telp) values (2,'DistriAlfamart','madura',6971,'23456789')
  4  into pemasok_06757 (id_pemasok,nama_perusahaan,alamat,kode_pos,no_telp) values (3,'DistriGiant','sidoarjo',6916,'3456789')
  5  into pemasok_06757 (id_pemasok,nama_perusahaan,alamat,kode_pos,no_telp) values (4,'DistriTransmart','jupiter',6911,'456789')
  6  into pemasok_06757 (id_pemasok,nama_perusahaan,alamat,kode_pos,no_telp) values (5,'DistriSuperindo','pluto',6901,'56789')
  7  select 1 from dual;

5 rows created.

*tabel kategori

SQL> insert into kategori_06757 (id_kategori,nama_kategori) values (1,'makanan');

1 row created.

SQL> insert into kategori_06757 (id_kategori,nama_kategori) values (2,'minuman');

1 row created.

SQL> insert into kategori_06757 (id_kategori,nama_kategori) values (3,'Buah-sayur');

1 row created.

SQL> insert into kategori_06757 (id_kategori,nama_kategori) values (4,'electronik');

1 row created.

SQL> insert into kategori_06757 (id_kategori,nama_kategori) values (5,'baju');

1 row created.

SQL>

*tabel produk
SQL> insert all
  2  into produk_06757 (id_produk,id_pemasok,id_kategori,nama_produk,harga_satuan,stok_produk) values (1,1,1,'indomie','2500','50')
  3  into produk_06757 (id_produk,id_pemasok,id_kategori,nama_produk,harga_satuan,stok_produk) values (2,2,2,'marimas','2000','40')
  4  into produk_06757 (id_produk,id_pemasok,id_kategori,nama_produk,harga_satuan,stok_produk) values (3,3,3,'jeruk','5000','100')
  5  into produk_06757 (id_produk,id_pemasok,id_kategori,nama_produk,harga_satuan,stok_produk) values (4,4,4,'samsung','8000000','35')
  6  into produk_06757 (id_produk,id_pemasok,id_kategori,nama_produk,harga_satuan,stok_produk) values (5,5,5,'supreme','3500','95')
  7  select 1 from dual;

5 rows created.

* tabel pemesanan
SQL> insert all
  2  into pemesanan_06757 (id_pemesanan,id_pelanggan,id_pegawai,id_kurir,tanggal_pemesanan,tanggal_pengiriman,alamat_pengiriman,harga_total) values (1,1,1,1,to_date('01/01/2017','dd/mm/yyyy'),to_date('02/01/2017','dd/mm/yyyy'),'boboh','6000')
  3  into pemesanan_06757 (id_pemesanan,id_pelanggan,id_pegawai,id_kurir,tanggal_pemesanan,tanggal_pengiriman,alamat_pengiriman,harga_total) values (2,2,2,2,to_date('02/02/2017','dd/mm/yyyy'),to_date('03/02/2017','dd/mm/yyyy'),'rungkut','50000')
  4  into pemesanan_06757 (id_pemesanan,id_pelanggan,id_pegawai,id_kurir,tanggal_pemesanan,tanggal_pengiriman,alamat_pengiriman,harga_total) values (3,3,3,3,to_date('03/03/2017','dd/mm/yyyy'),to_date('04/03/2017','dd/mm/yyyy'),'sukolilo','53000')
  5  into pemesanan_06757 (id_pemesanan,id_pelanggan,id_pegawai,id_kurir,tanggal_pemesanan,tanggal_pengiriman,alamat_pengiriman,harga_total) values (4,4,4,4,to_date('04/04/2017','dd/mm/yyyy'),to_date('05/03/2017','dd/mm/yyyy'),'sukolilo','100000')
  6  into pemesanan_06757 (id_pemesanan,id_pelanggan,id_pegawai,id_kurir,tanggal_pemesanan,tanggal_pengiriman,alamat_pengiriman,harga_total) values (5,5,5,5,to_date('05/05/2017','dd/mm/yyyy'),to_date('05/06/2017','dd/mm/yyyy'),'sukolilo','200000')
  7  select 1 from dual;

5 rows created.

*detail pemesanan
SQL> insert all
  2  into detail_pemesanan_06757 (id_produk,id_pemesanan,jumlah,diskon) values ('1','1','1','10')
  3  into detail_pemesanan_06757 (id_produk,id_pemesanan,jumlah,diskon) values ('2','2','2','20')
  4  into detail_pemesanan_06757 (id_produk,id_pemesanan,jumlah,diskon) values ('3','3','3','30')
  5  into detail_pemesanan_06757 (id_produk,id_pemesanan,jumlah,diskon) values ('4','4','4','40')
  6  into detail_pemesanan_06757 (id_produk,id_pemesanan,jumlah,diskon) values ('5','5','5','50')
  7  select 1 from dual;

5 rows created.

2.tampilkan tabel
SQL> select * from pegawai_06757;

*update
SQL> update pegawai_06757
  2  set nama_depan = 'arif',
  3  nama_belakang = 'suwanto'
  4  where id_pegawai = 1;

1 row updated.

SQL> update pegawai_06757
  2  set nama_depan = 'lee',
  3  nama_belakang = 'kurniawan'
  4  where id_pegawai = 2;

1 row updated.

3.hapus 2 record pada tabel detail pemesanan

*tampil tabel pemesanan
SQL> select * from detail_pemesanan_06757;

* hapus tabel yang di tuju
SQL> delete from detail_pemesanan_06757
  2  where id_produk = 4;

1 row deleted.

SQL> delete from detail_pemesanan_06757
  2  where id_produk = 5;

1 row deleted.

SQL>

4 
SQL> select kode_pos,alamat,no_telp,tanggal_lahir from pegawai_06757
  2  where nama_depan like '%a%' and nama_belakang like '%e%' and id_pegawai < 5;
