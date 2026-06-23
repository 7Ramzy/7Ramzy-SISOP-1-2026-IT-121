# SISOP-1-2026-IT-121

## Alif Ramzy Pasha Firdaus

### soal 1 sisop
```
#!/bin/bash

awk -v soal="$2" 'BEGIN {
    FS = ","
    count_passenger = 0
    carriage_count  = 0
    oldest          = ""
    max_age         = 0
    total_age       = 0
    business_passenger = 0
}
NR == 1 { next }
{
    count_passenger++
    if (!seen_carriage[$4]++) {
        carriage_count++
    }
    age = $2 + 0
    if (age > max_age) {
        max_age = age
        oldest  = $1
    }
    total_age += age
    if ($3 == "Business") {
        business_passenger++
    }
}
END {
    if (soal == "a") {
        print "Jumlah seluruh penumpang KANJ adalah " count_passenger " orang"
    } else if (soal == "b") {
        print "Jumlah gerbong penumpang KANJ adalah " carriage_count
    } else if (soal == "c") {
        print oldest " adalah penumpang kereta tertua dengan usia " max_age " tahun"
    } else if (soal == "d") {
        average_age = int(total_age / count_passenger)
        print "Rata-rata usia penumpang adalah " average_age " tahun"
    } else if (soal == "e") {
        print "Jumlah penumpang business class ada " business_passenger " orang"
    } else {
        print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
        print "Contoh penggunaan: awk -f KANJ.sh data.csv a"
    }
}' "$1"
```
### penjelasan
```
#!/bin/bash
awk -v soal="$2" '...' "$1"
```
Baris #!/bin/bash menandakan ini adalah bash script. AWK dipanggil dengan -v soal="$2" untuk mengirim pilihan soal (a/b/c/d/e) ke dalam AWK, dan "$1" adalah file CSV yang dibaca. Jadi saat kamu ketik bash KANJ.sh passenger.csv a, maka $1=passenger.csv dan $2=a.

```
BEGIN {
    FS = ","
    count_passenger = 0
    carriage_count  = 0
    ...
}
```
Dijalankan sebelum membaca file. FS="," memberi tahu AWK bahwa pemisah kolom adalah koma (karena CSV). Semua variabel disiapkan dari nilai 0/kosong.

```
NR == 1 { next }
{
    count_passenger++
    if (!seen_carriage[$4]++) carriage_count++
    age = $2 + 0
    if (age > max_age) { max_age = age; oldest = $1 }
    total_age += age
    if ($3 == "Business") business_passenger++
}
```
NR==1 melewati baris header. Lalu tiap baris data diproses: menghitung total penumpang, gerbong unik (pakai array seen_carriage), mencari usia tertua, menjumlah semua usia, dan menghitung penumpang Business Class. Kolom dibaca sebagai $1=Nama, $2=Usia, $3=Kursi Kelas, $4=Gerbong.

```
END {
    if (soal == "a") print "Jumlah seluruh penumpang KANJ adalah " count_passenger " orang"
    else if (soal == "b") print "Jumlah gerbong penumpang KANJ adalah " carriage_count
    ...
    else { print "Soal tidak dikenali..." }
}
```
Dijalankan setelah semua baris selesai dibaca. Menampilkan hasil sesuai pilihan soal. Kalau input bukan a-e, menampilkan pesan error beserta contoh penggunaan.

#### output
![](https://github.com/7Ramzy/7Ramzy-SISOP-1-2026-IT-121/blob/41e2e3d68358af51fbcd0aae7a127044db49ad65/aset/Screenshot%202026-06-23%20163718.png)

Jumlah penumpang

![]()
![]()
![]()
![]()
![]()
![]()
