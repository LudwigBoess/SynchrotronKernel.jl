"""
    This implementation is based on the port from GSL to Python by
    J. Michael Burgess for his pynchrotron package:
    https://github.com/grburgess/pynchrotron
"""

module SynchrotronKernel

    include("F.jl")
    include("G.jl")

    export synchrotron_kernel,
            synchrotron_polarisation

    
    """
        synchrotron_kernel(x::Real)
    
    Computes the first synchrotron function at a given frequency ratio ``x = \\frac{\\nu}{\\nu_0}``.
    
    ``F(x) = x \\int_x^\\infty K_{\\frac{5}{3}}(t) dt``
    
    Wrapper for [`F`](@ref).
    """
    synchrotron_kernel(x::Real) = F(x)


    """
        synchrotron_polarisation(x::Real)

    Computes the second synchrotron function at a given frequency ratio ``x = \\frac{\\nu}{\\nu_0}``.
    Returns a tuple of `(sk_ort, sk_par)`.
    """
    function synchrotron_polarisation(x::Real)
        
        # first synchrotron function
        K  = F(x)
        # second synchrotron function
        pK = G(x)

        sk_ort = 0.5 * (K + pK)
        sk_par = 0.5 * (K - pK)

        return sk_ort, sk_par
    end

end # module
