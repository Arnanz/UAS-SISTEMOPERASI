#!/bin/bash

# Adnan Arju Maulana Pasha
# 2341720107
# UAS - Praktikum Sistem Operasi

clear

echo "===================="
echo "Program Manajer File"
echo "===================="
echo "Pilih Menu:"
echo "1. Lihat File"
echo "2. Pindah File"
echo "3. Hapus File"
echo "4. Buat File"
echo "5. Cari File Berdasarkan Ukuran"
echo "===================="
read -p "Masukkan Pilihan: " pilihan

case $pilihan in
    1) read -p "Masukkan Nama Direktori File: " dir
    if [ -d $dir ]; then
        ls $dir
    else
        echo " Direktori '$dir' Tidak Ditemukan!"
    fi
    ;;
    2) read -p "Masukkan Sumber File: " source
    read -p "Masukkan Tujuan File: " destination
    if [ -f $source ]; then
        mv $source $destination
        echo "File '$source' telah dipindahkan ke '$destination'"
    else
        echo "File '$source' Tidak Ditemukan!"
    fi
    ;;
    3) read -p "Masukkan path file yang akan dihapus: " path
    if [ -f "$path" -o -d "$path" ]; then
        rm -r $path
        echo "File '$path' Telah Dihapus!"
    else
        echo "File '$path' Tidak Ditemukan!"
    fi
    ;;
    4) read -p "Masukkan Nama File Baru: " new_file
    read -p "Masukkan isi teks: " file_content
    echo "$file_content" > $new_file
    echo " File '$new_file' Telah ditambahkan dengan isi teks: '$file_content'"
    ;;
    5) read -p "Masukkan Ukuran File yang ingin dicari (dalam KB): " file_size
    echo "File dengan ukuran lebih besar dari$file_size KB:"
    find . -type f -size +${file_size}k -exec du -h {} + awk '$1+0 > '$file_size' { print $1 "\t" $2 }'
    ;;
    *) echo "Pilihan tidak valid!"
    ;;
esac