# rvbatchutils
Collection of drag-and-drop batch utilities for Your projects!
These are written _entirely_ in batch and that fact can be utilised to its fullest potential)

Currently contains **3** utilities, You can see them listed here:
| Complexity |       Utility      |   Status  | Short description |
|------------|--------------------|-----------|-------------------|
| 1.         | `baumeister`       | WIP       | Simple, but powerful and customisable persistent build system adaptable to any language and tooling. |
| 2.         | `rvcommentcreator` | Usable    | A tiny tool for quickly creating header comments. May get more features in the future. |
| 3.         | `coolcmd`          | _perfect_ | An afterthought script I wrote for quickly launching a coloured command prompt, which helps with seeing where output of a program ends sometimes. |

> [!IMPORTANT]
> This repository still needs much work.

# `baumeister`

<details><summary></summary>
<p>

</p>
</details>

# `rvcommentcreator`

<details><summary></summary>
<p>

A customisable script that will create a _"header"_ comment for use in code. Below You can see an example of what I mean by _"header"_:

```c
/***************************************** MAIN *****************************************/
```

It's a big comment with a label in the middle to signify a specific section of Your code, making it easier to read and allowing you to separate things that really _do_ need to be separated.

And there are still a few more things that `rvcommentcreator` cam do.

### Usage

The current version in the repository requires You to copy the script to Your project and change the parameters inside of it _(duplicate it for multiple presets)_. I _may_ make it independent in the future, but for now, that's how we work.

Below You can see all of the default parameters _(preset for the C programming language)_:

```cmd
SET "PREFIX=/*"
SET "BAR=~"
SET "POSTFIX=*/"

SET "MIDPREFIX=[ "
SET "MIDPOSTFIX= ]"

SET "COUNT=80"
```

You are free to change them however You want, where the final comment is constructed like this:

`%PREFIX%` `%BAR%%BAR%%BAR%...%BAR%%BAR%%BAR%` `%MIDPREFIX%` `label` `%MIDPOSTFIX%` `%BAR%%BAR%%BAR%...%BAR%%BAR%%BAR%` `%POSTFIX%`

The `COUNT` parameter is used for the overall width of the comment in characters.

Through parameter changes, You can stylise Your comments to be Your own and adapt them to almost any programming language, which is easy to see in this batch example:

```cmd
:::::::::::::::::::::::::::::::::::::::::: MAIN ::::::::::::::::::::::::::::::::::::::::::
```

After all of it, generating is as easy as running the script at any time and inputting the label You want to be displayed in the middle of the comment.

### Restrictions

The parameters _do_ have some restrictions on them, though.
1. `BAR` is always a single character long.
2. `PREFIX` and `POSTFIX` have to be the exact same size.
3. `MIDPREFIX` and `MIDPOSTFIX` have the same relation as in restriction `1`.
4. `COUNT` and `label` must have the same parity _(property of being even or odd)_.

Oh, and of course, common sense applies ^

Only the `4`th rule has any runtime burden. In cases against the rule there would be no way to centre the label in any way, since they would disagree on whether the centre would be a character or between characters.

### Additional Features

Beyond what You have seen above in the text, I've recently added the `-c` flag feature that will automatically copy the generated comment into the clipboard for You if passed to the program. 

</p>
</details> 

# `coolcmd`

<details><summary></summary>
<p>

This script will launch a stylised `cmd` using the `prompt` command with nice colours. Useful for easily seeing where command outputs start & end, as well as just for eye candy)

It has a few features of its own, like the `-A` flag launching `cmd` with administrator priviliges.

It is recommended to launch the script using the Windows Explorer `Ctrl`+`L` bar or the `Win`+`R` Run Menu, as well as any other independent method, rather than through a `cmd` as a parent. Perhaps can be added to PATH...

</p>
</details> 
