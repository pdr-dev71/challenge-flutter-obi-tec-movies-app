# Projeto > Mural Virtual > Frontend

> :heavy_exclamation_mark: **OBS**: Este repositório contempla a penas o Frontend, para execução deste faz-se necessário que o backend esteja instalado e rodando.


## Índice

[Sobre o projeto](#sobre) | [Deploy da Aplicação](#deploy) | [Funcionalidades](#func) | [Layout](#layout) | [Organização](#organizacao) | [Pré-Requisitos](#prerequisitos) | [Instalação](#instalacao) | [Config Gitflow](#configgitflow) | [Tecnologias](#tecnologias) | [Ferramentas](#ferramentas) | 


## :computer: Sobre o projeto <a name="sobre"></a>
O projeto **Movies Go** Nasceu de um desafio proposto pela empres [Obi.Tec](https://www.obitec.com.br/), o qual tem como proposito a construção de uma aplicação para dispositivos Moveis usando a tecnologia Flutter.

A aplicação tem como principal função mostrar uma lista de filmes advindo da API publica do site [The Movies Database](https://www.themoviedb.org/), para uso dessa plataforma é necessária a criação de uma key de desenvolvedor usada nas requisições ao site.

## Deploy da aplicação <a name="deploy"></a>
:warning: **A aplicação não está lançada ainda, para uso da mesma é necessário o download deste repositório e realizar as configurações necessarias para o ambiente, que serão explicadas abaixo**


## :paperclip: Funcionalidades <a name="func"></a>

### :closed_lock_with_key: Autenticação
- [x] :busts_in_silhouette: Cadastro
- Cadastro do usuário usando Email e Senha
- [x] :lock: Login
- Login do usuário usando Email e Senha
- Login Automatico do Google
- [x] :unlock: Logout
- Sair da aplicação

### :heavy_check_mark: Funções desenvolvidas
- [x] Listar filmes
- Listagem de filmes Sendo eles apresentados em duas categorias:
	- **Top Filmes e Mais populares**
- [x] Barra de pesquisa de filmes
	- Barra para pesquisa de filmes pelo nome
- [x] Filtragem simples
	- Filtragem dos filmes pelo seu genero:
		- **Exemplo: **Ação, Aventura, Animação, Comédia e ETC**
- [x] Favoritar filmes
	- Favoritar filmes que são adicionados a tela de favoritos, onde podem ser visualizados ou desfavoritados caso haja necessidade.
- [x] Barra de navegação
	- Barra de navegaçao composta por as abas:
		- **Filmes, Favoritos e Sair**
- [x] Cards de filmes:
	- Cards com Imagem, Nome, data de lançamento e botão para favoritar
- [x] Detalhes dos filmes
	-  Mostra as principais características do filme selecionado, entre elas estão:
		- Avaliação do filme(Metrica usando estrelas) pelos usuários
		- Visualizar os trailers sendo eles vindos do YouTube ou não
		- Produtoras dos filmes
		- Elendo dos filmes



### :wrench: Configuração 1
Pra uso da API do TMDB é necessário a criação de uma key no site deles, em seguida use a key criada no campo 'api_key'. 
![Screenshot_20230127_233036](https://user-images.githubusercontent.com/53342708/215237655-6772e062-9861-4585-93d9-67d2a32aae37.png)


### :wrench: Configuração 2
Pode se usar um arquivo .env na raiz do projeto com os dados necessário como: api_key, base_url e demais parametros.
![env](https://user-images.githubusercontent.com/53342708/215237854-6fea711b-9d6d-4dfe-86bd-1f04a824c9ce.png)

:warning: **Caso o login com o google não funcione deverã ser criado uma debukeystore para uso do googlesignin, essa debug é um sha1 utilizado para garantir mais segurança. Para criar uma debugkeystore local basta seguir esse tutorial da documentação oficial do Google [Criar uma chave SHA1](https://developers.google.com/android/guides/client-auth)
após criada a mesma deve ser adicionada aos certicados de imopressão do firebase.**

## :art: Layout <a name="layout"></a>

## :lock: Login com Email e Senha

![entrar](https://user-images.githubusercontent.com/53342708/215236507-2cfdd47c-e8f6-4fd0-a14f-05aa8ce7e54e.png)


## :unlock: Google Login
![google_signin](https://user-images.githubusercontent.com/53342708/215236523-b3ca4e59-dba1-4b2d-ab3b-6e72ba3bf72e.png)



## :busts_in_silhouette: Criação de conta
![criar_conta](https://user-images.githubusercontent.com/53342708/215236545-56a26c07-24be-4a51-a3b6-70d007b7c4bb.png)



## :pencil:  Tela de pre cadastro
![pre_auth](https://user-images.githubusercontent.com/53342708/215236615-0c8ee645-2d4a-4a97-84ef-94d67a75c304.png)


## :mag_right: Tela inicial da aplicação
![home](https://user-images.githubusercontent.com/53342708/215236645-a00a9bcf-c663-4ff4-9fdf-c42d56e6cf06.png)


## :ballot_box_with_check: Tela de filmes favoritos
![favoritos](https://user-images.githubusercontent.com/53342708/215236672-af7520cf-fe3c-4d84-bdbf-ccdbce37ca05.png)


## :negative_squared_cross_mark: Detalhes dos filmes
![detalhes](https://user-images.githubusercontent.com/53342708/215236705-ed66e675-6683-4dbd-a693-e5f380d1bf43.png)

## :negative_squared_cross_mark: Trailers dos filmes
![trailers](https://user-images.githubusercontent.com/53342708/215236723-22aa8102-0841-480d-8fa0-46031ce7314b.png)

## :clipboard: Pré-requisitos <a name="prerequisitos"></a>
Os requísitos básicos para execução da aplicação são: ter instalado em sua maquina o [Git](https://git-scm.com/), [Nodejs](https://nodejs.org/en/) e um editor de código [VSCode](https://code.visualstudio.com/download).

> **Nota:** Para rodar essa aplicação(Frontend) é necessario que o servidor da mesma esteja instalado e rodando.

> **Observação:** Baixe o repositório do backend que se encontra neste
aqui :link: [Repositório Backend: Mural Virtual](https://github.com/ifpi-picos/projeto-integrador-i-mural-online-backend), e faça as configuraçoes necessárias.



## :hammer:  Instalação <a name="instalacao"></a>

### Comece a instalação clonando este repositório:
```
$ git https://github.com/pdr-dev71/challenge-flutter-obi-tec-movies-app
```

### Após o clone acesse a pasta do projeto no seu terminal linux:
```
$ cd challenge-flutter-obi-tec-movies-app
```

### Instale as dependências do Projeto:
```
$ flutter pub get
```

### Execute a aplicação:
```
$ flutter run
```


## Configuração Gitflow <a name="configgitflow"></a>
### Sobre o Gitflow
o gitflow é um framework que foi criado para trabalhar junto com o git, ele irá nos auxiliar no desenvolvimento organizando o fluxo desenvolvimento do codigo fonte.

## Instalação do Gitflow 
### Verificando se o gitflow já está instalado em sua maquina:
```
git flow version
```

**Caso ele não retorne nada, faça a instalação para seu respectivo sistema operacional:**

<a href="https://github.com/petervanderdoes/gitflow-avh/wiki/Installing-on-Linux,-Unix,-etc."> <img height="40" alt="Linux-instalation" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/windows8/windows8-original.svg"/><a/>

<a href="https://github.com/petervanderdoes/gitflow-avh/wiki/Installing-on-Windows"> <img height="40" alt="Linux-instalation" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg"/><a/>

<a href="https://github.com/petervanderdoes/gitflow-avh/wiki/Installing-on-Mac-OS-X"> <img height="40" alt="Mac-instalation" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/apple/apple-original.svg"/><a/> 



**Observação:** Para usuários do fedora v31 e superior, o suporte ao gitlow foi descontinuado pelo repositório official, mas foi recontinuado pelo **Fedora Corp** para instalar acesse:
[elegos / gitflow](https://copr.fedorainfracloud.org/coprs/elegos/gitflow/), caso queira ir direto rode os seguintes comandos no seu terminal linux:

### Habilite o repositório:
```
sudo dnf copr enable elegos/gitflow
```
### Finalmente instale o Gitflow:
```
sudo dnf install gitflow
```
## Começando com gitflow
### Após a instalação, rode o seguinte comando:
```
git flow init -d
```
>esse comando serve para criar toda a estrutura e configurações sem que precise confirmar nada.

**Dica:**
>Use sempre a branch **developer** nela está todas as ultimas atualizações feitas.


## :wrench: Tecnologias usadas no Front <a name="tecnologias"></a>


## :straight_ruler: Ferramentas de auxilio <a name="ferramentas"></a>
- **Editor:** [VSCode]("https://code.visualstudio.com/download)
- **Editor de Markdown:** [StackEditor](https://stackedit.io)
- **Teste de API:** [Insomnia](https://insomnia.rest/download)
- **Ícones:** 
<img src="https://user-images.githubusercontent.com/53342708/155193190-247ba5a0-b0a0-4788-91ed-67460bccb1d5.png" width="50px" alt="VSCode logo">
</a>

<a href="https://stackedit.io"><img src="https://user-images.githubusercontent.com/53342708/155193491-9519bc2e-cf89-4ac8-a442-84b69b4733c4.png" width="50px" alt="Stackedit logo">
</a>

<a href="https://www.postman.com/downloads/"><img src="https://user-images.githubusercontent.com/53342708/155194130-5a84951e-e72a-44f1-8228-a7f2799f851d.png" width="129px" alt="Postman logo">
</a>
