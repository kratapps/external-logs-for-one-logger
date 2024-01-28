alias=okext
alias_dev=okext-dev

dlrs_package_id=033av00000002pp # DLRS Logs for One Logger
medallia_xm_package_id=033av00000002t3 # Medallia Logs for One Logger

scratch-org:
	sf org create scratch --set-detault -a ${alias} -f config/project-scratch-def.json --duration-days 30
	sf package install -o ${alias} -r -w 60 -p 04t09000000vCa1 # One Logger
	sf org assign permset -o ${alias} -n "Logger_Create_Logs"
	sf package install -o -u ${alias} -r -w 60 -p 04t5e000000vmwU # One Logger Utils
	sf package install -o -u ${alias} -r -w 60 -p 04t5p000000eegF # Declarative Lookup Rollup Summaries Tool
	sf package install -o ${alias} -r -w 60 -p 04t1U000007kHHf # Medallia
	sf project deploy start -o ${alias} -d src/

deploy-dev-dlrs:
	sf project deploy start -o ${alias_dev} --test-level RunLocalTests -d src/dlrs

deploy-dev-medallia_xm:
	sf project deploy start -o ${alias_dev} --test-level RunLocalTests -d src/medallia_xm

unit-test:
	sf apex run test --code-coverage --test-level RunLocalTests --result-format human -o ${alias}

open-scratch:
	sf org open -o ${alias}

#git-tag:
#	git tag -fa latest -m ${version_name}
#	git tag -fa ${version_id} -m ${version_name}
#	git tag -fa ${version_name} -m ${version_name}
#	git push -f --tags
