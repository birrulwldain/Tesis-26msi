# `ZAFU Beamer Theme(Beta)`

Project modified from [liu-qilong/college-beamer](https://github.com/liu-qilong/college-beamer).

For another version, please see the [alpha](https://github.com/ke1ewang/ZAFU-Beamer-Theme/tree/alpha) branch.


## Options & usage

### Switch language

To switch the language, just change the language option in the `zafu` package. For example, to switch to the Chinese language, add `zh` to the package:

```
\usepackage[zh]{zafu}
```

> When select `zh`, please add the `xeCJK`package to the preamble and use [XeLaTeX](https://www.overleaf.com/learn/latex/XeLaTeX) as the typesetting engine.

```
\usepackage{xeCJK}
```

### Page elements
- Cover
![cover](./gallery/slide/cover.png)
- Table of Contents

  At the beginning of each section, the table of contents will be shown with the current chapter highlighted.
![toc](./gallery/slide/table-of-contents.png)
- Sub-section
![ssec](./gallery/slide/sub-section.png)
- Math equation
![math](./gallery/slide/math-equation.png)
- Code block
![code](./gallery/slide/code-block.png)
- End
![end](./gallery/slide/end.png)
