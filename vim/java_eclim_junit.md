# Junit

URL: http://eclim.org/vim/java/unittests.html

## Executing tests.

Eclim’s `:JUnit` command allows you to execute **individual test** or **individual methods** from your tests.

If you’d like to run **a particular test** you can do so by supplying **the fully qualified class name** of the test to run (you can use vim’s **tab completion** here to alleviate having to type the full name):

```vim
:JUnit org.test.MyTest
```

Another way is to simply run `:JUnit` with **no arguments** and let it decide what to run based on **the current context of the cursor**:

- If you have **a junit test file open** and **the cursor is not inside one of the test methods**, then all of the current file’s test methods will be executed.
- If **the cursor is on or inside of a test method**, then just that method will be run.
- If you have **a regular class** open and run `:JUnit`, eclim will attempt to locate the corresponding test and run it.
- If **the cursor is on or inside of a method in a regular class**, eclim will attempt to locate the test and then locate the corresponding test method for the current method in that test and run just that test method.

If you’d like to run **all tests for the current file**, regardless of whether the cursor is on a method or not, you can do so by running `:JUnit` with the ‘`%`’ argument:

```vim
:JUnit %
```

For cases where you’d like to run all your unit tests you can run `:JUnit` with the ‘`*`’ argument and eclim will locate all your test files and run them:

```vim
:JUnit *
```

## Find the test for the current source file.

When editing a java file, if you would like to open the corresponding test, you can issue the command `:JUnitFindTest`. When the cursor is on a method in your source file this command will also try to find the corresponding test method within the test file.

If you run `:JUnitFindTest `from a test class, eclim will attempt to find the corresponding class that is being tested.

## Opening test results run from you build tool

If you are running your unit tests from a build tool like ant or maven, then you most likely are writing those results to a directory in your project. If so then you can set the `org.eclim.java.junit.output_dir` setting to that location which then allows you to use the command `:JUnitResult` to locate and opening the result file for the currently open test or the test supplied as an argument.

## Generating test method stubs.

While editing junit files, eclim provides functionality to **generate test method** stubs similar to the [method override / impl](http://eclim.org/vim/java/methods.html#javaimpl) functionality provided for non-test-case classes. **The only difference** is that instead of `:JavaImpl`, you use `:JUnitImpl` to open the window of possible methods to implement.

> 这段主要是讲生成Junit方法的命令`:JUnitImpl`

To determine what class the current test is for, eclim expects that the standard naming convention for tests is followed, where the test has the same fully qualified class name as the target class with a ‘`Test`’ suffix.

So for the test `org.foo.bar.BazTest`, the exepected class being tested would be `org.foo.bar.Baz`.

> 这段主要是讲文件的命名规则：测试文件有Test后缀。

When invoking `:JUnitImpl` from within `org.foo.bar.BazTest`, eclim will locate the class `org.foo.bar.Baz` and generate a list of methods to test from it.

> 这段主要是讲在测试文件中使用`:JUnitImpl`的方法

