// tests for Map interface
// Not much functionality to test here, as concrete interface members are not
// supported yet. But we can test if all members can be implemented, everything
// compiles, types are correct, etc.

interface MapTestBase<out Key, out Item> satisfies Map<Key, Item>
            given Key satisfies Object
            given Item satisfies Object {
    shared formal Entry<Key, Item>[] entries;
}

class MapTest<Key, Item>(Key->Item... entry)
            satisfies MapTestBase<Key, Item>
            given Key satisfies Object
            given Item satisfies Object {
    shared actual Entry<Key, Item>[] entries = entry.sequence;
    //REMOVE as soon as interfaces can have concrete members
    shared actual Boolean equals(Object other) {
        if (is MapTestBase<Object, Object> other) {
            return other.entries == entries;
        }
        return false;
    }
    shared actual Integer hash { return entries.hash; }
    shared actual Integer size { return entries.size; }
    shared actual Boolean empty { return entries.empty; }
    shared actual MapTest<Key, Item> clone { return this; }
    shared actual Iterator<Key->Item> iterator { return entries.iterator; }
    shared actual Item? item(Object key) {
        for (e in entries) {
            if (e.key == key) { return e.item; }
        }
        return null;
    }
}

void testMaps() {
    value m1 = MapTest<Integer, String>(1->"A", 2->"B", 3->"C", 4->"B");
    assert(m1.count((Entry<Integer,String> x) x.key==2)==1, "Map.count(2->B) is " m1.count((Entry<Integer,String> x) x.key==2) " instead of 1");
    assert(m1.count((Entry<Integer,String> x) x.key==100)==0, "Map.count 2");
    assert(2->"B" in m1, "Map.contains(2->B) should be true");
    assert(!(4.2 in m1), "Map.contains 2");
    assert(!(1->"C" in m1), "Map.contains 3");
    assert(m1.clone == m1, "Map.clone/equals");
    assert(m1 != 5, "Map.equals");
    assert(m1.defines(4), "Map.defines(4) should be true");
    assert(!m1.defines(5), "Map.defines 2");
    assert(!m1.defines("hi"), "Map.defines 3");
    assert(exists m1[4], "Map.item(4) should exist");
    assert(!exists m1[5], "Map.item 2");
    assert(!exists m1["hi"], "Map.item 3");
    assert(!(is Finished m1.iterator.next()), "Map.iterator");
    assert(m1.values.size==m1.size, "Map.values 1");
    /* M4
    for (e in m1) {
        assert(e.item in m1.values, "Map.values 2");
    }
    assert(m1.keys.size==m1.size, "Map.keys 1");
    for (e in m1) {
        assert(e.key in m1.keys, "Map.keys.contains(" e.key ") should be true");
    }
    assert("B"->SetTest(2, 4) in m1.inverse, "Map.inverse should contain B->Set(2,4)");
    assert(m1.size == m1.inverse.size, "Map.inverse 1");*/
    value m2 = m1.mapItems((Integer k, String v) k*100);
    assert(1->100 in m2, "Map.mapItems");
    for (k->v in m2) {
        if (v%100 != 0) { fail("Map.mapItems [2]"); }
    }
    //LazyMap
    value m = LazyMap("a"->1, "b"->2, "c"->3);
    assert(m.size == 3, "LazyMap size");
    if (exists v=m["a"]) {
        assert(v==1, "LazyMap item");
    } else { fail("LazyMap item"); }
    assert(m.fold(0, (Integer x, String->Integer e) x+e.item)==6, "LazyMap fold");
    assert(m.every((String->Integer e) e.key in "abc"), "LazyMap every");
    assert("b"->2 in m, "LazyMap contains");
}
