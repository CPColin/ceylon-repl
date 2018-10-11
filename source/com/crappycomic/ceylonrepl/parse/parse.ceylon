import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer,
    CeylonParser
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Node
}

import org.antlr.runtime {
    ANTLRStringStream,
    CommonTokenStream
}

"Creates and returns a parser for the given code. Copied from `ceylon.ast.redhat::createParser`."
CeylonParser parser(String code)
        => CeylonParser(CommonTokenStream(CeylonLexer(ANTLRStringStream(code + " "))));

// TODO: Ultimately want parser(code).block() only, probably.
shared Node? parse(String code)
//=> parser(code).block();
        => parser(code).expression()
                else parser(code).statement()
                else parser(code).block();
