import 'package:test/test.dart' as unit;
import 'package:firefirestyle.textbuilder/textbuilder.dart' as tb;

void main() {
  unit.test("a", () {
    var builder = new tb.TextBuilder();
    builder.add(builder.getRootTicket(), ["""a""","""b"""]);
    unit.expect(builder.toText("_"),"""a_b""");
    builder.add(builder.getRootTicket(), ["""ae""","""be"""]);
    unit.expect(builder.toText("_"),"""a_b_ae_be""");
    builder.head(builder.getRootTicket(), ["""ah""","""bh"""]);
    unit.expect(builder.toText("_"),"""ah_bh_a_b_ae_be""");
  });

  unit.test("b", () {
    var builder = new tb.TextBuilder();
    var ticket = builder.child(builder.getRootTicket(), ["""<div>"""],["""</div>"""]);
    builder.add(ticket, ["""xxx"""]);
    unit.expect(builder.toText(""),"""<div>xxx</div>""");
    unit.expect(builder.toText(""),"""<div>xxx</div>""");
  });

}
