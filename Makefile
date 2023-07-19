DIR=$(CURDIR)

install:
	docker run -it \
		--mount type=bind,source="$(realpath $(pwd).)",target=//app \
		--workdir=//app \
		--name timur-angular \
		--rm node:18.16.1-bullseye \
		bash -c "rm -rf ./node_modules && yarn install"

build:
	docker run -it \
		--mount type=bind,source="$(realpath $(pwd).)",target=//app \
		--workdir=//app \
		--name timur-angular \
		--rm node:18.16.1-bullseye \
		bash -c "npm run build"

start:
	docker run -it \
		--mount type=bind,source="$(realpath $(pwd).)",target=//app \
		--workdir=//app \
		-p 4200:4200 \
		--name timur-angular \
		--rm node:18.16.1-bullseye \
		bash -c "npm run start"
