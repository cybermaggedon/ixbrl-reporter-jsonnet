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
JSONNET=../ixbrl-reporter-jsonnet
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


ct600:

CT600_SPEC=spec-ct600-2025-v3.json
CT600_TEMPLATE=CT600-2025-v3.pdf
ct600-fill:
	cd ../ct600-fill && export PYTHONPATH=../ixbrl-parse//:$$PYTHONPATH && python ct600_fill --ct600 ${CT600_TEMPLATE}  --spec ${CT600_SPEC} --input ../my-accounts/form-values.yaml --output ../output.pdf





# assumes in python venv
ch-trial: ch-filing-config.json
	cd ../companies-house-filing && python -m ch_filing  -c ../my-accounts/ch-filing-config.json --state ../my-accounts/state.json  --get-company-data
	ls -ltr ../companies-house-filing

ch-trial1:
	cd ../companies-house-filing && python -m ch_filing  -c ../my-accounts/ch-filing-config1.json --state ../my-accounts/state.json  --get-company-data
	ls -ltr ../companies-house-filing

ct-trial: corptax.xhtml ct-filing-config-TIL.json
	cd ../ct600 && export PYTHONPATH=../ixbrl-parse//:$$PYTHONPATH && python -m ct600 --config ../my-accounts/ct-filing-config-TIL.json --accounts ../my-accounts/accts.xhtml --computations ../my-accounts/corptax.xhtml --form-values  ../my-accounts/form-values.yaml --submit


TMPF=/tmp/ct-trial.log
ct-trial-formatted: corptax.xhtml ct-filing-config-TIL.json   accts.xhtml   ct600-fill
	cd ../ct600 && export PYTHONPATH=../ixbrl-parse//:$$PYTHONPATH && python -m ct600 --config ../my-accounts/ct-filing-config-TIL.json --accounts ../my-accounts/accts.xhtml --computations ../my-accounts/corptax.xhtml --form-values  ../my-accounts/form-values.yaml --submit  > ${TMPF}
	# report if successful, or show the errors
	grep "was successful." ${TMPF} || ( grep  '<'  ${TMPF} | xmllint --format - )

clean: 
	- rm -f *.xhtml *.json
	#gnucash logs and backups
	- rm -f *.log     *gnucash.*.gnucash

accts-rebuild.xhtml: clean all



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


# Create the Corporate Tax Credentials json file, used by ct600
# WARNING: ch-filing-config.json should not be version controlled, neither should credentials/ch-pw.jsonnet
# both contain a password
ch-filing-config.json: credentials/ch-filing-config.jsonnet    credentials/ch-local-credentials.jsonnet   credentials/ch-pw.jsonnet
	jsonnet $<   > $@

#%.json: %.jsonnet
#	jsonnet $< -J $*  > $@
