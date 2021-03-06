doc "A nonempty, immutable sequence of values. A sequence of
     values may be formed using braces:
     
         value worlds = { \"hello\", \"world\" };
         value cubes = { for (n in 0..100) n**3 };
     
     The union type `Empty|Sequence<Element>`, abbreviated
     `Element[]`, represents a possibly-empty sequence. The
     `if (nonempty ...)` construct may be used to obtain an
     instance of `Sequence` from a possibly-empty sequence:
     
         Integer[] nums = ... ;
         if (nonmpty nums) {
             Integer first = nums.first;
             Integer max = max(nums);
             Sequence<Integer> squares = nums.collect((Integer i) i**2));
             Sequence<Integer> sorted = nums.sort(byIncreasing((Integer i) i));
         }
     
     Operations like `first`, `max()`, `collect()`, and 
     `sort()`, which polymorphically produce a nonempty
     or non-null output when given a nonempty input are 
     called _emptiness-preserving_."
see (Empty)
by "Gavin"
shared interface Sequence<out Element>
        satisfies List<Element> & Some<Element> &
                  Ranged<Integer,Element[]> &
                  Cloneable<Sequence<Element>> {
    
    doc "The index of the last element of the sequence."
    see (size)
    shared actual formal Integer lastIndex;
    
    doc "The first element of the sequence, that is, the
         element with index `0`."
    shared actual formal Element first;

    doc "The last element of the sequence, that is, the
         element with index `sequence.lastIndex`."
    shared actual default Element last {
        if (is Element last = this[lastIndex]) {
            return last;
        }
        else {
            throw; //never occurs for well-behaved implementations
        } 
    }
    
    doc "The rest of the sequence, without the first 
         element."
    shared actual formal Element[] rest;
        
    doc "Reverse this sequence, returning a new nonempty
         sequence."
    shared actual formal Sequence<Element> reversed;
    
    doc "This sequence."
    shared actual Sequence<Element> sequence {
        return this;
    }
    
    doc "A nonempty sequence containing the elements of this
         container, sorted according to a function 
         imposing a partial order upon the elements."
    shared default actual Sequence<Element> sort(
            doc "The function comparing pairs of elements."
            Comparison? comparing(Element x, Element y)) { throw; }

    doc "A nonempty sequence containing the results of 
         applying the given mapping to the elements of this
         sequence."
    shared actual Sequence<Result> collect<Result>(
            doc "The transformation applied to the elements."
            Result collecting(Element element)) {
        value s = map(collecting).sequence;
        if (nonempty s) {
            return s;
        }
        throw; //Should never happen in a well-behaved implementation
    }

    /*shared actual formal Element[] span(Integer from,
                                        Integer? to);
                                        
    shared actual formal Element[] segment(Integer from,
                                           Integer length);*/
                                           
    /*shared formal Sequence<Value> append<Value>(Value... elements)
            given Value abstracts Element;
    
    shared formal Sequence<Value> prepend<Value>(Value... elements)
            given Value abstracts Element;*/

}
