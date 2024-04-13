#!/bin/bash

# transfering script witch change wallpaper to remote host
sshpass -p "alunolocal" scp TheScript.py aluno@172.16.1.71:/home/aluno/Modelos/TheScript.py

# creating the directory that will store the images
sshpass -p "alunolocal" ssh aluno@172.16.1.71 "mkdir -p /home/aluno/Modelos/TheImages"

# transfering the images to that directory in remote host
sshpass -p "alunolocal" scp /home/alunos/a2349370/Imagens/TheImages/*.{png,jpeg} aluno@172.16.1.71:/home/aluno/Modelos/TheImages/

# editing .bashrc file in remote host to execute the python script when a session start
sshpass -p "alunolocal" ssh aluno@172.16.1.71 "echo 'python3 /home/aluno/Modelos/TheScript.py' >> ~/.bashrc"
