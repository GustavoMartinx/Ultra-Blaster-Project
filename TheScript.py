import os
import random

# Caminho para a pasta com as imagens
pasta_imagens = '/home/aluno/Modelos/TheImages'

# Lista de arquivos na pasta
arquivos = os.listdir(pasta_imagens)

# Selecionar uma imagem aleatoriamente
imagem_selecionada = random.choice(arquivos)

# Comando para definir a imagem como papel de parede (substitua 'comando_definir_papel_de_parede' pelo comando correto do seu ambiente)
comando_definir_papel_de_parede = f'gsettings set org.gnome.desktop.background picture-uri "file://{os.path.join(pasta_imagens, imagem_selecionada)}"'

# Executar o comando
os.system(comando_definir_papel_de_parede)
