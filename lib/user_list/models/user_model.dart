import 'dart:convert';

class UserModel {
    int? id;
    String? name;
    String? username;
    String? email;
    Address? address;
    String? phone;
    String? website;
    Company? company;

    UserModel({
        this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company,
    });

    UserModel copyWith({
        int? id,
        String? name,
        String? username,
        String? email,
        Address? address,
        String? phone,
        String? website,
        Company? company,
    }) => 
        UserModel(
            id: id ?? this.id,
            name: name ?? this.name,
            username: username ?? this.username,
            email: email ?? this.email,
            address: address ?? this.address,
            phone: phone ?? this.phone,
            website: website ?? this.website,
            company: company ?? this.company,
        );

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
    };
}

class Address {
    String? street;
    String? suite;
    String? city;
    String? zipcode;
    Geo? geo;

    Address({
        this.street,
        this.suite,
        this.city,
        this.zipcode,
        this.geo,
    });

    Address copyWith({
        String? street,
        String? suite,
        String? city,
        String? zipcode,
        Geo? geo,
    }) => 
        Address(
            street: street ?? this.street,
            suite: suite ?? this.suite,
            city: city ?? this.city,
            zipcode: zipcode ?? this.zipcode,
            geo: geo ?? this.geo,
        );

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
    };
}

class Geo {
    String? lat;
    String? lng;

    Geo({
        this.lat,
        this.lng,
    });

    Geo copyWith({
        String? lat,
        String? lng,
    }) => 
        Geo(
            lat: lat ?? this.lat,
            lng: lng ?? this.lng,
        );

    factory Geo.fromRawJson(String str) => Geo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Company {
    String? name;
    String? catchPhrase;
    String? bs;

    Company({
        this.name,
        this.catchPhrase,
        this.bs,
    });

    Company copyWith({
        String? name,
        String? catchPhrase,
        String? bs,
    }) => 
        Company(
            name: name ?? this.name,
            catchPhrase: catchPhrase ?? this.catchPhrase,
            bs: bs ?? this.bs,
        );

    factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}
