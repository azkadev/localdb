Map information = {
  "name": "localdb",
  "version": "0.0.1",
  "description":
      "Local Database\nLibrary Untuk Memudahkan developer untuk mengembangkan aplikasi yang ingin menggunakan database local",
  "links": {
    "repository": "https://github.com/azkadev/localdb",
    "library": "https://pub.dev/packages/localdb",
    "documentations": "https://github.com/azkadev/localdb/docs",
    "quickstart_app": "https://github.com/azkadev/localdb/example",
    "youtube": "https://github.com/azkadev/localdb/example",
    "github": "https://github.com/azkadev",
    "telegram": "https://t.me/azkadev",
    "contact": "httpss://t.me/gibranalazka"
  },
  "creator": {
    "username": "azkadev",
    "first_name": "Gibran",
    "last_name": "Alazka"
  }
};
// ignore: camel_case_types
class localdb {
  localdb();
  static Creator get creator {
    return Creator();
  }
  static Links get links {
    return Links();
  }
  static get rawInfo {
    return information;
  }
}
class Links {
  Links();
  get repository {
    return information["links"]["repository"];
  }
  get library {
    return information["links"]["library"];
  }
  // ignore: non_constant_identifier_names
  get quickstart_app {
    return information["links"]["quickstart_app"];
  }
  get documentations {
    return information["links"]["documentations"];
  }
  get youtube {
    return information["links"]["youtube"];
  }
  get telegram {
    return information["links"]["telegram"];
  }
  get github {
    return information["links"]["github"];
  }
  get contact {
    return information["links"]["contact"];
  }
}
class Creator {
  Creator();
  get username {
    return information["creator"]["username"];
  }
  // ignore: non_constant_identifier_names
  get first_name {
    return information["creator"]["first_name"];
  }
  // ignore: non_constant_identifier_names
  get last_name {
    return information["creator"]["last_name"];
  }
  // ignore: non_constant_identifier_names
  get full_name {
    return "$first_name $last_name";
  }
}