// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Person {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)
        student,
    required TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)
        customer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)?
        student,
    TResult? Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)?
        customer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)?
        student,
    TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)?
        customer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Student value) student,
    required TResult Function(Customer value) customer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Student value)? student,
    TResult? Function(Customer value)? customer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Student value)? student,
    TResult Function(Customer value)? customer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? imageUrl,
      String? position});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$StudentImplCopyWith(
          _$StudentImpl value, $Res Function(_$StudentImpl) then) =
      __$$StudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? imageUrl,
      String? position,
      String? employment,
      String? experience,
      String? education,
      String? skills,
      String? desiredSalary,
      List<Offer> offers});
}

/// @nodoc
class __$$StudentImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$StudentImpl>
    implements _$$StudentImplCopyWith<$Res> {
  __$$StudentImplCopyWithImpl(
      _$StudentImpl _value, $Res Function(_$StudentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
    Object? position = freezed,
    Object? employment = freezed,
    Object? experience = freezed,
    Object? education = freezed,
    Object? skills = freezed,
    Object? desiredSalary = freezed,
    Object? offers = null,
  }) {
    return _then(_$StudentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      employment: freezed == employment
          ? _value.employment
          : employment // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String?,
      desiredSalary: freezed == desiredSalary
          ? _value.desiredSalary
          : desiredSalary // ignore: cast_nullable_to_non_nullable
              as String?,
      offers: null == offers
          ? _value._offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<Offer>,
    ));
  }
}

/// @nodoc

class _$StudentImpl implements Student {
  const _$StudentImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.phone,
      this.email,
      this.imageUrl,
      this.position,
      this.employment,
      this.experience,
      this.education,
      this.skills,
      this.desiredSalary,
      final List<Offer> offers = const []})
      : _offers = offers;

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? imageUrl;
  @override
  final String? position;
  @override
  final String? employment;
  @override
  final String? experience;
  @override
  final String? education;
  @override
  final String? skills;
  @override
  final String? desiredSalary;
  final List<Offer> _offers;
  @override
  @JsonKey()
  List<Offer> get offers {
    if (_offers is EqualUnmodifiableListView) return _offers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offers);
  }

  @override
  String toString() {
    return 'Person.student(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, imageUrl: $imageUrl, position: $position, employment: $employment, experience: $experience, education: $education, skills: $skills, desiredSalary: $desiredSalary, offers: $offers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.employment, employment) ||
                other.employment == employment) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.desiredSalary, desiredSalary) ||
                other.desiredSalary == desiredSalary) &&
            const DeepCollectionEquality().equals(other._offers, _offers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      phone,
      email,
      imageUrl,
      position,
      employment,
      experience,
      education,
      skills,
      desiredSalary,
      const DeepCollectionEquality().hash(_offers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      __$$StudentImplCopyWithImpl<_$StudentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)
        student,
    required TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)
        customer,
  }) {
    return student(id, firstName, lastName, phone, email, imageUrl, position,
        employment, experience, education, skills, desiredSalary, offers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)?
        student,
    TResult? Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)?
        customer,
  }) {
    return student?.call(
        id,
        firstName,
        lastName,
        phone,
        email,
        imageUrl,
        position,
        employment,
        experience,
        education,
        skills,
        desiredSalary,
        offers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)?
        student,
    TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)?
        customer,
    required TResult orElse(),
  }) {
    if (student != null) {
      return student(id, firstName, lastName, phone, email, imageUrl, position,
          employment, experience, education, skills, desiredSalary, offers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Student value) student,
    required TResult Function(Customer value) customer,
  }) {
    return student(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Student value)? student,
    TResult? Function(Customer value)? customer,
  }) {
    return student?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Student value)? student,
    TResult Function(Customer value)? customer,
    required TResult orElse(),
  }) {
    if (student != null) {
      return student(this);
    }
    return orElse();
  }
}

abstract class Student implements Person {
  const factory Student(
      {required final String? id,
      required final String? firstName,
      required final String? lastName,
      final String? phone,
      final String? email,
      final String? imageUrl,
      final String? position,
      final String? employment,
      final String? experience,
      final String? education,
      final String? skills,
      final String? desiredSalary,
      final List<Offer> offers}) = _$StudentImpl;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get imageUrl;
  @override
  String? get position;
  String? get employment;
  String? get experience;
  String? get education;
  String? get skills;
  String? get desiredSalary;
  List<Offer> get offers;
  @override
  @JsonKey(ignore: true)
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? imageUrl,
      String? company,
      String? position,
      String? city,
      List<Person>? students});
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
    Object? company = freezed,
    Object? position = freezed,
    Object? city = freezed,
    Object? students = freezed,
  }) {
    return _then(_$CustomerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Person>?,
    ));
  }
}

/// @nodoc

class _$CustomerImpl implements Customer {
  const _$CustomerImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.phone,
      this.email,
      this.imageUrl,
      this.company,
      this.position,
      this.city,
      final List<Person>? students = const []})
      : _students = students;

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? imageUrl;
  @override
  final String? company;
  @override
  final String? position;
  @override
  final String? city;
  final List<Person>? _students;
  @override
  @JsonKey()
  List<Person>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Person.customer(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, imageUrl: $imageUrl, company: $company, position: $position, city: $city, students: $students)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      phone,
      email,
      imageUrl,
      company,
      position,
      city,
      const DeepCollectionEquality().hash(_students));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)
        student,
    required TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)
        customer,
  }) {
    return customer(id, firstName, lastName, phone, email, imageUrl, company,
        position, city, students);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)?
        student,
    TResult? Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)?
        customer,
  }) {
    return customer?.call(id, firstName, lastName, phone, email, imageUrl,
        company, position, city, students);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? position,
            String? employment,
            String? experience,
            String? education,
            String? skills,
            String? desiredSalary,
            List<Offer> offers)?
        student,
    TResult Function(
            String? id,
            String? firstName,
            String? lastName,
            String? phone,
            String? email,
            String? imageUrl,
            String? company,
            String? position,
            String? city,
            List<Person>? students)?
        customer,
    required TResult orElse(),
  }) {
    if (customer != null) {
      return customer(id, firstName, lastName, phone, email, imageUrl, company,
          position, city, students);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Student value) student,
    required TResult Function(Customer value) customer,
  }) {
    return customer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Student value)? student,
    TResult? Function(Customer value)? customer,
  }) {
    return customer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Student value)? student,
    TResult Function(Customer value)? customer,
    required TResult orElse(),
  }) {
    if (customer != null) {
      return customer(this);
    }
    return orElse();
  }
}

abstract class Customer implements Person {
  const factory Customer(
      {required final String? id,
      required final String? firstName,
      required final String? lastName,
      final String? phone,
      final String? email,
      final String? imageUrl,
      final String? company,
      final String? position,
      final String? city,
      final List<Person>? students}) = _$CustomerImpl;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get imageUrl;
  String? get company;
  @override
  String? get position;
  String? get city;
  List<Person>? get students;
  @override
  @JsonKey(ignore: true)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
