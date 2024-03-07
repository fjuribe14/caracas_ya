// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasa_valor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTasaValorCollection on Isar {
  IsarCollection<TasaValor> get tasaValors => this.collection();
}

const TasaValorSchema = CollectionSchema(
  name: r'TasaValor',
  id: 7958910267975798821,
  properties: {
    r'coTasa': PropertySchema(
      id: 0,
      name: r'coTasa',
      type: IsarType.string,
    ),
    r'fechaValor': PropertySchema(
      id: 1,
      name: r'fechaValor',
      type: IsarType.dateTime,
    ),
    r'moMonto': PropertySchema(
      id: 2,
      name: r'moMonto',
      type: IsarType.string,
    ),
    r'tsFechaTimestampIns': PropertySchema(
      id: 3,
      name: r'tsFechaTimestampIns',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _tasaValorEstimateSize,
  serialize: _tasaValorSerialize,
  deserialize: _tasaValorDeserialize,
  deserializeProp: _tasaValorDeserializeProp,
  idName: r'idTasa',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tasaValorGetId,
  getLinks: _tasaValorGetLinks,
  attach: _tasaValorAttach,
  version: '3.1.0+1',
);

int _tasaValorEstimateSize(
  TasaValor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.coTasa;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.moMonto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tasaValorSerialize(
  TasaValor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.coTasa);
  writer.writeDateTime(offsets[1], object.fechaValor);
  writer.writeString(offsets[2], object.moMonto);
  writer.writeDateTime(offsets[3], object.tsFechaTimestampIns);
}

TasaValor _tasaValorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TasaValor(
    coTasa: reader.readStringOrNull(offsets[0]),
    fechaValor: reader.readDateTimeOrNull(offsets[1]),
    idTasa: id,
    moMonto: reader.readStringOrNull(offsets[2]),
    tsFechaTimestampIns: reader.readDateTimeOrNull(offsets[3]),
  );
  return object;
}

P _tasaValorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tasaValorGetId(TasaValor object) {
  return object.idTasa ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _tasaValorGetLinks(TasaValor object) {
  return [];
}

void _tasaValorAttach(IsarCollection<dynamic> col, Id id, TasaValor object) {
  object.idTasa = id;
}

extension TasaValorQueryWhereSort
    on QueryBuilder<TasaValor, TasaValor, QWhere> {
  QueryBuilder<TasaValor, TasaValor, QAfterWhere> anyIdTasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TasaValorQueryWhere
    on QueryBuilder<TasaValor, TasaValor, QWhereClause> {
  QueryBuilder<TasaValor, TasaValor, QAfterWhereClause> idTasaEqualTo(
      Id idTasa) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: idTasa,
        upper: idTasa,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterWhereClause> idTasaNotEqualTo(
      Id idTasa) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: idTasa, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: idTasa, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: idTasa, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: idTasa, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterWhereClause> idTasaGreaterThan(
      Id idTasa,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: idTasa, includeLower: include),
      );
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterWhereClause> idTasaLessThan(
      Id idTasa,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: idTasa, includeUpper: include),
      );
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterWhereClause> idTasaBetween(
    Id lowerIdTasa,
    Id upperIdTasa, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIdTasa,
        includeLower: includeLower,
        upper: upperIdTasa,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TasaValorQueryFilter
    on QueryBuilder<TasaValor, TasaValor, QFilterCondition> {
  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coTasa',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coTasa',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coTasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coTasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coTasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coTasa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coTasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coTasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coTasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coTasa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coTasa',
        value: '',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> coTasaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coTasa',
        value: '',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> fechaValorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaValor',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      fechaValorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaValor',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> fechaValorEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaValor',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      fechaValorGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaValor',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> fechaValorLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaValor',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> fechaValorBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaValor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> idTasaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idTasa',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> idTasaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idTasa',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> idTasaEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idTasa',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> idTasaGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idTasa',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> idTasaLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idTasa',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> idTasaBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idTasa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moMonto',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moMonto',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moMonto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moMonto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moMonto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moMonto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'moMonto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'moMonto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'moMonto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'moMonto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition> moMontoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moMonto',
        value: '',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      moMontoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'moMonto',
        value: '',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      tsFechaTimestampInsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tsFechaTimestampIns',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      tsFechaTimestampInsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tsFechaTimestampIns',
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      tsFechaTimestampInsEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tsFechaTimestampIns',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      tsFechaTimestampInsGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tsFechaTimestampIns',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      tsFechaTimestampInsLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tsFechaTimestampIns',
        value: value,
      ));
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterFilterCondition>
      tsFechaTimestampInsBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tsFechaTimestampIns',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TasaValorQueryObject
    on QueryBuilder<TasaValor, TasaValor, QFilterCondition> {}

extension TasaValorQueryLinks
    on QueryBuilder<TasaValor, TasaValor, QFilterCondition> {}

extension TasaValorQuerySortBy on QueryBuilder<TasaValor, TasaValor, QSortBy> {
  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> sortByCoTasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coTasa', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> sortByCoTasaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coTasa', Sort.desc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> sortByFechaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaValor', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> sortByFechaValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaValor', Sort.desc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> sortByMoMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moMonto', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> sortByMoMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moMonto', Sort.desc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> sortByTsFechaTimestampIns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tsFechaTimestampIns', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy>
      sortByTsFechaTimestampInsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tsFechaTimestampIns', Sort.desc);
    });
  }
}

extension TasaValorQuerySortThenBy
    on QueryBuilder<TasaValor, TasaValor, QSortThenBy> {
  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByCoTasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coTasa', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByCoTasaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coTasa', Sort.desc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByFechaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaValor', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByFechaValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaValor', Sort.desc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByIdTasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTasa', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByIdTasaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTasa', Sort.desc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByMoMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moMonto', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByMoMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moMonto', Sort.desc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy> thenByTsFechaTimestampIns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tsFechaTimestampIns', Sort.asc);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QAfterSortBy>
      thenByTsFechaTimestampInsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tsFechaTimestampIns', Sort.desc);
    });
  }
}

extension TasaValorQueryWhereDistinct
    on QueryBuilder<TasaValor, TasaValor, QDistinct> {
  QueryBuilder<TasaValor, TasaValor, QDistinct> distinctByCoTasa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coTasa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QDistinct> distinctByFechaValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaValor');
    });
  }

  QueryBuilder<TasaValor, TasaValor, QDistinct> distinctByMoMonto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moMonto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TasaValor, TasaValor, QDistinct>
      distinctByTsFechaTimestampIns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tsFechaTimestampIns');
    });
  }
}

extension TasaValorQueryProperty
    on QueryBuilder<TasaValor, TasaValor, QQueryProperty> {
  QueryBuilder<TasaValor, int, QQueryOperations> idTasaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idTasa');
    });
  }

  QueryBuilder<TasaValor, String?, QQueryOperations> coTasaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coTasa');
    });
  }

  QueryBuilder<TasaValor, DateTime?, QQueryOperations> fechaValorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaValor');
    });
  }

  QueryBuilder<TasaValor, String?, QQueryOperations> moMontoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moMonto');
    });
  }

  QueryBuilder<TasaValor, DateTime?, QQueryOperations>
      tsFechaTimestampInsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tsFechaTimestampIns');
    });
  }
}
