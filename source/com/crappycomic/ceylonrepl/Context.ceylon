import ceylon.collection {
    HashMap
}



"Encapsulates the context in which execution is occurring, including the values and imports in the
 current scope, the current value of `this`, and so on."
shared class Context(outerContext = null)
        satisfies Correspondence<String,Anything> & KeyedCorrespondenceMutator<String,Anything> {
    "The context of the scope just outside the scope of this instance. Values in this instance hide
     values in the outer context."
    shared Context? outerContext;
    
    value values = HashMap<String,Anything>();
    
    "Constructs and returns a new instance that is wrapped by this instance."
    shared Context inner => Context(this);
    
    defines(String key) => values.defines(key);
    
    get(String key) => values.get(key) else undefined;
    
    put(String key, Anything item) => values.put(key, item);
}
