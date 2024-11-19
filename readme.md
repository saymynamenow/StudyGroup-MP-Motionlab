# What is version Control ?

> Version Control adalah sistem yang mengelola perubahan terhadap kode atau dokumen yang dimana itu bisa di realisasikan dengan GIT.

## Fitur
>Commit : Buat menyimpan Suatu Perubahan 
>Branching : membuat sebuah cabang untuk memudahkan development
>Merging : menggabungkan satu cabang dengan cabang lain
>Revert : Mengembalikan perubah yang telah dibuat: 
Func : Mengembalikan codingan yang salah ke yang benar jika udah di commit
>Stash : Menyimpan tanpa harus di commit
Func : Kalau Testing bisa pakai stash

## Alur kerja git
```
Centralized Workflow : central branch
Featur Branch Workflow : Branch khusus untuk featur
Gitflow : Branch khusus untuk development, testing, and production
```

## Dasar Dasar Git 
```
Perintah Dasar :
git init : untuk inisialisasi
Ex : git init

git status : check status
Ex : git status

git commit -m "{message}" : untuk commit
Ex : git commit -m "{Mesaasge}"

git push : untuk push
Ex : git push -u origin main || git push origin main

git pull : Mengambil file yang ada di github (Commit terbaru)
Ex : git pull  || git pull origin main

git reset : mengembalikan ke commit tertentu

Ex : git reset --hard <Hash Commit>

git log : checking commit log
Ex : git log

git checkout -b <name branch> : create branch

git checkout <namebranch> : untuk pindah

git push --set-upstream origin a : untuk push ke github branch a

```


## Cara Menggunakan github dengan SSH
> _Cara Ini Dilakukan Di Device Windows_

```
1. Buka powershell.
2. Setelah membuka powershell bisa gunakan perintah dibawah ini.
    > shh-keygen
3. Nanti kita akan diminta menginputkan, tapi kita enter saja sampai keluar key fingerprint nya.
4. Setelah itu kita copy key fingerprint tersebut. 
5. Masuk ke website https://github.com, Profile > Setting > SSH and GPG keys.
6. Click New SSH key.
7. Masukan pada kolom tittle terserah apa saja dan pada texfield Key masukin fingerprint code yang kita copy tadi.
8. Lalu click Add SSH key.
9. Buka repo yang ingin di push lalu copy SSH nya.
10. Buka terminal di folder yang ingin di push.
11. Ketik command dibawah ini
    > git init
    > git remote add origin [SSH_KEY]
12. Finish, sekarang kalian bisa pull atau push project dari repository github itu. 
```