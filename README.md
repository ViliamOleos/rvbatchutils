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

# `rvcommentcreator`
<details><summary></summary>
<p>

A customisable script that will create a _"header"_ comment for use in code. Below You can see an example of what I mean by _"header"_:
```c
/***************************************** MAIN *****************************************/
```
And that still isn't the full display of all `rvcommentcreator` features, especially in the possible future.

### Usage

The current version in the repository requires You to copy the script to Your project and change the parameters inside of it _(and duplicate it for multiple presets)_. I _may_ make it more independent in the future, however.

Below You can see all of the default parameters:
```cmd
SET "PREFIX=/*"
SET "BAR=~"
SET "POSTFIX=*/"

SET "MIDPREFIX=[ "
SET "MIDPOSTFIX= ]"

SET "COUNT=90"
```
You are free to change them however You want, where the final comment is constructed like this:

`%PREFIX%` `%BAR%%BAR%%BAR%...%BAR%%BAR%%BAR%` `%MIDPREFIX%` MAIN `%MIDPOSTFIX%` `%BAR%%BAR%%BAR%...%BAR%%BAR%%BAR%` `%POSTFIX%`
And the `COUNT` parameter is used for the overall width of the comment in characters.
Through parameter changes, You can stylise Your comments to be Your own and adapt them to any programming language, which is easy to see in this batch example:
```cmd
:::::::::::::::::::::::::::::::::::::::::: MAIN ::::::::::::::::::::::::::::::::::::::::::
```

After all of it, generating is as easy as running the script at any time and inputting the label You want to be displayed in the middle of the comment. That label runtime variable will now be referred to as `label` from now on.

### Restrictions

The parameters _do_ have some restrictions on them, though.
1. `PREFIX` and `POSTFIX` have to be the exact same size.
2. `MIDPREFIX` and `MIDPOSTFIX` have the same relation as in restriction `1`.
3. `COUNT` and `label` must _both_ be even or odd, not mixed.

And only one of those has any runtime burden, but it's there because the entire point of headers will collapse without it _(there would be no good way to centre the label if the comment width and the label cannot agree on having a definitive middle character)_.

</p>
</details> 

# `coolcmd`
<details><summary></summary>
<p>

1. Makes Your cmd look stylish.
2. Makes it easier to see boundaries of program outputs _(literally the whole reason i made this, for a couple of unique tricky situations)_.

What's not to like?

Anyways, the usage is very simple — just run the script. It will launch the coloured command prompt at Your current location _(no matter where the script itself is located)_.

</p>
</details> 
