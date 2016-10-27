{% raw %}

# VSI Templating Language

## Overview

### Why
Visual System Integrator ilang compiler takes the visual representation of a system and generated several projects from it, one per execution context or subsystem.
A project comprises of:
- Generated code in the supported language for that context
- Surrounding build system to generate executable for that context

In order to keep ilang compiler agnostic of the underlying language and build systems for each context, it works through a intermediary language.

### What
VSI Templating language is a mixed syntax language in which the primary syntax consists of target language and the secondary syntax defines the transformation rules. In order to denote secondary syntax, enclose it by double curly braces i.e `{{name}}`.

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
If rule is a section rule and is defined in pair. To do an if check on any node, use the operator `?` and to close the section, use `/`. For instance, consider the following template:
```
{{?decaleint}}
const int i = 0;
{{/declareint}}
```
will be transformed to:
```
const int i = 0;
```
Only if `declareint` node is set. In case of it not being set, the generated code will not contain this section.
- ### If Not
If Not rule is a section rule and is defined in pair. To do an if-not check on any node, use the operator `!` and to close the section, use `/`. For instance, consider the following template:
```
{{!decaleint}}
const int i = 0;
{{/declareint}}
```
will be transformed to:
```
const int i = 0;
```
Only if `declareint` node is NOT set. In case of it being set, the generated code will not contain this section.

- ### Contains
Contains rule is a section rule and is defined in pair. To do an Contains check on any node, use the operator `~` and to close the section, use `/`. For instance, consider the following template:
```
{{~ctx.TEMPLATE}}
const int i = 0;
{{/ctx.TEMPLATE}}
```
will be transformed to:
```
const int i = 0;
```
Only if ctx contains a child node of string type AND the child node contains 'TEMPLATE' i.e. having the value 'TEMPLATE | CONST'. If the child node doesn't contain 'TEMPLATE', the generated code will not have the section.

- ### For
For rule is a section iteration rule and is defined in pair. It will do a for loop for the immediate child nodes and will generate 0 to n amount of section. To do a For loop on a node, use the operator `#` and to close the section, use `/`. For instance, consider the following template:
```
{{#ctx.blocks}}
const int {{name}} = 0;
{{/ctx.blocks}}
```
will be transformed to:
```
const int block1 = 0;
const int block2 = 0;
const int block3 = 0;
```
If ctx contains a blocks child node with child nodes of type list or type object with a name node, each with value block1, block2 and block3. If no child nodes exist then For acts like an If and the generated code will not have the section.

	- `{{.}}`:
		Additionally, to access the current child node, a special syntax of `{{.}}` is used.
	- `{{@}}`:
		In the case if the child node is of type object, the key for the object can be accessed by using `{{@}}`
	- `{{..}}`:
		In the case if a For block is inside another For block, the parent node value can be accessed by using the `{{..}}` syntax. Also, each upper level can be accessed by denoting number of prefix dots i.e `{{....}}` will access the value of the parent node three level up. The same rule apply to Replacement rules as well as `{{@}}` key rule i.e `{{.@}}` will access the key of the parent For loop, `{{..name}}` will access a node of type string or int in the object two level up.

{% endraw %}
