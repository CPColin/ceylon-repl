import com.crappycomic.ceylonrepl {
    Context
}
import com.crappycomic.ceylonrepl.resolve {
    BoundValueDeclaration,
    resolveQualifiedExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateQualifiedMemberExpression(Context context,
    Tree.QualifiedMemberExpression expression)
        => switch (resolved = resolveQualifiedExpression(context, expression))
            case (is BoundValueDeclaration)
                resolved.get()
            else
                resolved;
