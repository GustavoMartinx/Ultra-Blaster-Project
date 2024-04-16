ip = "172.16.1.204"

# transfering script witch change wallpaper to the remote host
sshpass -p "alunolocal" scp TheScript.py aluno@$ip:/home/aluno/Modelos/TheScript.py

# creating the directory that will store the images
sshpass -p "alunolocal" ssh aluno@$ip "mkdir -p /home/aluno/Modelos/TheImages"

# transfering the images to that directory in remote host
sshpass -p "alunolocal" scp /home/aluno/Modelos/TheImages/*.{png,jpeg} aluno@$ip:/home/aluno/Modelos/TheImages/

# editing .bashrc file in remote host to execute the python script when a session start
sshpass -p "alunolocal" ssh aluno@$ip "echo 'python3 /home/aluno/Modelos/TheScript.py' >> ~/.bashrc"