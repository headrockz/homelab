# Montando meu homelab
Adquiri um mini pc e decidi em transforma-lo em um servidor, as configs do pc são: processador celeron de 4 núcleos, 8gb de memória ram, 256gb de ssd e um hd de 1tb, essas configurações são mais do que o suficiente para o que será executado nele. Como entusiasta de linux, o SO dele não poderia ser outro que não um linux, no caso optei por rodar um Ubuntu server.

## O que será executado no server?

- Openssh server
- Webmin
- Docker
- Python
- Dotnet core
- Lunarvim
- Code server
- Samba
- Wireguard
- Rsync
- Cron

### **Openssh server**

O openssh será necessário para podermos ter acesso remoto na maquina, Durante a instalação do Ubuntu server, ele pergunta se deseja instala-lo, mas caso queria instalar depois, digite o comando `sudo apt install openssh-server`


### **Webmin**

**[Webmin](https://webmin.com/)**

### **Docker**

Docker é uma das minhas ferramentas preferidas desse mundo da computação,

O primeiro container que instalei foi o [portainer io](https://www.portainer.io/), ele serve como uma aplicação web para gerenciar os outros containers que estão na maquina. 

**[Duplicati](www.duplicati.com)** é uma aplicação para fazer backups de forma encriptada tanto localmente quando na nuvem, utilizo ele para fazer backup de meus projetos no meu google drive

**[Resilio Sync](https://www.resilio.com/individuals/)**

**[Postgres](https://www.postgresql.org/)** é o banco de dados central do server, será utilizado para uma aplicação que estará no docker, além de aplicações que possa vir a desenvolver com python ou c#.

### **Python e dotnet**

As duas linguagens que mais trabalho ultimante são, Python e C#, para gerenciar o Python, utilizo o pyenv, nele consigo gerenciar as versões do python para cada projeto. [pyenv](https://github.com/pyenv/)

Para o dotnet core, utilizo o proprio sdk da Microsoft, [dotnet](https://docs.microsoft.com/pt-br/dotnet/core/install/linux)

### **Lunarvim**

### **Code server**

O code server é um VS Code via navegador, nele consigo desenvolver via navegador os projetos que estão no server, graças a ele posso abandonar notebooks e sair de casa apenas com um tablet, teclado e mouse, ou até a mesmo usar umv VS Code no telefone.

### **Samba**

Tenho um hd de 1tb que utilizava para backups, mas decidi coloca-lo no servidor para que possa ter acesso de qualquer dispositivo que esteja na rede, para isso utilizei o samba, com 2 usuários, um usuário convidado que só tem permissão de leitura, e um usuário protegido com permissão total no hd

### **Wireguard**
**[Wireguard](https://www.wireguard.com/)** é a vpn que utilizo para acessar o server fora de casa, fiz sua instalação por meio do [PiVPN](https://pivpn.io/)


### **Rsync**
O comando rsync é um programa muito util para sincronização de arquivos ou pastas, utilizo para enviar projetos que esta em meu notebook para o servidor ou vice-versa, além de sincrozinar em meu ssd externo, sendo possível parametrizar algumas coisas, como, não sincronizar alguma(s) sub pasta, que uso para não enviar a pasta venv (pasta do ambiente virtual do python) para o ssd externo.


### **Cron**
**[Cron](https://crontab.guru/crontab.5.html)** é um agendador de comandos, nele tenho alguns scripts que executam em um intervalo de tempo predeterminado, como o script do duck dns, que atualiza meu ip publico, para usa-lo no wireguard.
