#Sini Rautio, modified by Maja Ilievska
#Original Matlab code by Henrik Mannerström

library("GenomicRanges")
library("GenomicAlignments")

##1. 
# Load the experiment bam file 
chip<-readGAlignments("chr10Signal.bam")
# Change GenomicAlignments object to GenomicRanges object because it is more handy
chip<-as(chip, "GRanges")
# Align the tags by their midpoint
chip<-resize(chip, fix="center", width=1)

#Separate strands
posStrand<-chip[as.character(strand(chip))=='+']
negStrand<-chip[as.character(strand(chip))=='-']
#Remove duplicate reads. Hint: function duplicated 
posStrand<-XXX
negStrand<-XXX
#Count the total number of unique reads in the sample
size<-XXX

##2. 
#Initial distance
initial_d = 200;
#Since we have only a short region of the genome we will use all the sites to estimate d and smooth the signal by taking the running mean
smoothed_posStrand = caTools::runmean(as.vector(coverage(posStrand)$chr10)[79000000:80000000], 2*initial_d)
smoothed_negStrand = caTools::runmean(as.vector(coverage(negStrand)$chr10)[79000000:80000000], 2*initial_d);

##3.
#Calculate cross-correlation of smoothed signal and determine d such that it maximizes the cross-correlation, (d/2=shift size). Use 3* initial distance as the maximum lag. Plot the covariance against d. Hint: function ccf
temp<-ccf(XXX)
d<-XXX

##4. 
#Shift the positive and negative strand. Hint: function shift
posStrand<-XXX
negStrand<-XXX
#Combine the strands back together to get a signal
signal<-c(posStrand, negStrand)
######################################################################
##5. 
#Read the control
control<-readGAlignments("chr10Control.bam")
# Change GenomicAlignments object to GenomicRanges object because it is more handy
control<-as(control, "GRanges")
# Align the tags by their midpoint
XXX
#Separate strands and remove duplicate tags
XXX
#Count the total number of unique reads in the sample
sizeControl<-XXX
#Shift the Control reads
posStrandControl<-XXX
negStrandControl<-XXX
#Combine the strands for the control signal
Control<-c(posStrandControl,negStrandControl)

#####
##6. 
#Read genomic locations 
regions<-read.table("regions.bed")
regions<-GRanges(regions[,1], IRanges(regions[,2], regions[,3]))

#Calculate a signal in each region. Hint: function countOverlaps
counts<-countOverlaps(regions, signal)

##7.
#Calculate a global lambda, which is a mean signal of a chip sample
lambdaBG<-XXX

#Calculate a lambda with varying windows (1K,5K,10K). Hint: function countOverlaps 
regionsTemp<-resize(regions, fix="center", width=1000)
lambda1000<-XXX
lambda5000<-XXX
lambda10000<-XXX

##8.
#Asses the statistical significance of the counts for each region using the following hypothesis:
#Ho - the genomic region is not a binding site.
#H1 . the genomic region is a binding site.
#Calculate p-value for each region. Take the maximum lambda rate for the given region. 
  pvalue<-c();lambda<-c()
for(i in 1:length(regions)){
  lambda[i]<-XXX
  pvalue[i]<-XXX
}
#How many unique reads are in the samples?
XXX
##How many sites for which the null is rejected give the threshold p=1e-4?
XXX
##Plot -10*log10(pvalues) against the fold enrichment. Fold enrichment is defined in lecture slide 28.


