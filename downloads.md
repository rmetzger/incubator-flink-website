---
title: "Downloads"
layout: simple
---

<div class="panel panel-warning">
  <div class="panel-heading">
    Note
  </div>
  <div class="panel-body">
    The source code and parts of the documentation have not been renamed yet to Flink.
  </div>
</div>

<p class="lead">Pick the <strong>Apache Flink</strong> package matching your Hadoop version.</p>

## Stable

Apache Flink {{ site.FLINK_VERSION_STABLE }} is our latest stable release.

<div class="list-group">
  <a href="{{ site.FLINK_DOWNLOAD_URL_HADOOP_1_STABLE }}" class="list-group-item">
    <h4 class="list-group-item-heading">
      <i class="fa fa-download"></i> <strong>Flink {{ site.FLINK_VERSION_STABLE }}</strong> for Hadoop 1</h4>
    <p>Pick this package if you plan to use Flink with data stored in Hadoop 1.x.</p>
    <p>Also pick this version if you don't plan to use Flink with Hadoop at all.</p>
  </a>
  <a href="{{ site.FLINK_DOWNLOAD_URL_HADOOP_2_STABLE }}" class="list-group-item">
  	<h4 class="list-group-item-heading"><i class="fa fa-download"></i> <strong>Flink {{ site.FLINK_VERSION_STABLE }}</strong> for Hadoop 2</h4>
  	<p>Pick this package if you plan to use Flink with data stored in Hadoop 2.x.</p>
  </a>
  <a href="{{ site.FLINK_DOWNLOAD_URL_YARN_STABLE }}" class="list-group-item">
  	<h4 class="list-group-item-heading"><i class="fa fa-download"></i> <strong>Flink {{ site.FLINK_VERSION_STABLE }}</strong> for YARN</h4>
  	<p>Pick this package if you plan to use Flink with Hadoop YARN.</p>
  </a>
</div>

### Maven Dependencies

You can add the following dependencies to your `pom.xml` to include Apache Flink in your project.

```xml
<dependency>
  <groupId>eu.stratosphere</groupId>
  <artifactId>stratosphere-java</artifactId>
  <version>{{ site.FLINK_VERSION_STABLE }}</version>
</dependency>
<dependency>
  <groupId>eu.stratosphere</groupId>
  <artifactId>stratosphere-clients</artifactId>
  <version>{{ site.FLINK_VERSION_STABLE }}</version>
</dependency>
```

These dependencies include a local execution environment and thus support local testing.

- **Hadoop 2**: If you want to interact with Hadoop 2, use `{{ site.FLINK_VERSION_STABLE }}-hadoop2` as the version.
- **Scala API**: To use the Scala API, replace the `stratosphere-java` artifact id with `stratosphere-scala`.

## Latest 

Apache Flink {{ site.FLINK_VERSION_LATEST }} is our latest development version.

You can download a packaged version of our nightly builds, which include
the most recent development code. You can use them if you need a feature
before its release. Only builds that pass all tests are published here.

<div class="list-group">
  <a href="{{ site.FLINK_DOWNLOAD_URL_HADOOP_1_LATEST }}" class="list-group-item">
    <h4 class="list-group-item-heading">
      <i class="fa fa-download"></i> <strong>Flink {{ site.FLINK_VERSION_LATEST }}</strong> for Hadoop 1</h4>
  </a>
  <a href="{{ site.FLINK_DOWNLOAD_URL_HADOOP_2_LATEST }}" class="list-group-item">
    <h4 class="list-group-item-heading"><i class="fa fa-download"></i> <strong>Flink {{ site.FLINK_VERSION_LATEST }}</strong> for Hadoop 2</h4>
  </a>
  <a href="{{ site.FLINK_DOWNLOAD_URL_YARN_LATEST }}" class="list-group-item">
    <h4 class="list-group-item-heading"><i class="fa fa-download"></i> <strong>Flink {{ site.FLINK_VERSION_LATEST }}</strong> for YARN</h4>
  </a>
</div>

Add the **Sonatype Snapshot repository** to your Maven `pom.xml`:

```xml
<repositories>
  <repository>
    <id>snapshots-repo</id>
    <url>https://oss.sonatype.org/content/repositories/snapshots</url>
    <releases><enabled>false</enabled></releases>
    <snapshots><enabled>true</enabled></snapshots>
  </repository>
</repositories>
```

You can now include Apache Flink as a Maven dependency (see above) with version `{{ site.FLINK_VERSION_LATEST }}`.

## Checkout from Source

You can checkout Apache Flink {{ site.FLINK_VERSION_LATEST }} and build it on your own machine.

```bash
git clone {{ site.FLINK_GITHUB_URL }}
cd {{ site.FLINK_GITHUB_REPO_NAME }}
mvn clean package -DskipTests
```

Note: Flink does not build with Oracle JDK 6. It runs with Oracle JDK 6.

If you want to build for Hadoop 2, activate the build profile via `mvn clean package -DskipTests -Dhadoop.profile=2`.