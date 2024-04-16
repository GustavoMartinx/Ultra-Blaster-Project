#!/bin/bash

# scanning all IP address available in this network
capture_ips() {
    python3 << END
import socket

def scan_network():
    base_ip = '172.16.1.'
    available_ips = []

    for i in range(1, 256):
        ip = base_ip + str(i)
        try:
            socket.create_connection((ip, 22), timeout=1)
            available_ips.append(ip)
        except (socket.timeout, OSError):
            pass

    return available_ips

if __name__ == "__main__":
    ips = scan_network()
    for ip in ips:
        print(ip)
END
}


ips=$(capture_ips)


for ip in $ips; do
    echo "Transfering images and script to $ip"

    # transfering script witch change wallpaper to remote host
    sshpass -p "alunolocal" scp TheScript.py aluno@$ip:/home/aluno/Modelos/TheScript.py

    # creating the directory that will store the images
    sshpass -p "alunolocal" ssh aluno@$ip "mkdir -p /home/aluno/Modelos/TheImages"
    
    # transfering the images to that directory in remote host
    sshpass -p "alunolocal" scp /home/alunos/a2349370/Imagens/TheImages/*.{png,jpeg} aluno@$ip:/home/aluno/Modelos/TheImages/

    # editing .bashrc file in remote host to execute the python script when a session start
    sshpass -p "alunolocal" ssh aluno@$ip "echo 'python3 /home/aluno/Modelos/TheScript.py' >> ~/.bashrc"
done