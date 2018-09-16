# Java

URL: https://stackoverflow.com/questions/253170/tips-for-using-vim-as-a-java-ide

http://shawnleezx.github.io/blog/2013/10/03/note-code-java-under-vim/

https://www.techrepublic.com/article/configure-vi-for-java-application-development/

http://sparkgis.com/2018/06/29/eclipse-4-8-photon-%E6%AD%A3%E5%BC%8F%E7%89%88%E5%8F%91%E5%B8%83%EF%BC%81%E5%AE%8C%E5%85%A8%E6%94%AF%E6%8C%81-java-10-%E5%BC%80%E6%BA%90%E4%B8%AD%E5%9B%BD%E7%A4%BE%E5%8C%BA/


- Make sure you use vim (vi improved). 
- You can get code completion with [eclim](http://eclim.org/)
- Syntax highlighting is great with vim
- Vim has good support for writing little macros like running ant/maven builds

## eclim

URL: http://eclim.org/

### What

如何认识Eclim：

- （1）Vim是一个文本编辑器
- （2）Eclim是Vim编辑器的一个插件
- （3）Eclim能够提供Eclipse的功能。例如，code completion, searching, code validation

### How do I get/install it?

URL: http://eclim.org/install.html


```txt
The eclim install completed successfully.
You can now start the eclimd server by executing the script:
  /home/liusen/Software/eclipse_photon/eclipse/eclimd

For more information please see the eclimd server documentation:
  http://eclim.org/eclimd.html
For information on using eclim, please visit the getting started guide:
  http://eclim.org/gettingstarted.html

```

http://eclim.org/eclimd.html
http://eclim.org/vim/code_completion.html

```vim
:ShutdownEclim
```

```vim
Plugin 'file:///home/liusen/.vim/bundle/eclim/eclim'
```

## Getting Started

URL: http://eclim.org/gettingstarted.html


## Maven Users

URL: http://eclim.org/gettingstarted.html#maven-users


## Other

http://eclim.org/vim/java/index.html

http://eclim.org/vim/java/classpath.html

http://eclim.org/vim/core/project.html#projectcreate


