full.dat <- bugsigdbr::importBugSigDB(version = "69586d3", cache = FALSE)
dim(full.dat)
colnames(full.dat)

is.study <- !is.na(full.dat[["Study"]])
table(is.study)
is.exp <- !is.na(full.dat[["Experiment"]])
table(is.exp)

pmids <- unique(full.dat[,"PMID"])
length(pmids)
nrow(full.dat)

# Check to see if a reasonable number are missing PMIDs (<5%)
is.na(full.dat[,"PMID"]) %>% table()

# Check for empty signatures
ind1 <- lengths(full.dat[["MetaPhlAn taxon names"]]) > 0
ind2 <- lengths(full.dat[["NCBI Taxonomy IDs"]]) > 0
table(ind1)
table(ind2)

# Papers containing only empty UP and DOWN signatures (under curation?)
setdiff(pmids, unique(dat[,"PMID"]))

# Check for study identifiers
sum(is.na(full.dat$`Study`))

# Check study design is populated
table(full.dat$`Study design`)
sum(is.na(full.dat$`Study design`))

# Check experiments
table(full.dat$Experiment)
full.dat$PMID[full.dat$Experiment==max(full.dat$Experiment)]

# Check reviewed
table(full.dat$Review, useNA="ifany")

sum(is.na(full.dat$`Host species`)) # Should not be missing
sum(is.na(full.dat$`Body site`)) # Should not be missing
sum(is.na(full.dat$`Condition`)) # Should not be missing
sum(is.na(full.dat$`Location`)) # Should not be missing (but allowable if rarely missing)
sum(is.na(full.dat$`EFO ID`)) # Should not be missing
sum(is.na(full.dat$`Group 0 sample size`)) # Should mostly be present (80-90%)
sum(is.na(full.dat$`Group 1 sample size`)) # Should mostly be present (80-90%)
sum(is.na(full.dat$`Antibiotics exclusion`)) #About 50/50 makes sense here
sum(is.na(full.dat$`Sequencing type`)) # Should not be missing (but allowable if rarely missing)
sum(is.na(full.dat$`Sequencing platform`)) # Should be rarely missing

table(full.dat$`LDA Score above`) # Should be numeric
table(full.dat$`Antibiotics exclusion`) # A mess, should be cleaned up
