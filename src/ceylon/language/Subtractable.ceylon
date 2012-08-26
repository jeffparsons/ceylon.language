doc "Abstraction of types which support a binary subtraction
     operator. For numeric types, this is just familiar
     numeric subtraction. In general, the subtraction operation
     should be a binary left-associative operation. The type of
     the result may differ from the type of the operands."
see (Numeric)
by "Jeff Parsons"
shared interface Subtractable<Other,Result> of Other
        given Other satisfies Subtractable<Other,Result> {

    doc "The result of subtracting the given value from this value.
         This operation should never perform any kind of
         mutation upon either the receiving value or the
         argument value."
    shared formal Result minus(Other other);
}
