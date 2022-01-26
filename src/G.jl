using SpecialFunctions

"""
    G(x::Real)

Computes the second synchrotron function at a given frequency ratio ``x = \\frac{\\nu}{\\nu_0}``.

``G(x) = x K_{\\frac{2}{3}}(x)``
"""
G(x::Real) = x * besselk(2/3, x)