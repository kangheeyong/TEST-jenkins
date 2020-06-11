clean:
	-find -name "*.un~" -exec rm {} \;
	-find -name "*.swp" -exec rm {} \;
	-find -name "*.pyc" -exec rm {} \;

docker_run:
	- mkdir ~/jenkins_home
	docker run --rm -e TZ=Asia/Seoul -p 8080:8080 -p 50000:50000 -v ~/jenkins_home:/var/jenkins_home jenkins/jenkins:lts

