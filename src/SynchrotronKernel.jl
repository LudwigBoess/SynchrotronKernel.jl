"""
    This implementation is based on the port from GSL to Python by
    J. Michael Burgess for his pynchrotron package:
    https://github.com/grburgess/pynchrotron
"""

module SynchrotronKernel

    include("F.jl")
    include("G.jl")

    export synchrotron_kernel,
           synchrotron_intensity,
           synchrotron_polarisation,
           ℱ, 𝒢

    
    """
        synchrotron_kernel(x::Real)
    
    Computes the first synchrotron function and the polarisation components at a given frequency ratio ``x = \\frac{\\nu}{\\nu_0}``.
    Returns a tuple `(K_tot, K_ort, K_par)`.
    
    ```julia
    K_tot = F(x)
    K_ort = 0.5 * (F(x) + G(x))
    K_par = 0.5 * (F(x) - G(x))
    ```

    ## Synchrotron Functions
    ``F(x) = x \\int_x^\\infty K_{\\frac{5}{3}}(t) dt``

    ``G(x) = x K_{\\frac{2}{3}}(x)``
    
    """
    function synchrotron_kernel(x::Real) 
        # first synchrotron function
        K  = F(x)
        # second synchrotron function
        pK = G(x)

        # orthogonal and parallel polarisation components
        K_ort = 0.5 * (K + pK)
        K_par = 0.5 * (K - pK)

        return K, K_ort, K_par
    end


    """
        synchrotron_intensity(x::Real)
    
    Computes the total synchrotron kernel, without polarisation components.
    Wrapper for [`F`](@ref).

    ``F(x) = x \\int_x^\\infty K_{\\frac{5}{3}}(t) dt``
    """
    synchrotron_intensity(x::Real) = F(x)

    """
        synchrotron_polarisation(x::Real)

    Computes the second synchrotron function at a given frequency ratio ``x = \\frac{\\nu}{\\nu_0}``.
    Returns a tuple of `(K_ort, K_par)`.

    ```julia
    K_ort = 0.5 * (F(x) + G(x))
    K_par = 0.5 * (F(x) - G(x))
    ```

    ## Synchrotron Functions
    ``F(x) = x \\int_x^\\infty K_{\\frac{5}{3}}(t) dt``
    
    ``G(x) = x K_{\\frac{2}{3}}(x)``
    """
    function synchrotron_polarisation(x::Real)
        
        # first synchrotron function
        K  = F(x)
        # second synchrotron function
        pK = G(x)

        K_ort = 0.5 * (K + pK)
        K_par = 0.5 * (K - pK)

        # orthogonal and parallel polarisation components
        return K_ort, K_par
    end

end # module
