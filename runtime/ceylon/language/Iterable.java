package ceylon.language;

import com.redhat.ceylon.compiler.java.metadata.Name;
import com.redhat.ceylon.compiler.java.metadata.Annotation;
import com.redhat.ceylon.compiler.java.metadata.Annotations;
import com.redhat.ceylon.compiler.java.metadata.Ceylon;
import com.redhat.ceylon.compiler.java.metadata.SatisfiedTypes;
import com.redhat.ceylon.compiler.java.metadata.TypeInfo;
import com.redhat.ceylon.compiler.java.metadata.TypeParameter;
import com.redhat.ceylon.compiler.java.metadata.TypeParameters;
import com.redhat.ceylon.compiler.java.metadata.Variance;

@Ceylon(major = 3)
@TypeParameters(@TypeParameter(value = "Element", variance = Variance.OUT))
@SatisfiedTypes("ceylon.language.ContainerWithFirstElement<Element,ceylon.language.Nothing>")
public interface Iterable<Element> extends ContainerWithFirstElement<Element,Nothing> {

    @Annotations({@Annotation("actual"), @Annotation("default")})
    @Override
    public boolean getEmpty();
    
    @Annotations(@Annotation("formal"))
    @TypeInfo("ceylon.language.Iterator<Element>")
    public Iterator<? extends Element> getIterator();

    @Annotations({@Annotation("actual"), @Annotation("default")})
    @TypeInfo("ceylon.language.Nothing|Element")
    public Element getFirst();

    @Annotations({@Annotation("actual"), @Annotation("default")})
    @TypeInfo("ceylon.language.Nothing|Element")
    public Element getLast();

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<Element>")
    public Iterable<? extends Element> getRest();

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Empty|ceylon.language.Sequence<Element>")
    public Iterable<? extends Element> getSequence();

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<Result>")
    @TypeParameters(@TypeParameter("Result"))
    public <Result> Iterable<? extends Result> map(@Name("collecting")
        @TypeInfo("ceylon.language.Callable<Result,Element>")
        Callable<? extends Result> collecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<Element>")
    public Iterable<? extends Element> filter(@Name("selecting")
        @TypeInfo("ceylon.language.Callable<ceylon.language.Boolean,Element>")
        Callable<? extends Boolean> selecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("Result")
    @TypeParameters(@TypeParameter("Result"))
    public <Result> Result fold(@Name("initial")
		@TypeInfo("Result") Result initial,
		@Name("accumulating")
        @TypeInfo("ceylon.language.Callable<Result,Result,Element>")
        Callable<? extends Result> accumulating);

    @Annotations(@Annotation("default"))
    @TypeInfo("Element|ceylon.language.Nothing")
    public Element find(@Name("selecting")
        @TypeInfo("ceylon.language.Callable<ceylon.language.Boolean,Element>")
        Callable<? extends Boolean> selecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("Element|ceylon.language.Nothing")
    public Element findLast(@Name("selecting")
        @TypeInfo("ceylon.language.Callable<ceylon.language.Boolean,Element>")
        Callable<? extends Boolean> selecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Empty|ceylon.language.Sequence<Element>")
    public Iterable<? extends Element> sort(@Name("comparing")
        @TypeInfo("ceylon.language.Callable<ceylon.language.Nothing|ceylon.language.Comparison,Element,Element>")
        Callable<? extends Comparison> comparing);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Empty|ceylon.language.Sequence<Result>")
    @TypeParameters(@TypeParameter("Result"))
    public <Result> Iterable<? extends Result> collect(@Name("collecting")
        @TypeInfo("ceylon.language.Callable<Result,Element>")
        Callable<? extends Result> collecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Empty|ceylon.language.Sequence<Element>")
    public Iterable<? extends Element> select(@Name("selecting")
        @TypeInfo("ceylon.language.Callable<ceylon.language.Boolean,Element>")
        Callable<? extends Boolean> selecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Boolean")
    public boolean any(@Name("selecting")
        @TypeInfo("ceylon.language.Callable<ceylon.language.Boolean,Element>")
        Callable<? extends Boolean> selecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Boolean")
    public boolean every(@Name("selecting")
        @TypeInfo("ceylon.language.Callable<ceylon.language.Boolean,Element>")
        Callable<? extends Boolean> selecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<Element>")
    public Iterable<? extends Element> skipping(@Name("skip")
        @TypeInfo("ceylon.language.Integer")
        long skip);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<Element>")
    public Iterable<? extends Element> taking(@Name("take")
        @TypeInfo("ceylon.language.Integer")
        long take);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<Element>")
    public Iterable<? extends Element> by(@Name("step")
        @TypeInfo("ceylon.language.Integer")
        long step);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Integer")
    public long count(@Name("selecting")
        @TypeInfo("ceylon.language.Callable<ceylon.language.Boolean,Element>")
        Callable<? extends Boolean> selecting);

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<Element&ceylon.language.Object>")
    public Iterable<? extends Element> getCoalesced();

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<ceylon.language.Entry<ceylon.language.Integer,Element&ceylon.language.Object>>")
    public Iterable<? extends Entry<? extends Integer, ? extends Element>> getIndexed();

    @Annotations(@Annotation("default"))
    @TypeInfo("ceylon.language.Iterable<Element|Other>")
    @TypeParameters(@TypeParameter("Other"))
    public <Other> Iterable chain(@Name("other")
            @TypeInfo("ceylon.language.Iterable<Other>")
            Iterable<? extends Other> other);

    @Annotations(@Annotation("default"))
    @TypeParameters(@TypeParameter(value="Grouping",satisfies="ceylon.language.Object"))
    @TypeInfo("ceylon.language.Map<Grouping,ceylon.language.Sequence<Element>>")
    public <Key> Map<? extends Key, ? extends Sequence<? extends Element>> group(@Name("grouping")
            @TypeInfo("ceylon.language.Callable<Grouping,Element>")
            Callable<? extends Key> grouping);

}
