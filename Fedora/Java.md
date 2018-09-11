＃ How to start developing on Java in Fedora

URL: https://fedoramagazine.org/start-developing-java-fedora/

## Installing the compiler and tools

Installing the compiler, or Java Development Kit (JDK), is easy to do in Fedora. At the time of this article, versions 8 and 9 are available. Simply open a terminal and enter:

```bash
sudo dnf install java-1.8.0-openjdk-devel
```

This will install the JDK for version 8. 

For version 9, enter:

```bash
sudo dnf install java-9-openjdk-devel
```

For the developer who requires additional tools and libraries such as `Ant` and `Maven`, the Java Development group is available. To install the suite, enter:

```bash
sudo dnf group install "Java Development"
```

To verify the compiler is installed, run:

```bash
javac -version
```

The output shows the compiler version and looks like this:
```txt
javac 1.8.0_162
```

## Compiling applications

You can use any basic text editor such as `nano`, `vim`, or `gedit` to write applications. This example provides a simple “Hello Fedora” program.

Open your favorite text editor and enter the following:
```java
public class HelloFedora {
      public static void main (String[] args) {
              System.out.println("Hello Fedora!");
      }
}
```

Save the file as `HelloFedora.java`. In the terminal change to the directory containing the file and do:

```bash
javac HelloFedora.java
```

The compiler will complain if it runs into any syntax errors. Otherwise it will simply display the shell prompt beneath.

You should now have a file called `HelloFedora.class`, which is the compiled program. Run it with the following command:

```bash
java HelloFedora
```

And the output will display:

```txt
Hello Fedora!
```
