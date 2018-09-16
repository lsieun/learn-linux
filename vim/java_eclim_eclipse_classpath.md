# Eclipse Classpath Editing

URL: http://eclim.org/vim/java/classpath.html

Source code **completion**, **searching**, **auto imports**, all rely on **a properly configured classpath**. When you first create a project, a `.classpath` file is created in the project’s root directory.

> 这段话两个意思：  
> （1）代码的自动补全、搜索和自动导入功能都依赖于classpath；  
> （2）classpath的保存在了`.classpath`文件中。

When you write the `.classpath` file, Vim will issue a command to **the eclim server** to update the project’s classpath, and will report any errors via vim’s location list (`:help location-list`).

In addition to directly editing the `.classpath` file, you may also use [maven’s support](http://eclim.org/vim/java/classpath.html#classpath-maven) for maintaining the eclipse classpath. 

- `:NewSrcEntry <dir>` - Adds a new entry for a source code directory relative to the project’s root directory.

```xml
<classpathentry kind="src" path="src/java"/>
```

- `:NewProjectEntry <project>` - Adds a new entry for a dependency on another project.

```xml
<classpathentry exported="true" kind="src" path="/a_project"/>
```

- `:NewJarEntry <file> [<src_path> <javadoc_path>]` - Adds a new entry for a jar file dependency. If the jar file is not in a folder under the project root, you must use an absolute path (apparent limitation with Eclipse).

```xml
<classpathentry exported="true" kind="lib" path="lib/commons-beanutils-1.8.3.jar"/>
```

You may optionally supply the path to **the source for this jar** and the entry created will include the sourcepath attribute:

```vim
:NewJarEntry lib/commons-beanutils-1.8.3.jar lib/commons-beanutils-1.8.3-sources.jar
```

```xml
<classpathentry kind="lib" path="lib/commons-beanutils-1.8.3.jar"
    sourcepath="lib/commons-beanutils-1.8.3-sources.jar"/>
```

In addition to **the source path** you can all supply the path to **the javadocs**:

```vim
:NewJarEntry lib/commons-beanutils-1.8.3.jar lib/commons-beanutils-1.8.3-sources.jar lib/commons-beanutils-1.8.3-javadoc.jar
```

```xml
<classpathentry kind="lib" path="lib/commons-beanutils-1.8.3.jar"
    sourcepath="lib/commons-beanutils-1.8.3-sources.jar">
  <attributes>
    <attribute name="javadoc_location" value="jar:platform:/resource/my_project/lib/commons-beanutils-1.8.3-javadoc.jar"/>
  </attributes>
</classpathentry>
```





