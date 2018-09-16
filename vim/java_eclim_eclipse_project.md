# Eclipse Project Management

URL: http://eclim.org/vim/core/project.html

## Quick Index

Core:

```vim
:ProjectList
:ProjectCreate <folder> [-p <project_name>] -n <nature> … [-d <project_dependency> …]
:ProjectDelete <project>
:ProjectInfo [<project>]

:ProjectOpen [<project>]
:ProjectClose [<project>]

:ProjectRefresh [<project> <project> …]
:ProjectRefreshAll

:ProjectBuild [<project>]
:ProjectRun [<launch_config_name>]
```

辅助功能：

```vim
:ProjectProblems[!] [<project>]

:ProjectTodo
:Todo
```

INFO:

```vim
:ProjectInfo [<project>]
:ProjectNatures [<project>]

:ProjectTreeToggle
:ProjectsTree
```


## ProjectCreate

```vim
:ProjectCreate <folder> [-p <project_name>] -n <nature> … [-d <project_dependency> …]
```

- `-p`: **Optional argument** used to specify **the project name**. If **omitted**, `eclim` will use **the last segment of the project’s path**, with any spaces replaced with underscores, as the project name.

- `-n`: **Required argument** which specifies a space separated list of project natures (`java`, `php`, etc.) to add to the project. If you want to create a project with no natures, you can use the word `“none”` here.

```vim
:ProjectCreate ~/workspace/test -n none
```

Note that eclim supports command completion of available nature names.

```vim
:ProjectCreate ~/workspace/test -n p<tab>
:ProjectCreate ~/workspace/test -n php
```

- `-d`: **Optional argument** used to specify **a space separated list of project names** which the project you’re creating depends on.

Some Examples

```vim
:ProjectCreate ~/projects/a_project -n java
:ProjectCreate ~/projects/a_project -n java -d another_project yet_another_project
:ProjectCreate ~/projects/a_project -n java php -p My\ Project\ Name
```






