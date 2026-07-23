import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubgroupRecord extends FirestoreRecord {
  SubgroupRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "groupname" field.
  String? _groupname;
  String get groupname => _groupname ?? '';
  bool hasGroupname() => _groupname != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _group = snapshotData['group'] as DocumentReference?;
    _groupname = snapshotData['groupname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subgroup');

  static Stream<SubgroupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubgroupRecord.fromSnapshot(s));

  static Future<SubgroupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubgroupRecord.fromSnapshot(s));

  static SubgroupRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubgroupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubgroupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubgroupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubgroupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubgroupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubgroupRecordData({
  String? name,
  DocumentReference? group,
  String? groupname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'group': group,
      'groupname': groupname,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubgroupRecordDocumentEquality implements Equality<SubgroupRecord> {
  const SubgroupRecordDocumentEquality();

  @override
  bool equals(SubgroupRecord? e1, SubgroupRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.group == e2?.group &&
        e1?.groupname == e2?.groupname;
  }

  @override
  int hash(SubgroupRecord? e) =>
      const ListEquality().hash([e?.name, e?.group, e?.groupname]);

  @override
  bool isValidKey(Object? o) => o is SubgroupRecord;
}
