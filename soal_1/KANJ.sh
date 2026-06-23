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
