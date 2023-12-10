#!/bin/bash
red="\e[1;31m";black="\e[1;30m";ver="\e[1;32m";yell="\e[1;33m"
[[ ! -e "$PREFIX/bin/encrypt" ]] && cp $(pwd)/$0 $PREFIX/bin/encrypt
encrypt(){
file=$1;nfile=$2;files="$file $nfile"
	for archz in $files; do
	[[ ! -z $archz ]] || exit 1
	done
[[ -e $file ]] || echo -e "${red}file no existe"
[[ -e $nfile ]] && echo -e "${red}ya existe un archivo con el nombre: ${yell}$nfile"
	function capauno (
	cat $file | base64 > .file
	cat .file | base32 > .filE
	cat .filE | basenc --base16 > .file
	rm .filE
	)
	function capados {
	[[ ! -e ".file" ]] && ( exit 1 ; )
	gzip .file;xz .file.gz;bzip2 .file.gz.xz;mv .file.gz.xz.bz2 $nfile;chmod +x $nfile
	}
[[ ! -z $file ]] && capauno;capados;echo -e "${ver}[✓] archivo: ${yell}$nfile${ver} encriptado [✓]"
}
decrypt(){
file=$1;nfile=$2;files="$file $nfile"
	for check in $files; do
	[[ ! -z $check ]] || exit 1
	done
[[ -e $file ]] || echo -e "${red}file no existe"
[[ -e $nfile ]] && echo -e "${red}ya existe un archivo con el nombre: ${yell}$nfile"
 function decrypt_work
 {
 cat $file | bzip2 -cd | xz -cd | gzip -cd | basenc --base16 -d | base32 -d | base64 -d > $nfile
 echo -e "${ver}[✓] archivo: ${yell}$nfile ${ver}desencriptado exitosamente [✓]" 
 }
decrypt_work
}
[[ $1 = "-e" ]] && encrypt $2 $3
[[ $1 = "-d" ]] && decrypt $2 $3
[[ $1 = @(*|"") ]] && exit 1
