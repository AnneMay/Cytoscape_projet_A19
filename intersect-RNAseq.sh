read -p "fileA(RS): " fileA
read -p "fileB(GH): " fileB
read -p "output(prefixe): " output #exemple: i-3Au-
awk -F '\t' {'print$1"\t"$2"\t"$3"\t"$6"\t"$4"\t"$5"\t"$7'} $fileA > a$fileA
cat a$fileA $fileB > m$output\RSGH.bed
bedtools intersect -a a$fileA -b $fileB -wb -wa > $output\RSGH.bed
bedtools intersect -a a$fileA -b rR-RNAseq3A.bed -wb -wa > $output\RS-RNAseq.bed
bedtools intersect -a $fileB -b rR-RNAseq3A.bed -wa -wb > $output\GH-RNAseq.bed
bedtools intersect -a m$output\RSGH.bed -b rR-RNAseq3A.bed -wa -wb > $output\RSGH-RNAseq.bed
bedtools intersect -a $output\RSGH.bed -b rR-RNAseq3A.bed -wa -wb > $output\RS-GH-RNAseq.bed
wc -l $output\RSGH.bed
wc -l $output\RS-RNAseq.bed
wc -l $output\GH-RNAseq.bed
wc -l $output\RSGH-RNAseq.bed
wc -l $output\RS-GH-RNAseq.bed

awk -F '\t' {'print$8"\t"$9"\t"$10"\t"$12"\t"$13"\t"$11"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7'} $output\RSGH.bed > a$output\RSGH.bed
awk -F '\t' {'print$8"\t"$9"\t"$10"\t"$11"\t"$12"\t"$13"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7'} $output\RS-RNAseq.bed > a$output\RS-RNAseq.bed
awk -F '\t' {'print$1"\t"$2"\t"$3"\t"$5"\t"$6"\t"$4"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12"\t"$13'} $output\GH-RNAseq.bed > a$output\GH-RNAseq.bed
awk -F '\t' {'print$8"\t"$9"\t"$10"\t"$11"\t"$12"\t"$13"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7'} $output\RSGH-RNAseq.bed > a$output\RSGH-RNAseq.bed
awk -F '\t' {'print$15"\t"$16"\t"$17"\t"$18"\t"$13"\t"$11"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7'} $output\RS-GH-RNAseq.bed > a$output\RS-GH-RNAseq.bed
sort -k1,1 -k2,2n a$output\RSGH.bed > sa$output\RSGH.bed
sort -k1,1 -k2,2n a$output\RS-RNAseq.bed > s$output\RS-RNAseq.bed
sort -k1,1 -k2,2n a$output\GH-RNAseq.bed > s$output\GH-RNAseq.bed
sort -k1,1 -k2,2n a$output\RSGH-RNAseq.bed > s$output\RSGH-RNAseq.bed
sort -k1,1 -k2,2n a$output\RS-GH-RNAseq.bed > s$output\RS-GH-RNAseq.bed
bedtools merge -i sa$output\RSGH.bed -c 4,5,7,11 -o distinct,distinct,count,distinct -s > msa$output\RSGH.bed
bedtools merge -i s$output\RS-RNAseq.bed -c 4,5,7,11 -o distinct,distinct,count,distinct -s > ms$output\RS-RNAseq.bed
bedtools merge -i s$output\GH-RNAseq.bed -c 4,5,7,11 -o distinct,distinct,count,distinct -s > ms$output\GH-RNAseq.bed
bedtools merge -i s$output\RSGH-RNAseq.bed -c 4,5,7,11 -o distinct,distinct,count,distinct -s > ms$output\RSGH-RNAseq.bed
bedtools merge -i s$output\RS-GH-RNAseq.bed -c 4,5,7,11 -o distinct,distinct,count,distinct -s > ms$output\RS-GH-RNAseq.bed
wc -l msa$output\RSGH.bed
wc -l ms$output\RS-RNAseq.bed
wc -l ms$output\GH-RNAseq.bed
wc -l ms$output\RSGH-RNAseq.bed
wc -l ms$output\RS-GH-RNAseq.bed
mkdir -m a=rwx ~/workspace/results/$output/
mv $output\RSGH.bed ~/workspace/results/$output/
mv $output\RS-RNAseq.bed ~/workspace/results/$output/
mv $output\GH-RNAseq.bed ~/workspace/results/$output/
mv $output\RSGH-RNAseq.bed ~/workspace/results/$output/
mv $output\RS-GH-RNAseq.bed ~/workspace/results/$output/
mv msa$output\RSGH.bed ~/workspace/results/$output/
mv ms$output\RS-RNAseq.bed ~/workspace/results/$output/
mv ms$output\GH-RNAseq.bed ~/workspace/results/$output/
mv ms$output\RSGH-RNAseq.bed ~/workspace/results/$output/
mv ms$output\RS-GH-RNAseq.bed ~/workspace/results/$output/

mv *$output\RSGH.bed ~/workspace/Cross-Ref2
mv *$output\RS-RNAseq.bed ~/workspace/Cross-Ref2
mv *$output\GH-RNAseq.bed ~/workspace/Cross-Ref2
mv *$output\RSGH-RNAseq.bed ~/workspace/Cross-Ref2
mv *$output\RS-GH-RNAseq.bed ~/workspace/Cross-Ref2

mv $fileA ~/workspace/Cross-Ref2
mv $fileB ~/workspace/Cross-Ref2
echo 'end of script'
