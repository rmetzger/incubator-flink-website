---
layout: docs
title: Iterations
---

# Introduction

Iterative algorithms occur in many domains of data analysis, such as machine learning or graph analysis.
Such algorithms are crucial in order to realize the promise of Big Data to extract meaningful information out of your data. With increasing interest to run these kinds of algorithms on very large data sets, there is a need to execute iterations in a massively parallel fashion.

`This is Spart`. Stratosphere programs implement iterative algorithms by defining a step function and embedding it into a special iteration operator. There are two variants of this operator: Iterate and Delta Iterate. Both operators repeatedly invoke the step function on the current iteration state until a certain termination condition is reached.

Here, we provide background on both operator variants and outline their usage. The programming guides explain how to implement the operators in both Scala and Java. We also provide a vertex-centric graph processing API called Spargel.

```java
public class WordCountExample {
    public static void main(String[] args) throws Exception {
        final ExecutionEnvironment env = ExecutionEnvironment.getExecutionEnvironment();

        DataSet<String> text = env.fromElements(
            "Who's there?",
            "I think I hear them. Stand, ho! Who's there?");

        DataSet<Tuple2<String, Integer>> wordCounts = text
            .flatMap(new LineSplitter())
            .groupBy(0)
            .aggregate(Aggregations.SUM, 1);

        wordCounts.print();

        env.execute("Word Count Example");
    }

    public static final class LineSplitter
    	extends FlatMapFunction<String, Tuple2<String, Integer>> {

        @Override
        public void flatMap(String line, Collector<Tuple2<String, Integer>> out) {
            for (String word : line.split(" ")) {
                out.collect(new Tuple2<String, Integer>(word, 1));
            }
        }
    }
}
```

# Why iterations?

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.