## Instruções básicas

Na pasta `api-feira` está a api para ser usada no aplicativo.

* Crie e ative um virtualenv para usar a api.
* Após isso instale as instale as dependencias com o comando `pip install -r requirements.txt`
* Após isso crie um superusuario, faça os cadstros necessários no django-admin
* por fim para usar a API no app rode o servidor na sua rede local
> Linux: `python manage.py runserver 0.0.0:8000`

> windows: `python manage.py runserver ip_da_máquina:8000`

* Após isso ni linux use `ifconfig` para ver seu ip, no windows é `ipconfig`.

* depois é só acessar a url subistituido o localhost pelo seu ip.


Na pasta `app_feira` está o app flutter. 
* Primeiro instale as depensecias no arquivo `pubspecy.yaml`
* depois crie um arquivo `.env` na raiz do projeto flutter.
* no arquivo `.env` insira a variável `API_URL_ROOT` e atribua ela a url da API como seu ip:
> `API_URL_ROOT=http://10.0.0.0:8000`
* Após isso está tudo ok.