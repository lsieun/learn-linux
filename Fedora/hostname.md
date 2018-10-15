# How to set the hostname on Fedora


## 1. Hostname conventions

To be valid, a hostname may only contain **letters a-z**, **numerals 0-9**, and **dashes (-)**. 

An example is `office-01`. The `FQDN` for that machine might be **office-01.example.com**, where **example.com** is the domain.

Each Fedora system also has **a special reserved name**, localhost, which it sometimes uses to refer to itself. This may sound like overkill, but it’s useful. The localhost lets the system easily access services that it is providing itself. You may also see this reserved name as a FQDN in the form localhost.localdomain.

## 2. Setting the hostname

To set the name of a single, modern Fedora system such as a home computer that isn’t part of a network, use the `hostnamectl` command:

```bash
hostnamectl set-hostname new-name
```

## 3. Getting fancy

The `hostnamectl` utility distinguishes between **three different kinds of names**:

- **The static name** used by default at system bootup
- **The transient name** assigned by network configuration
- **The pretty name** which may be more descriptive, like “Mary’s living room laptop”

**The pretty name** isn’t limited to just the valid characters for **static** or **transient** name.

The command above **sets all names to the same value**. To set **only one of them**, use one or more of the options `--static`, `--transient`, or `--pretty`.

**The static name** is stored in the `/etc/hostname` file for later reference. You can also check the current status of all names with this command:

```bash
hostnamectl status
```

The utility tracks other information, such as icons that may be used to represent the system in graphical interfaces. 
