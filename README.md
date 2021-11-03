# LOCAL DB

---

# Sosial Media

[![Custom badge](https://img.shields.io/badge/youtube-%23FF0000.svg?&style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/user/azkadev/)
[![Custom badge](https://img.shields.io/badge/instagram-%23E4405F.svg?&style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/azkadev/)
[![Custom badge](https://img.shields.io/badge/twitter-%231DA1F2.svg?&style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/azkadev/)
[![Custom badge](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/azkadev)
[![Custom badge](https://img.shields.io/badge/Website-FF7139?style=for-the-badge&logo=Firefox-Browser&logoColor=white)](https://azkadev.com/)
[![Custom badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/azkadev)


# Donate

**ID**: Jika Anda Menyukai karya saya dan ingin memberikan dana untuk saya membeli beberapa snack silahkan donasi seberapapun itu akan saya terima dan terima kasih banyak ya.

**EN**: If you like my work and want to give me funds to buy some snacks, please donate any amount I will accept and thank you very much.

[![Github-sponsors-Badge](https://img.shields.io/badge/sponsor-30363D?style=for-the-badge&logo=GitHub-Sponsors&logoColor=#EA4AAA)](https://www.paypal.com/paypalme/azkadev)
[![Paypal-Badge](https://img.shields.io/badge/paypal-%2300457C.svg?&style=for-the-badge&logo=paypal&logoColor=white)](https://www.paypal.com/paypalme/azkadev)


# Framework

**ID**: Project ini Menggunakan beberapa bahasa framework sebagai berikut.

**EN**: This project uses several framework as follows.

[![Custom badge](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)

# Language Code

**ID**: Project ini Menggunakan beberapa bahasa code program sebagai berikut.

**EN**: This project uses several programming language languages as follows.

![Dart-Badge](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

# Introduction

**ID**: localdb adalah library untuk mempermudah dalam membuat database local.

Saya membuat library ini karena terinspirasi dari library [lowdb](https://github.com/typicode/lowdb).

**EN**: localdb is a library to make it easier to create local databases.

I created this library because it was inspired by the lirbary [lowdb](https://github.com/typicode/lowdb).

---

# Use This Library

**ID**: untuk anda yang ingin mencoba menggunakan source code ini, silahkan ikuti step berikut ini :

**EN**: for those of you who want to try to using this source code, please follow these steps :

##### Install Library
```bash
flutter pub add localdb
```

##### Quickstart

- jsondb
  <details>

  ```dart
  import 'package:localdb/jsondb.dart';
  import 'package:localdb/file/file.dart';
  import 'package:localdb/javascript/javascript.dart';

  void main() {
    var db = jsondb(FileSync("${Directory.current.path}/azkadev.json"));
  
    db.defaults({
      "name": "jsondb",
      "version": "0.0.0",
      "links": {
        "repository": "https://github.com/azkadev/jsondb.git",
        "library": "",
        "quickstart_app": ""
      },
      "contributors": [
          {"username": "azkadev", "country": "id"}
      ],
      "post": [
        {
          "id": 1,
          "title": "Library v1",
          "data": "Lorepsum ipsum dipsum gatau lagi lanjutanya",
          "comment": [
            {
              "id": 1,
              "username": "azkadev",
              "country": "id",
              "data": "wow library local database json"
            },
            {
              "id": 2,
              "username": "github",
              "country": "id",
              "data": "wow library please update more",
              "reply": [
                {
                  "id": 1,
                  "username": "azkadev",
                  "country": "id",
                  "reply_to_message": "owner",
                  "data": "ok brow i will update next"
                },
                {
                  "id": 1,
                  "username": "github",
                  "country": "id",
                  "data": "wow thanks",
                }
              ]
            }
          ]
        }
      ]
    }).write();

    //--! add data
    var jsonData = {
      "id": 2,
      "title": "Library v2",
      "data": "Lorepsum ipsum dipsum gatau lagi lanjutanya"
    };
    // get data from key post and from object key title
    var getData = db.get("post").find({"title": "Update v2"}).value();
    // check data
    if (ifjs(getData)) {
      // update data
      jsonData["title"] = "new Update";
      db.get("post").find({"title": "Update v2"}).assign(jsonData).value();
    } else {
      // add new data
      db.get("post").push(jsonData).write();
    }
  
    //--! Find Data
    db.get("contributors").push({
      "username": "github", "country": "en"
    }).write();

    //--! Find Data
    var findData = db.get("contributors").find({"username": "azkadev" }).value();
    print(findData)

    // set data
    db.set("key.data", { "github": "azkak" }).write();

    //--! Print all dat
    print(db.value());
  }
  ```

  </details>
  <br>
- yamldb
  <details>
  </details>
  <br>
- csvdb
  <details>
  </details>
  <br>
- xmldb
  <details>
  </details>

---
<br>

## Contribution

The project has a separate contribution file. Please adhere to the steps listed in the separate contributions [file](./CONTRIBUTING.md)

## Contact

You can reach me on [Telegram](https://t.me/gibranalazka)

## License

[![Licence](https://img.shields.io/github/license/azkadev/markdown-badges?style=for-the-badge)](./LICENSE)