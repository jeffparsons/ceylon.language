doc "Given two sequences, form a new sequence consisting of
     all entries where, for any given index in the resulting
     sequence, the key of the entry is the element occurring 
     at the same index in the first sequence, and the item 
     is the element occurring at the same index in the second 
     sequence. The length of the resulting sequence is the 
     length of the shorter of the two given sequences. 
     
     Thus:
     
         zip(xs,ys)[i]==xs[i]->ys[i]
     
     for every `0<=i<min({xs.size,ys.size})`."
shared Entry<Key,Item>[] zip<Key,Item>(Iterable<Key> keys, Iterable<Item> items)
        given Key satisfies Object
        given Item satisfies Object {
    value iter = items.iterator;
    return { for (key in keys) if (is Item item=iter.next()) key->item };
}