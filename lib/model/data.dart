import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.info,
    required this.item,
    required this.event,
    required this.variable,
  });

  Info info;
  List<DataModelItem> item;
  List<Event> event;
  List<Variable> variable;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        info: Info.fromJson(json["info"]),
        item: List<DataModelItem>.from(
            json["item"].map((x) => DataModelItem.fromJson(x))),
        event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
        variable: List<Variable>.from(
            json["variable"].map((x) => Variable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "event": List<dynamic>.from(event.map((x) => x.toJson())),
        "variable": List<dynamic>.from(variable.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    required this.listen,
    required this.script,
  });

  String listen;
  Script script;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        listen: json["listen"],
        script: Script.fromJson(json["script"]),
      );

  Map<String, dynamic> toJson() => {
        "listen": listen,
        "script": script.toJson(),
      };
}

class Script {
  Script({
    required this.id,
    required this.type,
    required this.exec,
  });

  String id;
  String type;
  List<String> exec;

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        id: json["id"],
        type: json["type"],
        exec: List<String>.from(json["exec"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "exec": List<dynamic>.from(exec.map((x) => x)),
      };
}

class Info {
  Info({
    required this.postmanId,
    required this.name,
    required this.schema,
  });

  String postmanId;
  String name;
  String schema;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        schema: json["schema"],
      );

  Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "schema": schema,
      };
}

class DataModelItem {
  DataModelItem({
    required this.name,
    required this.item,
    required this.id,
    required this.auth,
    required this.event,
  });

  String name;
  List<PurpleItem> item;
  String id;
  Auth? auth;
  List<Event>? event;

  factory DataModelItem.fromJson(Map<String, dynamic> json) => DataModelItem(
        name: json["name"],
        item: List<PurpleItem>.from(
            json["item"].map((x) => PurpleItem.fromJson(x))),
        id: json["id"],
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        event: json["event"] == null
            ? null
            : List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "id": id,
        "auth": auth == null ? null : auth!.toJson(),
        "event": event == null
            ? null
            : List<dynamic>.from(event!.map((x) => x.toJson())),
      };
}

class Auth {
  Auth({
    required this.type,
    required this.bearer,
  });

  String type;
  Bearer bearer;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        type: json["type"],
        bearer: Bearer.fromJson(json["bearer"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "bearer": bearer.toJson(),
      };
}

class Bearer {
  Bearer({
    required this.token,
  });

  String token;

  factory Bearer.fromJson(Map<String, dynamic> json) => Bearer(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class PurpleItem {
  PurpleItem({
    required this.name,
    required this.id,
    required this.request,
    required this.response,
    required this.item,
  });

  String name;
  String id;
  Request? request;
  List<dynamic>? response;
  List<FluffyItem>? item;

  factory PurpleItem.fromJson(Map<String, dynamic> json) => PurpleItem(
        name: json["name"],
        id: json["id"],
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
        response: json["response"] == null
            ? null
            : List<dynamic>.from(json["response"].map((x) => x)),
        item: json["item"] == null
            ? null
            : List<FluffyItem>.from(
                json["item"].map((x) => FluffyItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "request": request == null ? null : request!.toJson(),
        "response": response == null
            ? null
            : List<dynamic>.from(response!.map((x) => x)),
        "item": item == null
            ? null
            : List<dynamic>.from(item!.map((x) => x.toJson())),
      };
}

class FluffyItem {
  FluffyItem({
    required this.name,
    required this.id,
    required this.request,
    required this.response,
  });

  String name;
  String id;
  Request request;
  List<dynamic> response;

  factory FluffyItem.fromJson(Map<String, dynamic> json) => FluffyItem(
        name: json["name"],
        id: json["id"],
        request: Request.fromJson(json["request"]),
        response: List<dynamic>.from(json["response"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "request": request.toJson(),
        "response": List<dynamic>.from(response.map((x) => x)),
      };
}

class Request {
  Request({
    required this.auth,
    required this.method,
    required this.header,
    required this.url,
    required this.body,
  });

  Auth? auth;
  String method;
  List<dynamic> header;
  String url;
  Body? body;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        method: json["method"],
        header: List<dynamic>.from(json["header"].map((x) => x)),
        url: json["url"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth == null ? null : auth!.toJson(),
        "method": method,
        "header": List<dynamic>.from(header.map((x) => x)),
        "url": url,
        "body": body == null ? null : body!.toJson(),
      };
}

class Body {
  Body({
    required this.mode,
    required this.formdata,
  });

  String mode;
  List<Variable> formdata;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        mode: json["mode"],
        formdata: List<Variable>.from(
            json["formdata"].map((x) => Variable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "formdata": List<dynamic>.from(formdata.map((x) => x.toJson())),
      };
}

class Variable {
  Variable({
    required this.key,
    required this.value,
    required this.type,
    required this.id,
  });

  String key;
  String value;
  Type? type;
  String id;

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        key: json["key"],
        value: json["value"],
        type: typeValues.map[json["type"]],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": typeValues.reverse![type],
        "id": id == null ? null : id,
      };
}

enum Type { DEFAULT, TEXT, STRING }

final typeValues = EnumValues(
    {"default": Type.DEFAULT, "string": Type.STRING, "text": Type.TEXT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
