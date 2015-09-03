pipeline=/cluster/project8/vyp/sofia/IlluMeta_new/scripts/pipeline_RNAseq_final.sh

referenceHuman=/home/ucbtsmo/scratchDir/sofia/human_g1k_v37.fasta.k15.s2.novoindex                             ####### novoalign human
dbHuman=/home/ucbtsmo/scratchDir/sofia/human_genomic/blastDB/human_genomic                               ####### blast database Human                                                                      
dbrRNA=/home/ucbtsmo/scratchDir/sofia/silva_rRNA/rRNA_UniVec.fasta
dbDecoy=/home/ucbtsmo/scratchDir/sofia/decoy/hs37d5.fasta
dbcustom=/home/ucbtsmo/scratchDir/sofia/sequence_database/custom_db/extractHMfromNR/custom.good.faa
delim="_"


sample=14M2468
results=/scratch2/vyp-scratch2/Morfopoulou_UCLH


if [ ! -e $results ]; then mkdir $results; fi

outDir=${results}/$sample                                                                                     ####output directory

inputFiles="2 /scratch2/vyp-scratch2/Morfopoulou_UCLH/14M2468_rawData/14M2468_R1.cat.fastq.gz /scratch2/vyp-scratch2/Morfopoulou_UCLH/14M2468_rawData/14M2468_R2.cat.fastq.gz"

scriptStep1=${outDir}/cluster_noexpCov/submission/step1.sh
scriptStep2=${outDir}/cluster_noexpCov/submission/step2.sh
scriptStep3=${outDir}/cluster_noexpCov/submission/step3.sh
scriptStep4=${outDir}/cluster_noexpCov/submission/step4.sh
scriptStep5=${outDir}/cluster_noexpCov/submission/step5.sh
scriptStep6=${outDir}/cluster_noexpCov/submission/step6.sh
scriptStep7=${outDir}/cluster_noexpCov/submission/step7.sh
scriptStep8=${outDir}/cluster_noexpCov/submission/step8.sh
scriptStep9=${outDir}/cluster_noexpCov/submission/step9.sh
scriptStep10=${outDir}/cluster_noexpCov/submission/step10.sh




###STEP1
bash ${pipeline} --script ${scriptStep1} --inputFiles ${inputFiles}  --outDir ${outDir} --sample ${sample}  --step1 TRUE --paired TRUE   ### collapsing                                                     


###STEP2
#bash ${pipeline} --script ${scriptStep2}   --outDir ${outDir} --sample ${sample}  --step2 TRUE --paired TRUE  #### QC with prinseq                                 


###STEP3
#bash ${pipeline} --script ${scriptStep3}    --reference ${referenceHuman} --outDir ${outDir} --sample ${sample}  --step3 TRUE --paired TRUE --delimiter ${delim}                                             

###STEP4                                                                                                                                                                                                    
#bash ${pipeline} --script ${scriptStep4} --db ${dbHuman} --outDir ${outDir}   --sample ${sample}  --step4 TRUE --merged FALSE  --paired TRUE --delimiter ${delim}                                            

###STEP5                                                                                                                                                                                                     
#bash ${pipeline} --script ${scriptStep5} --db ${dbrRNA} --outDir ${outDir}   --sample ${sample}  --step5 TRUE --merged FALSE  --paired TRUE --delimiter ${delim}                                             

###STEP6                                                                                                                                                                                                     
#bash ${pipeline} --script ${scriptStep6} --outDir ${outDir}  --sample $sample --step6 TRUE --merged FALSE --paired TRUE --blastnDone TRUE                                                                   

###STEP7                                                                                                                                                                                                     
#bash ${pipeline} --script ${scriptStep7} --outDir ${outDir}  --sample $sample --step7 TRUE                                                                                                                  

###STEP8                                                                                                                                                                                                    
#bash ${pipeline} --script ${scriptStep8} --outDir ${outDir}  --sample $sample --step8 TRUE                                                                                                                 

###STEP9                                                                                                                                                                                                    
#bash ${pipeline} --script ${scriptStep9} --outDir ${outDir}  --sample ${sample} --step9 TRUE --merged FALSE --blastnDone TRUE --paired TRUE                                                                 

###STEP10                                                                                                                                                                                                   
#bash ${pipeline} --script ${scriptStep10} --dbnr ${dbcustom} --outDir ${outDir} --sample $sample --step10 TRUE                                                                                              

