class Ticket {
  List v = [];

  String toString() {
    return v.join("\r\n");
  }
}

class TextBuilder {
  Ticket _root;
  TextBuilder() {
    _root = new Ticket();
  }

  Ticket getRootTicket() {
    return _root;
  }

  String toString() {
    return toText("\r\n");
  }

  String toText(String lineEnd) {
    List<String> o = [];
    List<Ticket> stack = [];
    stack.addAll(_root.v);
    while (stack.length > 0) {
      var v = stack.removeAt(0);
      if (v is Ticket) {
        stack.insertAll(0, v.v);
      } else {
        o.addAll(v);
      }
    }
    return o.join(lineEnd);
  }

  Ticket child(Ticket obj, List<String> begin, List<String> end) {
    obj.v.add(begin);
    var child = new Ticket()..v = [];
    obj.v.add(child);
    obj.v.add(end);
    return child;
  }

  Ticket head(Ticket obj, List<String> v) {
    if (obj.v.length == 0) {
      obj.v.add(v);
    } else {
      obj.v.insert(0, v);
    }
    return obj;
  }

  Ticket add(Ticket obj, List<String> v) {
    obj.v.add(v);
    return obj;
  }
}
