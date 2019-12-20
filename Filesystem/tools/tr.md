# tr—Transliterate or Delete Characters

<!-- TOC -->

- [1. Intro](#1-intro)
- [2. Example](#2-example)
  - [2.1. MS-DOS text 2 Unix-style text](#21-ms-dos-text-2-unix-style-text)
  - [2.2. delete repeated characters](#22-delete-repeated-characters)
  - [2.3. ROT 13: The Not-So-Secret Decoder Ring](#23-rot-13-the-not-so-secret-decoder-ring)

<!-- /TOC -->

## 1. Intro

The `tr` program is used to **transliterate characters**. We can think of this as a sort of **character-based search-and-replace operation**. Transliteration is the process of changing characters from one alphabet to another.

For example, converting characters from lowercase to uppercase is transliteration.

```bash
$ echo "lowercase letters" | tr a-z A-Z
LOWERCASE LETTERS
```

As we can see, `tr` operates on **standard input** and outputs its results on **standard output**. `tr` accepts **two arguments**: **a set of characters** to convert from and **a corresponding set of characters** to convert to.

**Character sets** may be expressed in one of **three ways**.

- An enumerated list. For example, `ABCDEFGHIJKLMNOPQRSTUVWXYZ`.
- A character range. For example, `A-Z`. Note that this method is sometimes subject to the same issues as other commands because of the locale collation order and thus should be used with caution.
- POSIX character classes. For example, `[:upper:]`.

In most cases, both character sets should be of equal length; however, it is possible for the first set to be larger than the second, particularly if we want to convert multiple characters to a single character.

```bash
$ echo "lowercase letters" | tr [:lower:] A
AAAAAAAAA AAAAAAA
```

## 2. Example

### 2.1. MS-DOS text 2 Unix-style text

In addition to transliteration, `tr` allows characters to simply be deleted from the input stream. To perform this conversion of converting MS-DOS text files to Unix-style text, carriage return characters need to be removed from the end of each line. This can be performed with `tr` as follows:

```bash
tr -d '\r' < dos_file > unix_file
```

### 2.2. delete repeated characters

Using the `-s` option, `tr` can “squeeze” (delete) repeated instances of a character.

```bash
$ echo "aaabbbccc" | tr -s ab
abccc
```

Note that the repeating characters must be adjoining. If they are not, the squeezing will have no effect.

```bash
$ echo "abcabcabc" | tr -s ab
abcabcabc
```

### 2.3. ROT 13: The Not-So-Secret Decoder Ring

One amusing use of `tr` is to perform ROT13 encoding of text. ROT13 is a trivial type of encryption based on a simple substitution cipher. Calling ROT13 encryption is being generous; text obfuscation is more accurate. It is used sometimes on text to obscure potentially offensive content. The method simply moves each character 13 places up the alphabet. Because this is halfway up the possible 26 characters, performing the algorithm a second time on the text restores it to its original form.

Use the following to perform this encoding with `tr`:

```bash
$ echo "secret text" | tr a-zA-Z n-za-mN-ZA-M
frperg grkg
```

Performing the same procedure a second time results in the following translation:

```bash
$ echo "frperg grkg" | tr a-zA-Z n-za-mN-ZA-M
secret text
```
