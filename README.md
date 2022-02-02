| **Documentation**                                                 | **Build Status**                                                                                | **Licence**                                                                                | **Version Status** |
|:-----------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------:| :-----------------------------------------------------------------------------------------------:|:-----------:|
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://LudwigBoess.github.io/SynchrotronKernel.jl/stable) [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://LudwigBoess.github.io/SynchrotronKernel.jl/dev) | [![Build Status](https://travis-ci.org/LudwigBoess/SynchrotronKernel.jl.svg?branch=master)](https://travis-ci.org/LudwigBoess/SynchrotronKernel.jl) [![codecov.io](https://codecov.io/gh/LudwigBoess/SynchrotronKernel.jl/coverage.svg?branch=master)](https://codecov.io/gh/LudwigBoess/SynchrotronKernel.jl?branch=master) | [![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE.md) | ![TagBot](https://github.com/LudwigBoess/SynchrotronKernel.jl/workflows/TagBot/badge.svg) ![CompatHelper](https://github.com/LudwigBoess/SynchrotronKernel.jl/workflows/Run%20CompatHelper/badge.svg) |

# SynchrotronKernel.jl

This package computes the synchrotron kernel for a frequency ratio `x = ν/ν0` and its polarisation components.


```julia
using SynchrotronKernel

"""
    General usage
"""
# kernel value and polarisation components
K, K_ort, K_par = synchrotron_kernel(x)

# only kernel value
K = synchrotron_intensity(x)
# or
K = ℱ(x)

# polarisations
K_ort, K_par = synchrotron_polarisation(x)

"""
    Synchrotron Functions
"""

# first synchrotron function
K = ℱ(x)

# second synchrotron function
K = 𝒢(x)
```
