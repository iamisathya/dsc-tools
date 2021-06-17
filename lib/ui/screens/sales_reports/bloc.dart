
import 'package:code_magic_ex/ui/screens/demo/model.dart';
import 'package:code_magic_ex/ui/screens/demo/state.dart';
import 'package:code_magic_ex/ui/screens/demo/service.dart';
import 'package:rxdart/rxdart.dart';

class EasyShipBloc {
  final Stream<ContactsPageState> state;
  final Subject<ContactsPageState> _stateSubject;

  factory EasyShipBloc() {
    final subject = BehaviorSubject<ContactsPageState>();
    return EasyShipBloc._(
        stateSubject: subject,
        state: subject.asBroadcastStream());
  }

  EasyShipBloc._({required this.state, required Subject<ContactsPageState> stateSubject})
      : _stateSubject = stateSubject;

  Future<void> loadEvents() async {
    _stateSubject.add(ContactsPageState.loading());

    try {
      final List<Contacts> contacts = await ContactService.browse();
      _stateSubject.add(ContactsPageState(contacts: contacts));
    } catch (err) {
      _stateSubject.add(ContactsPageState.error());
      _stateSubject.addError(err);
    }
  }
}