alias=ext-ok

scratch-org:
	make create-scratch-org
	sfdx force:package:install -u ${alias} -r -w 60 -p 04t09000000vBvY # One Logger
	sfdx force:user:permset:assign -u ${alias} -n "Logger_Create_Logs"
	sfdx force:package:install -u ${alias} -r -w 60 -p 04t5p000000eegF # Declarative Lookup Rollup Summaries Tool
	sfdx force:package:install -u ${alias} -r -w 60 -p 04t1U000007kHHf # Medallia
	sfdx force:source:push -u ${alias}

create-scratch-org:
	sfdx force:org:create -s -a ${alias} -f config/project-scratch-def.json -d 30
	

unit-test:
	sfdx force:apex:test:run --codecoverage --testlevel RunLocalTests --resultformat human -u ${alias}

open-scratch:
	sfdx force:org:open -u ${alias}
