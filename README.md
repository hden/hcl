HCL
===

[![Build Status](https://travis-ci.org/hden/hcl.svg?branch=master)](https://travis-ci.org/hden/hcl)

Ported from https://github.com/hashicorp/hcl

HCL (HashiCorp Configuration Language) is a configuration language built by HashiCorp. The goal of HCL is to build a structured configuration language that is both human and machine friendly for use with command-line tools, but specifically targeted towards DevOps tools, servers, etc.

HCL is also fully JSON compatible. That is, JSON can be used as completely valid input to a system expecting HCL. This helps makes systems interoperable with other systems.

HCL is heavily inspired by libucl, nginx configuration, and others similar.

Resource
--------

* http://www.terraform.io/docs/configuration/syntax.html
* https://github.com/hashicorp/hcl/blob/master/hcl/parse.y

Syntax
------
The complete grammar can be found here, if you're more comfortable reading specifics, but a high-level overview of the syntax and grammar are listed here.

* Single line comments start with # or //

* Multi-line comments are wrapped in /* and */

* Values are assigned with the syntax key = value (whitespace doesn't matter). The value can be any primitive: a string, number, boolean, object, or list.

* Strings are double-quoted and can contain any UTF-8 characters. Example: "Hello, World"

* Numbers are assumed to be base 10. If you prefix a number with 0x, it is treated as a hexadecimal. If it is prefixed with 0, it is treated as an octal. Numbers can be in scientific notation: "1e10".

* Boolean values: true, false, on, off, yes, no.

* Arrays can be made by wrapping it in []. Example: ["foo", "bar", 42]. Arrays can contain primitives and other arrays, but cannot contain objects. Objects must use the block syntax shown below.

* Objects and nested objects are created using the structure shown below:

```go
variable "ami" {
    description = "the AMI to use"
}
```

Licence
-------

The original language is licenced under Mozilla Public License, version 2.0 https://github.com/hashicorp/hcl/blob/master/LICENSE

Whatever that is mine is under MIT.
