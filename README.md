## アプリについて

[apipie-rails](https://github.com/Apipie/apipie-rails)と[swagger-blocks](https://github.com/fotinakis/swagger-blocks)の両方を搭載した、簡単なTODOのCRUDができるREST APIのアプリです。

* Ruby 2.4.3
* Rails 5.2
* apipie-rails 0.5.7
* swagger-blocks 2.0.2

## 使い方

### apipie-rails

コマンドを実行して、swagger-specのjsonファイルを吐き出す形です。  
吐き出されたjsonを煮るなり焼くなり好きにする感じになります。

```
$ bundle exec rails apipie:static_swagger_json
$ cat doc/apidoc/schema_swagger_form_data.json
{
  "swagger": "2.0",
  "info": {
    "title": "freee API (params in:formData)",

# 中略

  "host": "localhost:3000"
}
```

### swagger-blocks

コントローラ内でswagger-spec形式のハッシュを生成し、それをjsonでrenderする形です。

```
$ http :3000/api-docs
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"001567f3b0566007fc14d53e2515efc5"
Transfer-Encoding: chunked
Vary: Origin
X-Request-Id: 5dcf2859-0c0e-41b6-8a1f-bf07417e1f7e
X-Runtime: 0.382146

{
    "basePath": "/",
    "consumes": [
        "application/json"

# 中略

    "swagger": "2.0"
}
```
