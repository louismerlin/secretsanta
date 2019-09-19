build:
	docker build -t secretsanta .
start:
	docker run -it -v "${PWD}/src":/app/src -p "3000:3000" secretsanta yarn start
sh:
	docker run -it -v "${PWD}/src":/app/src secretsanta sh
