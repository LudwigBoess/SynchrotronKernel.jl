| **Documentation**                                                 | **Build Status**                                                                                | **Licence**                                                                                | **Version Status** |
|:-----------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------:| :-----------------------------------------------------------------------------------------------:|:-----------:|
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://LudwigBoess.github.io/SynchrotronKernel.jl/stable) [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://LudwigBoess.github.io/SynchrotronKernel.jl/dev) | [![Build Status](https://travis-ci.org/LudwigBoess/SynchrotronKernel.jl.svg?branch=master)](https://travis-ci.org/LudwigBoess/SynchrotronKernel.jl) [![codecov.io](https://codecov.io/gh/LudwigBoess/SynchrotronKernel.jl/coverage.svg?branch=master)](https://codecov.io/gh/LudwigBoess/SynchrotronKernel.jl?branch=master) | [![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE.md) | ![TagBot](https://github.com/LudwigBoess/SynchrotronKernel.jl/workflows/TagBot/badge.svg) ![CompatHelper](https://github.com/LudwigBoess/SynchrotronKernel.jl/workflows/Run%20CompatHelper/badge.svg) |

# SynchrotronKernel.jl

This package computes the synchrotron kernel for a frequency ratio `x = ν/ν0` and its polarisation components.


```julia
using SynchrotronKernel

# kernel value
F = synchrotron_kernel(x)

# polarisations
F_ort, F_par = synchrotron_polarisation(x)
```
