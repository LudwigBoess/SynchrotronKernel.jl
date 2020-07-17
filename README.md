[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://LudwigBoess.github.io/SynchrotronKernel.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://LudwigBoess.github.io/SynchrotronKernel.jl/dev)
[![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE.md)
[![Build Status](https://travis-ci.org/LudwigBoess/SynchrotronKernel.jl.svg?branch=master)](https://travis-ci.org/LudwigBoess/SynchrotronKernel.jl)
[![codecov.io](https://codecov.io/gh/LudwigBoess/SynchrotronKernel.jl/coverage.svg?branch=master)](https://codecov.io/gh/LudwigBoess/SynchrotronKernel.jl?branch=master)

# SynchrotronKernel.jl

This package computes the first synchrotron function of a frequency ratio ``F(x) = x \int_x^\infty K_{\frac{5}{3}}(t) dt``

## Usage

```julia
F = synchrotron_kernel(x)
```
