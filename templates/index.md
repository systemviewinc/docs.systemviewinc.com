{% raw %}

# VSI Templating Language

## Overview

### Why
Visual System Integrator ilang compiler takes the visual representation of a system and generated several projects from it, one per execution context or subsystem.
A project comprises of:
- Generated code in the supported language for that context
- Surrounding build system to generate executable for that context

In order to keep ilang compiler agnostic of the underlying language and build systems for each context, it works through an intermediary language.

### What
VSI Templating language is a mixed syntax language which can traverse through a data-tree and convert arbitrary text files, filling in the missing values. It can also convert a single file into multiple files, each file generated using a sub-tree from the system data-tree. It does it while being agnostic to what those text files are. The Templating syntax is denoted by curly braces i.e `{{name}}`.

## Rules
The secondary syntax for templating is always surrounded by double curly braces.

Anything not surrounded by curly braces is treated as primary syntax of the target language and is not processed.

For instance, consider template A:

```
const int i = 0;
const char *a = "{{name}}";
```

will be transformed to:

```
const int i = 0;
const char *a = "context name";
```

The secondary syntax of templating language refers to a node by it's name. In order to point to a child node of a root node, a period is used i.e `{{parent.child}}`

- ### Replacement
In it's most simplest form, a transformation rule is a replacement operation which replaces a given rule by the compile time value of the system. i.e. {{name}} would be replaced with the context name.

- ### If
If rule is a section rule and is defined in pair. To do an if check on any node, use the operator `if` and to close the section, use `end`. For instance, consider the following template:
```
{{if declareint}}
const int i = 0;
{{end}}
```
will be transformed to:
```
const int i = 0;
```
Only if `declareint` node is set. In case of it not being set, the generated code will not contain this section.
An optional `{{else}}` or `{{else if condition}}` can be used to include alternative code.
```
{{if declareint}}
const int i = {{declareint}};
{{else if declarestr}}
const char *str = "{{declarestr}}";
{{else}}
const int j = 0;
{{end}}
```
Optionally, each condition can be a comparison such as `==` or `!=` i.e `{{if declareint != 10}}`

- ### If Not
If Not rule is a section rule and is defined in pair. To do an if-not check on any node, use the operator `if !` and to close the section, use `end`. For instance, consider the following template:
```
{{if !declareint}}
const int i = 0;
{{end}}
```
will be transformed to:
```
const int i = 0;
```
Only if `declareint` node is NOT set. In case of it being set, the generated code will not contain this section.

- ### If equals
If equals compares a given value or two variables and the block is only Not rule is a section rule and is defined in pair. To do an if-not check on any node, use the operator `if !` and to close the section, use `end`. For instance, consider the following template:
```
{{if declareint == 10}}
const int i = 0;
{{end}}
```
will be transformed to:
```
const int i = 0;
```
Only if `declareint` node is type int and has a value 10. If the declareint is not set or has value other than 10, the block will not be included.

- ### Contains
Contains rule is a section rule and is defined in pair. To do an Contains check on any node, use the operator `contains` and to close the section, use `end`. For instance, consider the following template:
```
{{contains ctx.TEMPLATE}}
const int i = 0;
{{end}}
```
will be transformed to:
```
const int i = 0;
```
Only if ctx contains a child node of string type AND the child node contains 'TEMPLATE' i.e. having the value 'TEMPLATE | CONST'. If the child node doesn't contain 'TEMPLATE', the generated code will not have the section.

- ### For
For rule is a section iteration rule and is defined in pair. It will do a for loop for the immediate child nodes and will generate 0 to n amount of section. To do a For loop on a node, use the operator `for` and to close the section, use `end`. For instance, consider the following template:
```
{{for ctx.blocks}}
const int {{name}} = 0;
{{end}}
```
will be transformed to:
```
const int block1 = 0;
const int block2 = 0;
const int block3 = 0;
```
If ctx contains a blocks child node with child nodes of type list or type object with a name node, each with value block1, block2 and block3. If no child nodes exist then For acts like an If and the generated code will not have the section.
	- Optional syntax:
```
{{for block: ctx.blocks}}
const int {{name}} = 0;
{{end}}
```
The `{{block}}` contains the key if the block is an object and can be used in combination with the `[]` accessor to access the current value i.e `ctx.blocks[block]`.

	#### loop variables:

	Following variables are automatically set when iterating using `for`.

	- `{{loop.value}}`:
		Additionally, to access the current child node, a special syntax of `{{.}}` is used.
	- `{{loop.key}}`:
		In the case if the child node is of type object, the key for the object can be accessed by using `{{loop.key}}`
	- `{{..}}`:
		In the case if a For block is inside another For block, the parent node value can be accessed by using the `{{..}}` syntax. Also, each upper level can be accessed by denoting number of prefix dots i.e `{{....}}` will access the value of the parent node three level up. The same rule apply to Replacement rules as well as `{{loop.key}}` key rule i.e `{{.loop.key}}` will access the key of the parent For loop, `{{..name}}` will access a node of type string or int in the object two level up.

- ### [] accessor
similar to a key-value pair map such as std::map, the value of a node in the tree can be accessed using `[]` accessor. i.e. `blocks["zynq_ps"]`. Multiple levels accessors are supported such as `blocks["zynq_ps"]["arg_1_mem"]` etc.
{% endraw %}
