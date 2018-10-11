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

"Parses the given [[code]] into a [[Node]], if possible, and returns it."
shared Node? parse(String code) => parser(code).block();
