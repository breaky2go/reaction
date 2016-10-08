all:
	docker build -t breaky2go/reaction .

stage:
	docker build -t breaky2go/reaction:stage .
	docker push breaky2go/reaction:stage

prod: build-prod push-prod

build-prod:
	docker build -t breaky2go/reaction:prod -t breaky2go/reaction:latest .


push-prod:
	docker push breaky2go/reaction:prod
	docker push breaky2go/reaction:latest

update: update-main update-sub

update-main:
	git checkout master
	git merge upstream/master

update-sub:	
	git submodule update --recursive --remote
