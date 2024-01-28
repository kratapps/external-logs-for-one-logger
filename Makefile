alias=okext
alias_dev=okext-dev

dlrs_package_id=033av00000002pp # DLRS Logs for One Logger
medallia_xm_package_id=033av00000002t3 # Medallia Logs for One Logger

scratch-org:
	sfdx force:org:create -s -a ${alias} -f config/project-scratch-def.json -d 30
	sfdx force:package:install -u ${alias} -r -w 60 -p 04t09000000vCa1 # One Logger
	sfdx force:user:permset:assign -u ${alias} -n "Logger_Create_Logs"
	sfdx force:package:install -u ${alias} -r -w 60 -p 04t5e000000vmwU # One Logger Utils
	sfdx force:package:install -u ${alias} -r -w 60 -p 04t5p000000eegF # Declarative Lookup Rollup Summaries Tool
	sfdx force:package:install -u ${alias} -r -w 60 -p 04t1U000007kHHf # Medallia
	sfdx force:source:push -u ${alias}

deploy-dev-dlrs:
	sf project deploy start -o ${alias_dev} --testlevel RunLocalTests -p src/dlrs

deploy-dev-medallia_xm:
	sfdx force:source:deploy -u ${alias_dev} --testlevel RunLocalTests -p src/medallia_xm

unit-test:
	sfdx force:apex:test:run --codecoverage --testlevel RunLocalTests --resultformat human -u ${alias}

open-scratch:
	sfdx force:org:open -u ${alias}

#git-tag:
#	git tag -fa latest -m ${version_name}
#	git tag -fa ${version_id} -m ${version_name}
#	git tag -fa ${version_name} -m ${version_name}
#	git push -f --tags
