# Code

## Automated Imports

URL: http://eclim.org/vim/java/import.html

**The automated import functionality** is pretty straightforward. Simply place **the cursor** over **the element to import** and issue the command:

```vim
:JavaImport
```

In addition to **adding imports one by one**, you can also **add them in bulk** along with **the removal of unused imports** and **the sorting and formating of all the file’s import statements** using the command:

```vim
:JavaImportOrganize
```

## Creating a new Class, Interface, etc.

URL: http://eclim.org/vim/java/types.html

`:JavaNew` is a command that allows you to create new **classes**, **interfaces**, **enums**, or **annotations** by specifying which of those you’d like to create, followed by the **fully qualified path of the new type**.

The available types you can create include:

- `class` - a new class
- `interface` - a new interface
- `abstract` - a new abstract class
- `enum` - a new enum
- `@interface` - a new annotation

Here are some examples:

```vim
:JavaNew class org.test.MyNewClass
:JavaNew interface org.test.MyNewInterface
```

If you ommit **the package name**, the new type will be created in the same package as the file you are currently editing:

```vim
:JavaNew class MyNewClass
```

## Method Generation

URL: http://eclim.org/vim/java/methods.html

```vim
:JavaConstructor

:JavaGetSet
:JavaGet
:JavaSet

:JavaImpl
:JavaDelegate
```


## Java Source Code Formatting

**Source code formatting** is invoked in `eclipse` using the shortcut `<C-S-F>`, or from the `Source / Format menu`. 

The `eclim` equivalent is invoked using the `:JavaFormat` command described below.

`:JavaFormat` - Formats the current visual selection (or the current line, if nothing is selected). To format the whole file, use `:%JavaFormat`.

Configuration:

- `org.eclim.java.format.strip_trialing_whitespace` - When set to `true`, all trailing whitespace will be removed when formatting java code.



