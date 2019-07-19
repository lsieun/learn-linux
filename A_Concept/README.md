# Linux's History

After `AT&T` had dropped out of the **Multics** project, the **Unix operating system** was conceived and implemented by Ken Thompson and Dennis Ritchie (both of `AT&T` Bell Laboratories) in `1969` and first released in `1970`. Later they rewrote it in a new programming language, `C`, to make it portable. The availability and portability of **Unix** caused it to be widely adopted, copied and modified by **academic institutions** and businesses.

这段理解：

- （1） 在1969年，美国电话电报公司（`AT&T`）放弃了Multics操作系统，去研发新的Unix操作系统。到1970年，发布第一个Unix版本。
- （2） 后来，Unix使用了C语言进行了重写，有了portable的特性，逐渐流行起来。
- （3） 在流行的过程中，有一点非常重要，Unix被两个重要的团体（商业公司和学术机构）采用。商业公司，意味着资金（钱）投入成为可能，而资金（钱）会解决许多从业者的现实生存、生活和工作问题，使得从业者可以有更多的时间投入到Unix的实践应用中去。学术机构，意味着培养新的人材，同时学术机构也意味新变革的孵化器。

In 1977, the **Berkeley Software Distribution (BSD)** was developed by the Computer Systems Research Group (CSRG) from UC Berkeley, based on **the 6th edition of Unix** from `AT&T`. Since BSD contained Unix code that AT&T owned, AT&T filed a lawsuit (USL v. BSDi) in the early 1990s against the University of California. This strongly limited the development and adoption of BSD.

这段理解：

- （1） 到了1977年，Unix也发展了7年左右的时间。
- （2） 有一家公司，叫CSRG，开发了BSD操作系统，是基于第6版的Unix开发的。
- （4） 由于代码的问题，AT&T与CSRG这家公司打官司，这件事情阻碍了Unix的发展。

In 1983, **Richard Stallman** started the **GNU project** with the goal of creating **a free UNIX-like operating system**. As part of this work, he wrote the GNU General Public License (GPL). By the early 1990s, there was almost enough available software to create a full operating system. However, the **GNU kernel**, called `Hurd`, failed to attract enough development effort, leaving GNU incomplete.

In 1985, Intel released the 80386, the first x86 microprocessor with a 32-bit instruction set and a memory management unit with paging.

到了1985年，硬件有所发展。

In 1987, `MINIX`, a Unix-like system intended for **academic use**, was released by **Andrew S. Tanenbaum** to exemplify the principles conveyed in his textbook, **Operating Systems: Design and Implementation**. While source code for the system was available, modification and redistribution were restricted. In addition, MINIX's 16-bit design was not well adapted to the 32-bit features of the increasingly cheap and popular Intel 386 architecture for personal computers. In the early nineties a commercial UNIX operating system for Intel 386 PCs was too expensive for private users.

到了1987年，Andrew S. Tanenbaum写了一个`MINIX`操作系统，目的是academic use。`MINIX`操作系统的有两个缺点，第一个缺点是不能对代码进行修改和分发，第二的缺点对Intel 386 architecture支持的并不好。

These factors and the lack of a widely adopted, free kernel provided the impetus for Torvalds' starting his project. He has stated that if either the GNU Hurd or 386BSD kernels had been available at the time, he likely would not have written his own.

In 1991, while studying **computer science** at **University of Helsinki**, **Linus Torvalds** began a project that later became the **Linux kernel**. He wrote the program specifically for the hardware he was using and independent of an operating system because he wanted to use the functions of his new PC with an 80386 processor. Development was done on `MINIX` using the **GNU C Compiler**. The GNU C Compiler is still the main choice for compiling Linux today, but can be built with other compilers, such as the Intel C Compiler.

到了1991年，Linus Torvalds开发了Linux kernel，为的是能够利用Intel 386 architecture。

## Linux under the GNU GPL

Torvalds first published the **Linux kernel** under its own licence, which had a restriction on commercial activity.

In 1992, he suggested releasing the kernel under the **GNU General Public License**. He first announced this decision in the release notes of version 0.12.

Around 2000 Torvalds clarified that the used license for the linux kernel is exactly the GPLv2, without the common "or later clause".

In 2007, after years of draft discussions, the **GPLv3** was released and Torvalds and the majority of kernel developers decided against adopting the new license for the linux kernel.

