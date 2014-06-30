---
title: "Home"
---

<div class="row">
  <div class="col-md-12">
    <p class="lead text-center">Apache Flink is a platform for efficient, distributed, general-purpose data processing.</p>

    <div class="startpage-buttons">
      <a href="{{ site.FLINK_DOWNLOAD_URL_HADOOP_1_STABLE }}">
        <button type="button" class="btn btn-primary btn-lg">
          <i class="fa fa-download"></i> Download {{ site.FLINK_VERSION_STABLE }}<br/>
          (Pre Apache)
        </button>
      </a>

       <a href="{{ site.FLINK_GITHUB_URL }}">
          <button type="button" class="btn btn-info btn-lg">
            <i class="fa fa-github"></i> View on GitHub
          </button>
        </a>
    </div>

    <div class="startpage-buttons">
      <a href="community.html#mailing-lists">
        <button type="button" class="btn btn-default btn-lg">
          <i class="fa fa-send"></i> Mailing Lists
        </button>
      </a>

      <a href="{{ site.FLINK_ISSUES_URL }} ">
        <button type="button" class="btn btn-default btn-lg">
          <i class="fa fa-coffee"></i> Issues
        </button>
      </a>
    </div>

    <div class="panel panel-warning">
      <div class="panel-heading">
        Note
      </div>
      <div class="panel-body">
        Apache Flink originated from the <a href="http://stratosphere.eu">Stratosphere project</a> and is currently moving to the Apache Incubator. The first Apache release is under preparation - the latest stable release of the system is from the Stratosphere project.
      </div>
    </div>

    <hr class="divider">

    <h1>What is Apache Flink?</h1>

    <p>Flink features powerful programming abstractions in Java and Scala, a high-performance runtime, and automatic program optimization. It has native support for iterations, incremental iterations, and programs consisting of large DAGs of operations.</p>

    <div class="row">
      <div class="col-md-12"><h2>Concise and Expressive APIs</h2></div>
    </div>
    <div class="row">
      <div class="col-md-6">
{% markdown %}
Flink allows you to express algorithms in a concise fashion in the programming languages Java and Scala.
Programs may freely compose many operations to long pipelines and mix and match built-in operations and
user-defined functions.

Flink programs have support for highly efficient **iterative algorithms**, allowing the system to model
complex tasks efficiently.
{% endmarkdown %}
      </div>
      <div class="col-md-6">
{% highlight java %}
DataSet<String> input = env.readTextFile(inputPath)

input.flatmap(new FlatMapFunction() {
   public void flatMap(String value, Collector out) {
       for (String s : value.split(" ")) {
           out.collect(new Tuple2<String, Long>(s, 1L);
       }
   }
})
.groupBy(0)
.sum(1)
.writeAsText(outputPath);
{% endhighlight %}
      </div>
    </div>

    <div class="row">
      <div class="col-md-12"><h2>System Stack</h2></div>
    </div>
    <div class="row">
      <div class="col-md-6">
{% markdown %}
The Apache Flink stack consists of

- **Programming APIs** for different languages (Java, Scala) and
paradigms (record-oriented, graph-oriented).
- A **program optimizer** that decides how to execute the program
for good performance. It decides among other things about data
movement and caching strategies.
- A **distributed runtime** that executes programs in parallel
distributed over many machines.

Flink runs independently from Hadoop, but integrates
seamlessly with YARN (Hadoop's next-generation scheduler).
Various differnt file systems (including the Hadoop Distributed
File System, HDFS) can act as data sources.
{% endmarkdown %}
      </div>
      <div class="col-md-6">
        <div style="text-align: center;">
          <img src="img/flink_stack.svg" alt="Flink Stack"/>
        </div>
      </div>
    </div>
  </div>
</div>