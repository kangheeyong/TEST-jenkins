clean:
	-find -name "*.un~" -exec rm {} \;
	-find -name "*.swp" -exec rm {} \;
	-find -name "*.pyc" -exec rm {} \;

docker_install:
	curl -fsSL https://get.docker.com/ | sudo sh

docker_run: 
	- mkdir ~/jenkins_home
	docker build -t jeiger/jenkins:lts .
	docker run --rm --name toy-jenkins -p 8080:8080 -p 50000:50000\
		-v ~/jenkins_home:/var/jenkins_home\
		-v /var/run/docker.sock:/var/run/docker.sock\
		jeiger/jenkins:lts

docker_image_remove: docker_image_remove_dangling
	-docker rmi $$(docker images -q -f reference=toy-jenkins)

docker_image_remove_dangling:
	-docker rmi $$(docker images -q -f dangling=true)
