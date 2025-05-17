using SpecialFunctions

"""
    G(x::Real)

Computes the second synchrotron function at a given frequency ratio ``x = \\frac{ν}{ν_0}``.

``G(x) = x K_{\\frac{2}{3}}(x)``
"""
G(x::Real) = x * besselk(2/3, x)


"""
    𝒢(x::Real)

Computes the second synchrotron function at a given frequency ratio ``x = \\frac{ν}{ν_0}``.

``G(x) = x K_{\\frac{2}{3}}(x)``

Wrapper for [`G`](@ref).
"""
const 𝒢 = G
