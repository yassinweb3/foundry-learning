build:
	forge build

test:
	forge test

coverage:
	forge coverage

deploy-local:
	forge create src/DeployPractice.sol:DeployPractice --rpc-url http://127.0.0.1:8545