import com.crappycomic.ceylonrepl {
    Context
}
import com.crappycomic.ceylonrepl.parse {
    parse
}
import com.crappycomic.ceylonrepl.evaluate {
    evaluate
}

Anything testEvaluate(String code, Context context = Context()) {
    value node = parse(code);
    
    assert(exists node);
    
    return evaluate(context, node);
}
