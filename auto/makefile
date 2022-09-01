DICOM_TEST_FILES := /net/qa-fs1/qa0/TEST_DATA/masData/1image/uncomp
HOME := /home/ebelardo
DOTFILES := $(HOME)/git-repos/dotfiles-work
SHELL := /usr/local/bin/zsh

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-23s\033[0m %s\n", $$1, $$2}'

.PHONY: help

# Git #########################################################################

git.add: ## Git add items (arg: files)
	git add $(files)

git.add.all: ## Git add all
	git add --all

git.commit: ## Git commit (arg: msg)
	git commit --message '$(msg)'

git.commit.amend: ## Git commit amend
	git commit --amend --date "$(shell date)"

git.commit.amend.push: ## Git commit amend and push force
	git commit --amend --date "$(shell date)"
	git push --force-with-lease

git.commit.push: ## Git commit and push (arg: msg)
	git commit --message '$(msg)'
	git push

git.diff: sh.clear ## Git diff
	git diff

git.log.graph: sh.clear ## Git log graph (arg: limit)
ifdef limit
	git log --graph --max-count $(limit)
else
	git log --graph
endif

git.log.short: sh.clear ## Git log one-liners (+ time and author) (arg: limit)
ifdef limit
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--max-count $(limit)
else
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset'
endif

git.log.short.files: sh.clear ## Git log one-liners (+ time and author) and file list (arg: limit)
ifdef limit
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--stat --max-count $(limit)
else
	git log --graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ar)%C(bold blue)<%an>%Creset%C(auto)%d%Creset' \
	--stat
endif

git.pull.rebase: ## Git pull and rebase current branch after fetch
	git pull --rebase

git.push: ## Git push
	git push

git.push.force: ## Git push
	git push --force-with-lease

git.rebase.continue: ## Git rebase continue
	git rebase --continue

git.rebase.interactive: ## Git rebase interactive (arg: commit=[3e1aa46])
	git rebase --interactive $(commit)

git.remote.show.origin: ## Show remote origin of this repo
	git remote show origin

git.restore.staged: ## Move staged files back to working directory (arg: files)
	git restore --staged $(files)

git.stash: ## Git stash
	git stash

git.stash.pop: ## Git stash pop
	git stash pop

git.status: ## Git status
	git status

.PHONY: git.add git.add.all git.commit git.commit.amend git.commit.amend.push
.PHONY: git.commit.push git.diff git.log.graph git.log.short
.PHONY: git.log.short.files git.pull.rebase git.push git.push.force
.PHONY: git.rebase.continue git.rebase.interactive git.remote.show.origin
.PHONY: git.restore.staged git.stash git.stash.pop git.status

# IntelePACS ##################################################################

pacs.copy.dcm: ## Copy DICOM (.dcm) test files
	cp $(DICOM_TEST_FILES)/CT/1.3.12.2.1107.5.1.4.43226.30000006101613313904600001754.dcm $(DOTFILES)/auto/ipod-files/ebelardo/uncomp_CT.dcm
	cp $(DICOM_TEST_FILES)/US/1.2.840.113543.6.6.4.3.610210399355452382212753013191393172181.dcm $(DOTFILES)/auto/ipod-files/ebelardo/uncomp_US.dcm
	cp $(DICOM_TEST_FILES)/MG/1.2.840.113986.2.168476677.20070108.111940.482.dcm $(DOTFILES)/auto/ipod-files/ebelardo/uncomp_MG.dcm

pacs.ipod: sh.check.agent ## Run IPOD gradle task (args: task=[startTestingPacs, stopPacs, cleanPacs], config)
	./gradlew $(task) -PcustomConfig=$(config).groovy

pacs.ipod.revision: ## Get the hg revision of an IPOD (arg: pacs=[PACS-5-5-1-P22])
	lynx https://buildweb.intelerad.com/view_build/$(pacs)

pacs.minipacs: ## Start dcmqrscp as MINIPACS:11118
	dcmqrscp --ae-config $(HOME)/etc/ae.properties --stgcmt-same-assoc --bind MINIPACS:11118 --dicomdir $(HOME)/var/DICOMDIR &

pacs.upload.ebelardo: pacs.copy.dcm ## Upload test files to mst1:/home/admin/ebelardo
	scp -r $(DOTFILES)/auto/ipod-files/ebelardo admin@mst1:~

.PHONY: pacs.copy.dcm pacs.ipod pacs.ipod.to.revision pacs.minipacs
.PHONY: pacs.upload.ebelardo

# IntelePACS Performance Testing ##############################################

pt.docker.compose: ## Run docker-compose (args: cmd=[ps, down, up --detach], dir=<docker-compose-file-dir>)
	docker-compose --file $(dir)/docker-compose.yml $(cmd)

pt.ssh.ec2: ## Log into IPOD-VM EC2 instance (arg: ip)
	ssh centos@$(ip)

.PHONY: pt.docker.compose pt.ssh.ec2

# Mercurial ###################################################################

hh.incoming: ## Show new changesets to pull down
	hh incoming

hh.pull.update: ## Pull and update to new branch head if new changesets found
	hh pull --update

.PHONY: hh.incoming hh.pull.update

# SCons #######################################################################

sh.clear: ## Clear screen
	@clear

sc.rpm: ## Build RPM for IntelePACS service (arg: service=[LDS])
ifeq ($(service),LDS)
	rm -f PACS/LocalDicomService/*.rpm || true
	rm -f RPMS/{i386,noarch}/LocalDicomService*.rpm || true
	scons --make-rpms -u PACS/LocalDicomService
endif

sc.u: ## Build IntelePACS service (arg: service=[LDS])
ifeq ($(service),LDS)
	scons -u PACS/LocalDicomService
endif

.PHONY: sc.rpm sc.u

# eof #########################################################################
