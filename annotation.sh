outdir=${1}_prokka

prokka --prefix $1 --outdir $outdir $1

mv ${outdir}/${1}.gbk .

rm -r $outdir