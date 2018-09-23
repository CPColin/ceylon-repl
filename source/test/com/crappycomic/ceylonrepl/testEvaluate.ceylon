import ceylon.ast.core {
    Node
}

import com.crappycomic.ceylonrepl {
    Context,
    evaluate,
    parse
}

Anything testEvaluate(String code, Context context = Context()) {
    value node = parse(code);
    
    assert(is Node node);
    
    return evaluate(context, node);
}