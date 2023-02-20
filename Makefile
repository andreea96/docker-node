image_name = myImage
container_name = myContainer

start: 
	docker build --no-cache -t $(image_name) .
	docker run -d -p 3000:3000 -v ./:/usr/src/app --name $(container_name) $(image_name)
	docker exec -it $(container_name) npm ci 
	sudo chmod -R 777 node_modules/