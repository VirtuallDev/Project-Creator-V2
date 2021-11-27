# #!/bin/bash
clear

RESET="\e[1;0m"
GREEN="\e[31m"
GREEN="\e[32m"
WHITE="\e[97m"
GRAY="\e[90m"
BLUE="\e[94m"
BLUEBOLD="\e[1;94m"

if [ ! -d "projects/" ]; then
	echo -e "${RED}No Project Folder Detected. ${RESET}Making A New One."
	mkdir projects
fi

if [ ! $1 || ! $2 ]; then
	echo "No parameters found. "
	trap "exit" INT
fi

cd projects/

projectName=$1

mkdir $projectName
cd $projectName

echo -e "${BLUEBOLD}Creating Project... Please Wait!"
sleep 5

clear
if [ $2 = "reactjs" ]; then
	npx create-react-app ./
	sleep 60
	code .
elif [ $2 = "regweb" ]; then
	touch index.html
	mkdir js
	touch js/script.js
	mkdir css
	touch css/style.css
	cat ../../templates/regweb/index.html >>index.html

	sleep 5
	code .
elif [ $2 = "c" ]; then
	mkdir src
	touch src/main.c
	cat ../../templates/C/main.c >>src/main.c
	gcc src/main.c -o main.exe
	./main.exe
elif [ $2 = "cpp" ]; then
	mkdir src
	touch src/main.cpp
	cat ../../templates/C++/main.cpp >>src/main.cpp
	g++ src/main.exe -o main.exe
	./main.exe
elif [ $2 = "python" ]; then
	touch main.py

	cat ../templates/py/main.py >>main.py
elif [ $2 = "pygame" ]; then
	touch game.py
	mkdir Components
	mkdir Sprites
	cat ../templates/py/pygame.py >>game.py
	pip install pygame || pip3 install pygame
	clear

elif [ $2 = "nodejs" ]; then
	mkdir src
	touch src/app.js
	cat ../templates/nodejs/app.js >>src/app.js
	npm init -y
	clear
elif [ $2 = "exprouter" ]; then
	git clone https://github.com/VirtuallDev/express-router.git/ .
	clear
	cd backend
	npm install
	echo -e "${GREEN}Installed NPM Packages on: ${WHITE}BACKEND
	
	
	
	"
	cd ../client
	npm install
	echo -e "${GREEN}Installed NPM Packages on: ${WHITE}Client
	
	
	${RESET}CLIENT:
	${BLUE}cd ${GRAY}client
	${BLUE}node ${GRAY}src/app.js
	
	${RESET}BACKEND:
	${BLUE}cd ${GRAY}backend
	${BLUE}node ${GRAY}src/app.js
	"
elif [ $2 = "expserver" ]; then
	git clone https://github.com/VirtuallDev/express-server.git/ .
	clear
	npm install
	echo -e "${GREEN}Installed NPM Packages on: ${WHITE}$projectName
	
	${RESET}To Run:
		${BLUE}npm ${GRAY}start-server
	"
elif [ $2 = "qbscript" ]; then
	#     mkdir src
	# touch src/app.js
	# cat ../templates/nodejs/app.js >>src/app.js
	# npm init -y
	# clear
	mkdir client
	mkdir server
	touch client/main.lua
	touch server/main.lua
	touch __resource.lua
	touch config.lua
	cat ../templates/lua/qbcore/client/main.lua >>client/main.lua
	cat ../templates/lua/qbcore/server/main.lua >>server/main.lua
	cat ../templates/lua/qbcore/__resource.lua >>__resource.lua
	cat ../templates/lua/qbcore/config.lua >>config.lua
	echo -e "${GREEN}Script Is Ready!"
else
	echo -e "${RED}Cant find template $2. Please wait untill we will make one."
fi

echo -e "${GREEN}Created New Project: ${WHITE}${projectName}"
