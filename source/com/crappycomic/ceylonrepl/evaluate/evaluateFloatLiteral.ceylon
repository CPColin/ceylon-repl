import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}
import com.crappycomic.ceylonrepl {
    SyntaxError
}

suppressWarnings("deprecation")
Float|SyntaxError evaluateFloatLiteral(Tree.FloatLiteral literal) {
    value stripped = literal.text.replace("_", "");
    
    return parseFloat(stripped) else SyntaxError("Unable to parse Float literal");
}
