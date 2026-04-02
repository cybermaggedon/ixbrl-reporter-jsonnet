#
# This makefile is for two targets and builds them everytime
#

#
# use the following command eg
# make -f Makefile
# or
# make -f Makefile  JSONNET_DATA=../ixbrl-reporter-jsonnet
#
# The first assumes your current directory is ixbrl-reporter-jsonnet.
# The second assumes that
# you are supplying the path to the directory ixbrl-reporter-jsonnet.
#

# limitation, does not leave a garbage xyz.json file

TEMPLATE=my_accounts
#INPUTS=$(wildcard ${TEMPLATE}/*)
JSONNET ?= ../ixbrl-reporter-jsonnet
GNUCASH_FILE=real-world/real-world.gnucash
CT_SRC=my_accounts/corptax.jsonnet  my_accounts/comps-ct.jsonnet my_accounts/mapping-ct.jsonnet my_accounts/metadata-ct.jsonnet
CH_SRC=my_accounts/accts.jsonnet my_accounts/comps-accts.jsonnet my_accounts/logo.jsonnet\
	my_accounts/mapping-accts.jsonnet my_accounts/metadata.jsonnet my_accounts/signature.jsonnet






all: corptax.xhtml  accts.xhtml 


corptax.xhtml: corptax.json ${GNUCASH_FILE}
accts.xhtml: accts.json ${GNUCASH_FILE}
corptax.json: ${CT_SRC}
accts.json: ${CH_SRC}

#FORCE:

%.xhtml: %.json # FORCE
	ixbrl-reporter $< report ixbrl > $@

%.json: ${TEMPLATE}/%.jsonnet
	jsonnet $< -J ${JSONNET}  > $@






############################################################
# Companies House trial to fetch - and confirm credentials #
############################################################
# assumes in python venv
ch-trial: ch-filing-config.json    accts.xhtml
	cd ../companies-house-filing && python -m ch_filing  -c ../my-accounts/ch-filing-config.json --state ../my-accounts/state.json  --get-company-data
	ls -ltr ../companies-house-filing



#
# Legally binding submission
#
companies-house-submit-accounts: ch-filing-config.json
	cd ../companies-house-filing && python -m ch_filing   -c ../my-accounts/ch-filing-config.json --state ../my-accounts/state.json --accounts ../my-accounts/accts.xhtml --submit


# call this by `make -f Makefile companies-house-check-submission SUBMISSION_ID=S00001`
# SUBMISSION_ID is returned from companies house when calling 'make companies-house-submit-accounts'
SUBMISSION_ID?=S00001
companies-house-check-submission: ch-filing-config.json
	cd ../companies-house-filing && python -m ch_filing    -c ../my-accounts/ch-filing-config.json --state ../my-accounts/state.json    -G -i ${SUBMISSION_ID}



########################################
# Credentials (and dates)
########################################
# Create the Companies House credentials
# WARNING: ch-filing-config.json should not be version controlled, neither should credentials/ch-pw.jsonnet
# both contain a password
ch-filing-config.json: credentials/ch-filing-config.jsonnet    credentials/ch-local-credentials.jsonnet   credentials/ch-pw.jsonnet
	jsonnet $<   > $@




########################################
# Corporation Tax - CT600 form
########################################

ct600:

CT600_SPEC=spec-ct600-2025-v3.json
CT600_TEMPLATE=CT600-2025-v3.pdf
ct600-fill:
	cd ../ct600-fill && export PYTHONPATH=../ixbrl-parse//:$$PYTHONPATH && python ct600_fill --ct600 ${CT600_TEMPLATE}  --spec ${CT600_SPEC} --input ../my-accounts/form-values.yaml --output ../output.pdf




############################################################
# Corporate Tax trial to confirm credentials               #
# and trial submission                                     #
############################################################
ct-trial:                   corptax.xhtml   ct-filing-config-TIL.json    accts.xhtml   ct600-fill
	cd ../ct600 && export PYTHONPATH=../ixbrl-parse//:$$PYTHONPATH && python -m ct600 --config ../my-accounts/ct-filing-config-TIL.json --accounts ../my-accounts/accts.xhtml --computations ../my-accounts/corptax.xhtml --form-values  ../my-accounts/form-values.yaml --submit


############################################################
# Corporate Tax trial to confirm credentials               #
# and trial submission, with a readable output             #
############################################################
TMPF=/tmp/ct-trial.log
ct-trial-formatted:         corptax.xhtml   ct-filing-config-TIL.json        accts.xhtml   ct600-fill
	- cd ../ct600 && export PYTHONPATH=../ixbrl-parse//:$$PYTHONPATH && python -m ct600 --config ../my-accounts/ct-filing-config-TIL.json --accounts ../my-accounts/accts.xhtml --computations ../my-accounts/corptax.xhtml --form-values  ../my-accounts/form-values.yaml --submit  > ${TMPF}
	# report if successful, or show the errors
	grep "was successful." ${TMPF} || ( grep  '<'  ${TMPF} | xmllint --format - )




#
# Showing tags in a formatted manner
#
#    assumes ixbrl-parse installed
#
show-tags: corptax.xhtml
	ixbrl-dump ../my-accounts/corptax.xhtml





#
# Legally binding submission
#
corporation-tax-submission: corptax.xhtml   ct-filing-config-live.json   accts.xhtml   ct600-fill
	cd ../ct600 && export PYTHONPATH=../ixbrl-parse//:$$PYTHONPATH && python -m ct600 --config ../my-accounts/ct-filing-config-live.json --accounts ../my-accounts/accts.xhtml --computations ../my-accounts/corptax.xhtml --form-values  ../my-accounts/form-values.yaml --submit  > ${TMPF}
	# report if successful, or show the errors
	grep "was successful." ${TMPF} || ( grep  '<'  ${TMPF} | xmllint --format - )



# Create the Corporate Tax Credentials json file, used by ct600
# WARNING: ct-filing-config-TIL.json should not be version controlled, neither should credentials/ct-pw.jsonnet
# both contain a password
ct-filing-config-TIL.json:   credentials/ct-filing-config-TIL.jsonnet   credentials/ct-local-credentials.jsonnet   credentials/ct-pw.jsonnet
	jsonnet $<   > $@


# Create the Corporate Tax Credentials json file, used by ct600
# WARNING: ct-filing-config-live.json should not be version controlled, neither should credentials/ct-pw.jsonnet
# both contain a password
ct-filing-config-live.json:   credentials/ct-filing-config-live.jsonnet   credentials/ct-local-credentials.jsonnet   credentials/ct-pw.jsonnet
	jsonnet $<   > $@






#****************************************
#  Utility
#****************************************/

clean: 
	- rm -f *.xhtml *.json
	#gnucash logs and backups
	- rm -f *.log     *gnucash.*.gnucash

accts-rebuild.xhtml: clean all
