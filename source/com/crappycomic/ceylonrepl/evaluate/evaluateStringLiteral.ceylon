import ceylon.ast.redhat {
    stringLiteralToCeylon
}

import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

String evaluateStringLiteral(Tree.StringLiteral literal) {
    return stringLiteralToCeylon(literal).text;
}
