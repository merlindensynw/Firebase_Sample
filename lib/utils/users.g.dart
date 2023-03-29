// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Users> _$usersSerializer = new _$UsersSerializer();

class _$UsersSerializer implements StructuredSerializer<Users> {
  @override
  final Iterable<Type> types = const [Users, _$Users];
  @override
  final String wireName = 'Users';

  @override
  Iterable<Object?> serialize(Serializers serializers, Users object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Users deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Users extends Users {
  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String gender;

  factory _$Users([void Function(UsersBuilder)? updates]) =>
      (new UsersBuilder()..update(updates))._build();

  _$Users._(
      {required this.id,
      required this.name,
      required this.email,
      required this.gender})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Users', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Users', 'name');
    BuiltValueNullFieldError.checkNotNull(email, r'Users', 'email');
    BuiltValueNullFieldError.checkNotNull(gender, r'Users', 'gender');
  }

  @override
  Users rebuild(void Function(UsersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersBuilder toBuilder() => new UsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Users &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        gender == other.gender;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Users')
          ..add('id', id)
          ..add('name', name)
          ..add('email', email)
          ..add('gender', gender))
        .toString();
  }
}

class UsersBuilder implements Builder<Users, UsersBuilder> {
  _$Users? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  UsersBuilder();

  UsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _email = $v.email;
      _gender = $v.gender;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Users other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Users;
  }

  @override
  void update(void Function(UsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Users build() => _build();

  _$Users _build() {
    final _$result = _$v ??
        new _$Users._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Users', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name, r'Users', 'name'),
            email:
                BuiltValueNullFieldError.checkNotNull(email, r'Users', 'email'),
            gender: BuiltValueNullFieldError.checkNotNull(
                gender, r'Users', 'gender'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
