| **Documentation**                                                 | **Build Status**                                                                                | **Licence**                                                                                | **Version Status** |
|:-----------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------:| :-----------------------------------------------------------------------------------------------:|:-----------:|
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://LudwigBoess.github.io/SynchrotronKernel.jl/stable) [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://LudwigBoess.github.io/SynchrotronKernel.jl/dev) | [![Build Status](https://travis-ci.org/LudwigBoess/SynchrotronKernel.jl.svg?branch=master)](https://travis-ci.org/LudwigBoess/SynchrotronKernel.jl) [![codecov.io](https://codecov.io/gh/LudwigBoess/SynchrotronKernel.jl/coverage.svg?branch=master)](https://codecov.io/gh/LudwigBoess/SynchrotronKernel.jl?branch=master) |  [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE.md) | ![TagBot](https://github.com/LudwigBoess/SynchrotronKernel.jl/workflows/TagBot/badge.svg) ![CompatHelper](https://github.com/LudwigBoess/SynchrotronKernel.jl/workflows/Run%20CompatHelper/badge.svg) [![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl) |

# SynchrotronKernel.jl

This package computes the synchrotron kernel for a frequency ratio `x = ν/ν0` and its polarisation components.

It is based on [pynchrotron](https://github.com/grburgess/pynchrotron) by J. Michael Burgess as used in [Burgess et al (2019)](https://www.nature.com/articles/s41550-019-0911-z?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+natastron%2Frss%2Fcurrent+%28Nature+Astronomy%29&utm_content=Google+Feedfetcher) and is a re-implementation of the [GSL](https://www.gnu.org/software/libc/) synchrotron functions.

# Usage

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
