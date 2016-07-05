# EES14-tarefa2

## Introdução

Este repositório versiona a tarefa 2 da disciplina EES14, cujo objetivo é desenvolver a aplicação modelada na tarefa 1.

O repositório contém além do código-fonte da aplicação web, a infraestrutura para execução da aplicação. Essa infraestrutura será fornecida pelos arquivos Vagrantfile e playbook fornecidos neste repositório.

A aplicação web é um sistema de registro de publicações. Ela foi desenvolvida usando Ruby on Rails, um framework web em Ruby.

O [Vagrant](https://www.vagrantup.com/docs/) facilita o gerenciamento do ciclo de vida de máquinas virtuais (VMs), permitindo configurar, iniciar, destruir e replicar VMs usando comandos simples por linha de comando (CLI).

O [Ansible](http://docs.ansible.com/index.html), por sua vez, é um provisionador, uma ferramenta de automação para TI. Ele permite automatizar a configuração de sistemas, a instalação de pacotes, o controle de ambientes, os processos de deployments.

Neste trabalho, o Vagrant é usado para iniciar e finalizar a VM. O Ansible é ligado ao Vagrant para configurar e deixar a VM pronta para execução da aplicação.

__OBS__: Os passos descritos neste README presumem o uso de uma distribuição Linux, como Ubuntu, Debian, CentOS, Fedora. Aconselha-se a leitura dos links fornecidos no decorrer desta página, buscando pelo sistema operacional que está sendo usado.


## Organização do repositório

O repositório é composto por:

- __publicator/__: diretório com o código-fonte da aplicação web de registro de publicações.
- __Vagrantfile__: arquivo que permite gerenciar uma VM usando o Vagrant.
- __playbook.yml__: arquivo que descreve as tarefas de configuração e deployment realizadas pelo Ansible.
- __install-ruby.sh__: script usado pelo playbook na instalação do Ruby.
- __README.md__: arquivo com o conteúdo desta página.
- __.gitignore__: arquivo com lista de arquivos a serem ignorados pelo Git neste repositório.


## Ambiente de execução da aplicação

### Ansible

O primeiro passo é instalar o Ansible. Para tanto, veja as instruções em http://docs.ansible.com/ansible/intro_installation.html#installation.

### Vagrant

O segundo passo é instalar o Vagrant. As instruções podem ser obtidas em https://www.vagrantup.com/docs/installation/.

Em seguida, é necessário garantir que se tenha instalado um _provider_, o software que "provê" a VM. Neste caso, será usado o VirtualBox. Para tanto, instale o VirtualBox: https://www.virtualbox.org/manual/ch01.html#intro-installing.

Após isso, basta entrar na pasta raiz deste repositório (onde fica o Vagrantfile) e executar o seguinte comando:
 vagrant up

Este comando irá disparar a configuração da VM junto ao processo de inicialização dela.

Para acessar o ssh por linha de comando, basta usar o comando:
 vagrant ssh

Se for desejado apenas desligar a VM, sem precisar reprovisionar ela depois, pode-se usar:
 vagrant halt

Para destruir uma VM, isto é, desligar e apagar os arquivos e estados mantidos por ela (necessidade de reprovisionar), pode-se usar o comando:
 vagrant destroy

OBS: Os comandos sempre devem ser executados na mesma pasta onde se encontra o Vagrantfile.

### Acesso à aplicação

Se você observar o Vagrantfile, poderá ver que ele faz o mapeamento de duas portas da VM para o host: porta 22, para acesso SSH, e porta 3000, da aplicação web. Assim, a porta 42022, no host, dá acesso SSH à VM. Já a porta 43000, no host, dá acesso à aplicação web.

Logo, tendo executado o vagrant up com sucesso, basta colocar no navegador "http://localhost:43000" para ter acesso à aplicação.
