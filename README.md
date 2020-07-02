Api em Ruby on Rails criada para a busca de cep.
Essa aplicação utiliza o sqlLite3 como banco de dados o api ViaCep para buscar informações do cep informado 

## Instalação

para instalar as dependencias.

```bash
bundle install
```

para iniciar a aplicação basta executar:
```bash
rails server
```

## Credenciais para acesso
```bash
email: latamgateway.com
token: HyUMYLc8z5er-2sZts1y 
```

Caso seja necessário criar um novo usuário, primeiro garante que seu banco esteja migrado e atualizado:
```bash
rails db:migrate
```

Após isso execute em ordem:
```bash
rails c

User.create(email: 'latamgateway@teste.com', password: '123456')
```
Esse comando acima irá gerar um novo token para ser utilizado na autorização da api

## Como utilizar

Informações no header necessárias em todas as requests:
```bash
Content-Type: application/json
X-User-email: {email}
X-User-token: {token}
```

Endpoint para buscar cep: 
```bash
# Método http GET
{base_url}/api/v1/endereco/{cep}
```
Endpoint para buscar todos endereços já salvos:
```bash
# Método http GET
{base_url}/api/v1/endereco
```
