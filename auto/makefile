DICOM_TEST_FILES := /net/qa-fs1/qa0/TEST_DATA/masData/1image/uncomp
HOME := /home/ebelardo
SHELL := /usr/local/bin/zsh

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: help

# General #####################################################################

check-agent: ## List keys in ssh-agent
	ssh-add -l

kill-agents: ## Stop all ssh-agents
	killall ssh-agent

.PHONY: check-agent kill-agents

# Git #########################################################################

g-add-all: ## Git add all
	git add --all

g-add: ## Git add items (arg: items)
	git add $(items)

g-commit: ## Git commit (arg: msg)
	git commit --message '$(msg)'

g-commit-amend: ## Git commit amend
	git commit --amend

g-diff: ## Git diff
	git diff

g-log-graph: ## Git log graph
	git log --graph

g-log-short-files: ## Git log one-liners (+ time and author) and file list
	git log --graph --pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' --stat

g-log-short: ## Git log one-liners (+ time and author)
	git log --graph --pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset'

g-log-shorter: ## Git log one-liners
	git log --graph --oneline --decorate --all

g-push: ## Git push
	git push

g-push-force: ## Git push
	git push --force-with-lease

g-status: ## Git status
	git status

.PHONY: g-add g-add-all g-commit g-commit-amend g-diff g-log-graph
.PHONY: g-log-short-files g-log-short g-log-shorter g-push g-push-force
.PHONY: g-status

# IntelePACS ##################################################################

copy-dcm: ## Copy DICOM (.dcm) test files
	cp $(DICOM_TEST_FILES)/CT/1.3.12.2.1107.5.1.4.43226.30000006101613313904600001754.dcm ipod-files/ebelardo/uncomp_CT.dcm
	cp $(DICOM_TEST_FILES)/US/1.2.840.113543.6.6.4.3.610210399355452382212753013191393172181.dcm ipod-files/ebelardo/uncomp_US.dcm
	cp $(DICOM_TEST_FILES)/MG/1.2.840.113986.2.168476677.20070108.111940.482.dcm ipod-files/ebelardo/uncomp_MG.dcm

ipod: ## Run IPOD gradle task (args: task=[startTestingPacs, stopPacs, cleanPacs], config)
	./gradlew $(task) -PcustomConfig=$(config).groovy

ipod-to-revision: ## Get the hg revision of an IPOD (arg: pacs=[PACS-5-5-1-P22])
	lynx https://buildweb.intelerad.com/view_build/$(pacs)

java-home: ## Show JAVA_HOME
	@echo ${JAVA_HOME}

minipacs: ## Start dcmqrscp as MINIPACS:11118
	dcmqrscp --ae-config $(HOME)/etc/ae.properties --stgcmt-same-assoc --bind MINIPACS:11118 --dicomdir $(HOME)/var/DICOMDIR &

upload-ebelardo: copy-dcm ## Upload test files to mst1:/home/admin/ebelardo
	scp -r ipod-files/ebelardo mst1:~

.PHONY: copy-dcm ipod ipod-to-revision java-home minipacs upload-ebelardo

# IntelePACS Performance Testing ##############################################

dc: ## Run docker-compose (args: cmd=[ps, down, up --detach], dir=<folder-containing-docker-compose-file>)
	docker-compose --file $(dir)/docker-compose.yml $(cmd)

ssh-ec2: ## Log into IPOD-VM EC2 instance (arg: ip)
	ssh centos@$(ip)

.PHONY: dc ssh-ec2

# eof #########################################################################